import 'dart:convert';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ImportBatchesScreen extends StatefulWidget {
  const ImportBatchesScreen({super.key});

  @override
  State<ImportBatchesScreen> createState() => _ImportBatchesScreenState();
}

class _ImportBatchesScreenState extends State<ImportBatchesScreen> {
  final sb = Supabase.instance.client;

  bool _loading = true;
  List<Map<String, dynamic>> _batches = [];

  // current batch details
  Map<String, dynamic>? _current;
  bool _busy = false;

  // column mapping per upload (simple MVP)
  String? _colName;
  String? _colPhone;
  String? _colPcf;

  // distribution
  List<Map<String, dynamic>> _agents = [];
  final Set<String> _selectedAgentIds = {};
  String _strategy = 'round_robin';

  @override
  void initState() {
    super.initState();
    _loadBatches();
    _loadAgents();
  }

  Future<void> _loadAgents() async {
    final rows = await sb.from('profiles').select('id, full_name').eq('role', 'agent').order('created_at');
    setState(() {
      _agents = (rows as List).cast<Map<String, dynamic>>();
      _selectedAgentIds
        ..clear()
        ..addAll(_agents.map((a) => a['id'] as String));
    });
  }

  Future<void> _loadBatches() async {
    setState(() => _loading = true);
    final rows = await sb
        .from('import_batches')
        .select('id, status, total_rows, ready_count, missing_phone_count, invalid_phone_count, duplicate_phone_count, created_at')
        .order('created_at', ascending: false);
    setState(() {
      _batches = (rows as List).cast<Map<String, dynamic>>();
      _loading = false;
    });
  }

  Future<void> _createBatch() async {
    setState(() => _busy = true);
    try {
      final row = await sb
          .from('import_batches')
          .insert({'status': 'draft'})
          .select('id, status, total_rows, ready_count, missing_phone_count, invalid_phone_count, duplicate_phone_count, created_at')
          .single();

      setState(() => _current = row);
      await _loadBatches();
      _toast('Batch created ✅');
    } catch (e) {
      _toast('Create batch failed: $e');
    } finally {
      setState(() => _busy = false);
    }
  }

  Future<void> _selectBatch(Map<String, dynamic> batch) async {
    setState(() => _current = batch);
  }

  // very simple CSV: comma split; MVP rule: don’t include commas inside fields
  List<String> _splitLine(String line) => line.split(',').map((s) => s.trim()).toList();

  Future<void> _uploadCsvToBatch() async {
    if (_current == null) return _toast('Select or create a batch first.');
    if ((_current!['status'] as String) != 'draft') return _toast('Batch is finalized. Create a new batch.');

    final res = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['csv'],
      withData: true,
    );
    if (res == null || res.files.isEmpty) return;

    final file = res.files.first;
    final bytes = file.bytes;
    if (bytes == null) return _toast('Could not read file bytes.');

    final text = utf8.decode(bytes);
    final lines = const LineSplitter().convert(text).where((l) => l.trim().isNotEmpty).toList();
    if (lines.length < 2) return _toast('CSV needs headers + at least 1 row.');

    final headers = _splitLine(lines.first);
    final data = lines.skip(1).map(_splitLine).toList();

    // auto-detect
    String? findHeader(List<String> opts) {
      for (final h in headers) {
        final low = h.toLowerCase();
        if (opts.any((o) => low == o)) return h;
      }
      return null;
    }

    _colName ??= findHeader(['name', 'full_name', 'fullname']) ?? (headers.isNotEmpty ? headers.first : null);
    _colPhone ??= findHeader(['phone', 'phone_number', 'number', 'mobile']) ?? (headers.length > 1 ? headers[1] : null);
    _colPcf ??= findHeader(['pcf', 'cell', 'group', 'fellowship']) ?? (headers.length > 2 ? headers[2] : null);

    final iName = headers.indexOf(_colName ?? '');
    final iPhone = headers.indexOf(_colPhone ?? '');
    final iPcf = headers.indexOf(_colPcf ?? '');

    if (iPhone < 0) return _toast('Could not detect Phone column. Rename it to "phone" or "phone_number".');

