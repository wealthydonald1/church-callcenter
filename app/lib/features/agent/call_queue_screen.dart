import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../core/offline/local_db.dart';
import '../../core/offline/sync_service.dart';

class CallQueueScreen extends StatefulWidget {
  const CallQueueScreen({super.key});

  @override
  State<CallQueueScreen> createState() => _CallQueueScreenState();
}

class _CallQueueScreenState extends State<CallQueueScreen> {
  final sb = Supabase.instance.client;

  late final LocalDb _db;
  late final SyncService _sync;

  Map<String, dynamic>? _item;
  bool _loading = true;

  final _notes = TextEditingController();
  String _outcome = 'reached';
  String _tag = 'OK';
  bool _saving = false;

  @override
  void dispose() {
    _notes.dispose();
    _sync.dispose();
    _db.close();
    super.dispose();
  }

  Map<String, dynamic> _mapCacheRowToItem(CachedQueueItem row) {
    return {
      'id': row.assignmentItemId,
      'assignment_id': row.assignmentId,
      'contact_id': row.contactId,
      'order_index': row.sortIndex,
      'status': row.done ? 'done' : 'pending',
      'contacts': {'name': row.name, 'phone': row.phone, 'pcf': row.pcf ?? ''},
    };
  }

  Future<void> _cacheServerQueue(List<dynamic> rows) async {
    final now = DateTime.now();
    await _db.batch((b) {
      for (final r in rows) {
        final m = r as Map<String, dynamic>;
        final contact = (m['contacts'] as Map<String, dynamic>?) ?? {};
        b.insert(
          _db.cachedQueueItems,
          CachedQueueItemsCompanion.insert(
            assignmentItemId: m['id'] as String,
            assignmentId: m['assignment_id'] as String,
            contactId: m['contact_id'] as String,
            name: (contact['name'] as String?) ?? '',
            phone: (contact['phone'] as String?) ?? '',
            pcf: Value((contact['pcf'] as String?) ?? ''),
            sortIndex: m['order_index'] as int,
            updatedAt: now,
          ),
          mode: InsertMode.insertOrReplace,
        );
      }
    });
  }

  Future<Map<String, dynamic>?> _loadNextFromCache() async {
    final row =
        await (_db.select(_db.cachedQueueItems)
              ..where((t) => t.done.equals(false))
              ..orderBy([(t) => OrderingTerm(expression: t.sortIndex)])
              ..limit(1))
            .getSingleOrNull();

    return row == null ? null : _mapCacheRowToItem(row);
  }

  Future<void> _refreshQueueFromServer() async {
    final uid = sb.auth.currentUser?.id;
    if (uid == null) return;

    final rows = await sb
        .from('assignment_items')
        .select(
          'id, assignment_id, contact_id, order_index, status, contacts(name, phone, pcf)',
        )
        .eq('assigned_to', uid)
        .eq('status', 'pending')
        .order('order_index', ascending: true)
        .limit(200);

    await _cacheServerQueue(rows);
  }

  Future<void> _loadNext() async {
    setState(() => _loading = true);

    final uid = sb.auth.currentUser?.id;
    if (uid == null) {
      if (mounted) context.go('/login');
      return;
    }

    try {
      await _refreshQueueFromServer();
    } catch (_) {
      // offline: ignore and use cache
    }

    final next = await _loadNextFromCache();

    if (!mounted) return;
    setState(() {
      _item = next;
      _notes.clear();
      _outcome = 'reached';
      _tag = 'OK';
      _loading = false;
    });
  }

  Future<void> _callNumber(String phone) async {
    final uri = Uri.parse('tel:$phone');
    if (!await launchUrl(uri)) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Could not open phone dialer.')),
      );
    }
  }

  Future<void> _saveAndNext() async {
    if (_item == null) return;

    setState(() => _saving = true);
    try {
      final itemId = _item!['id'] as String;
      final assignmentId = _item!['assignment_id'] as String;
      final contact = _item!['contacts'] as Map<String, dynamic>;
      final contactId = _item!['contact_id'] as String;

      final name = (contact['name'] as String?) ?? '';
      final phone = (contact['phone'] as String?) ?? '';
      final pcf = (contact['pcf'] as String?) ?? '';

      // 1) Outbox first (offline safe)
      await _db
          .into(_db.outboxCallLogs)
          .insert(
            OutboxCallLogsCompanion.insert(
              assignmentItemId: itemId,
              assignmentId: assignmentId,
              contactId: contactId,
              contactName: name,
              phone: phone,
              pcf: Value(pcf),
              outcome: _outcome,
              tag: _tag,
              notes: Value(_tag == 'ISSUE' ? _notes.text.trim() : null),
              createdAt: DateTime.now(),
            ),
          );

      // 2) Mark cached as done
      await (_db.update(_db.cachedQueueItems)
            ..where((t) => t.assignmentItemId.equals(itemId)))
          .write(const CachedQueueItemsCompanion(done: Value(true)));

      // 3) Best-effort sync
      await _sync.trySync();

      // 4) Next item
      await _loadNext();
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Save failed: $e')));
    } finally {
      if (mounted) setState(() => _saving = false);
    }
  }

  @override
  void initState() {
    super.initState();
    _db = LocalDb();
    _sync = SyncService(db: _db, sb: sb)..start();
    _loadNext();
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    if (_item == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Call Queue')),
        body: const Center(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Text('No pending calls assigned to you.'),
          ),
        ),
      );
    }

    final contact = _item!['contacts'] as Map<String, dynamic>;
    final name = (contact['name'] as String?) ?? 'Unknown';
    final phone = (contact['phone'] as String?) ?? '';
    final pcf = (contact['pcf'] as String?) ?? '';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Call Queue'),
        actions: [
          IconButton(
            onPressed: _saving ? null : _loadNext,
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            Text(
              name,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 6),
            Text('PCF: ${pcf.isEmpty ? "-" : pcf}'),
            const SizedBox(height: 6),
            Row(
              children: [
                Expanded(child: Text(phone.isEmpty ? '-' : phone)),
                const SizedBox(width: 12),
                FilledButton.icon(
                  onPressed: phone.isEmpty ? null : () => _callNumber(phone),
                  icon: const Icon(Icons.call),
                  label: const Text('Call'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text('Outcome'),
            DropdownButton<String>(
              value: _outcome,
              isExpanded: true,
              items: const [
                DropdownMenuItem(value: 'reached', child: Text('Reached')),
                DropdownMenuItem(value: 'no_answer', child: Text('No answer')),
                DropdownMenuItem(value: 'busy', child: Text('Busy')),
                DropdownMenuItem(
                  value: 'switched_off',
                  child: Text('Switched off'),
                ),
                DropdownMenuItem(
                  value: 'wrong_number',
                  child: Text('Wrong number'),
                ),
              ],
              onChanged: _saving
                  ? null
                  : (v) => setState(() => _outcome = v ?? 'reached'),
            ),
            const SizedBox(height: 12),
            const Text('Tag'),
            SegmentedButton<String>(
              segments: const [
                ButtonSegment(value: 'OK', label: Text('OK')),
                ButtonSegment(value: 'ISSUE', label: Text('ISSUE')),
              ],
              selected: {_tag},
              onSelectionChanged: _saving
                  ? null
                  : (s) => setState(() => _tag = s.first),
            ),
            const SizedBox(height: 12),
            if (_tag == 'ISSUE') ...[
              const Text('Issue description'),
              const SizedBox(height: 6),
              TextField(
                controller: _notes,
                maxLines: 4,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Explain the issue...',
                ),
              ),
              const SizedBox(height: 12),
            ],
            FilledButton(
              onPressed: _saving ? null : _saveAndNext,
              child: Text(_saving ? 'Saving...' : 'Save & Next'),
            ),
          ],
        ),
      ),
    );
  }
}