    setState(() => _busy = true);
    try {
      final batchId = _current!['id'] as String;

      final payload = <Map<String, dynamic>>[];
      for (int idx = 0; idx < data.length; idx++) {
        final row = data[idx];
        final phone = (row.length > iPhone) ? row[iPhone].trim() : '';
        final name = (iName >= 0 && row.length > iName) ? row[iName].trim() : '';
        final pcf = (iPcf >= 0 && row.length > iPcf) ? row[iPcf].trim() : '';

        payload.add({
          'batch_id': batchId,
          'source_file': file.name,
          'row_index': idx,
          'name': name,
          'phone': phone,
          'pcf': pcf,
          'status': 'ready',
        });
      }

      await sb.from('import_rows').insert(payload);

      // classify duplicates + update stats
      await sb.rpc('mark_batch_duplicates', params: {'_batch': batchId});

      // refresh current row from DB
      final refreshed = await sb
          .from('import_batches')
          .select('id, status, total_rows, ready_count, missing_phone_count, invalid_phone_count, duplicate_phone_count, created_at')
          .eq('id', batchId)
          .single();

      setState(() => _current = refreshed);
      await _loadBatches();
      _toast('Uploaded ${file.name} ✅');
    } catch (e) {
      _toast('Upload failed: $e');
    } finally {
      setState(() => _busy = false);
    }
  }

  Future<void> _finalizeAndDistribute() async {
    if (_current == null) return _toast('Select a batch.');
    if ((_current!['status'] as String) != 'draft') return _toast('Batch already finalized.');
    if (_selectedAgentIds.isEmpty) return _toast('Select at least 1 agent.');

    final batchId = _current!['id'] as String;

    setState(() => _busy = true);
    try {
      final res = await sb.rpc('finalize_import_batch', params: {
        '_batch': batchId,
        '_assignment_title': 'Batch ${batchId.substring(0, 6)}',
        '_agent_ids': _selectedAgentIds.toList(),
        '_strategy': _strategy,
      });

      _toast('Finalized ✅ Assignment: $res');

      // refresh batch
      final refreshed = await sb
          .from('import_batches')
          .select('id, status, total_rows, ready_count, missing_phone_count, invalid_phone_count, duplicate_phone_count, created_at')
          .eq('id', batchId)
          .single();

      setState(() => _current = refreshed);
      await _loadBatches();
    } catch (e) {
      _toast('Finalize failed: $e');
    } finally {
      setState(() => _busy = false);
    }
  }

  void _toast(String msg) {
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) return const Center(child: CircularProgressIndicator());

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: FilledButton.icon(
                  onPressed: _busy ? null : _createBatch,
                  icon: const Icon(Icons.add),
                  label: const Text('New Batch'),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: _busy ? null : _uploadCsvToBatch,
                  icon: const Icon(Icons.upload_file),
                  label: const Text('Upload CSV'),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),

          _current == null
              ? const Text('Select a batch below (or create a new one).')
              : _batchCard(_current!, isCurrent: true),

          const SizedBox(height: 12),
          Expanded(
            child: Row(
              children: [
                Expanded(child: _batchesList()),
                const SizedBox(width: 12),
                Expanded(child: _distributePanel()),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _batchesList() {
    return Card(
      child: ListView.separated(
        itemCount: _batches.length,
        separatorBuilder: (context, index) => const Divider(height: 1),
        itemBuilder: (context, i) {
          final b = _batches[i];
          final isCurrent = _current != null && b['id'] == _current!['id'];
          return ListTile(
            selected: isCurrent,
            title: Text('Batch ${ (b['id'] as String).substring(0, 6) } • ${b['status']}'),
            subtitle: Text('Ready ${b['ready_count']}/${b['total_rows']}'),
            onTap: () => _selectBatch(b),
          );
        },
      ),
    );
  }

  Widget _distributePanel() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: ListView(
          children: [
            const Text('Distribute', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
            const SizedBox(height: 8),

            const Text('Strategy'),
            DropdownButton<String>(
              value: _strategy,
              isExpanded: true,
              items: const [
                DropdownMenuItem(value: 'round_robin', child: Text('Random (Round robin)')),
                DropdownMenuItem(value: 'by_pcf', child: Text('By PCF')),
                DropdownMenuItem(value: 'numeric', child: Text('Numeric (in order)')),
              ],
              onChanged: _busy ? null : (v) => setState(() => _strategy = v ?? 'round_robin'),
            ),

            const SizedBox(height: 12),
            const Text('Agents'),
            const SizedBox(height: 6),
            if (_agents.isEmpty)
              const Text('No agents found yet.')
            else
              ..._agents.map((a) {
                final id = a['id'] as String;
                final name = (a['full_name'] as String?) ?? 'Agent';
                final checked = _selectedAgentIds.contains(id);
                return CheckboxListTile(
                  value: checked,
                  title: Text(name),
                  subtitle: Text(id),
                  onChanged: _busy
                      ? null
                      : (v) {
                          setState(() {
                            if (v == true) {
                              _selectedAgentIds.add(id);
                            } else {
                              _selectedAgentIds.remove(id);
                            }
                          });
                        },
                );
              }),

            const SizedBox(height: 12),
            FilledButton(
              onPressed: _busy ? null : _finalizeAndDistribute,
              child: Text(_busy ? 'Working...' : 'Finalize & Distribute'),
            ),

            const SizedBox(height: 8),
            const Text(
              'MVP note: CSV should be simple comma-separated.\nAvoid commas inside fields.',
              style: TextStyle(fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }

  Widget _batchCard(Map<String, dynamic> b, {required bool isCurrent}) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${isCurrent ? "Current " : ""}Batch ${(b['id'] as String).substring(0, 6)} • ${b['status']}',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 12,
              runSpacing: 6,
              children: [
                _chip('Total', '${b['total_rows']}'),
                _chip('Ready', '${b['ready_count']}'),
                _chip('Missing phone', '${b['missing_phone_count']}'),
                _chip('Invalid', '${b['invalid_phone_count']}'),
                _chip('Duplicates', '${b['duplicate_phone_count']}'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _chip(String label, String value) {
    return Chip(label: Text('$label: $value'));
  }
}
