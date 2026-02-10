import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class IssuesScreen extends StatefulWidget {
  const IssuesScreen({super.key});

  @override
  State<IssuesScreen> createState() => _IssuesScreenState();
}

class _IssuesScreenState extends State<IssuesScreen> {
  final sb = Supabase.instance.client;

  bool _loading = true;
  List<Map<String, dynamic>> _issues = [];
  String? _pcf;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    setState(() => _loading = true);

    var q = sb
        .from('call_logs')
        .select('id, contact_name, phone, pcf, issue_notes, created_at')
        .eq('tag', 'ISSUE')
        .eq('status', 'open');

    if (_pcf != null && _pcf!.isNotEmpty) {
      q = q.eq('pcf', _pcf!);
    }

    final rows = await q.order('created_at', ascending: false);

    setState(() {
      _issues = (rows as List).cast<Map<String, dynamic>>();
      _loading = false;
    });
  }

  Future<void> _resolve(String id) async {
    await sb.from('call_logs').update({
      'status': 'resolved',
      'resolved_at': DateTime.now().toUtc().toIso8601String(),
    }).eq('id', id);

    await _load();
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) return const Center(child: CircularProgressIndicator());

    final pcfs = _issues
        .map((e) => (e['pcf'] as String?) ?? '')
        .where((p) => p.isNotEmpty)
        .toSet()
        .toList()
      ..sort();

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            children: [
              const Text('PCF:'),
              const SizedBox(width: 10),
              Expanded(
                child: DropdownButton<String>(
                  value: _pcf,
                  isExpanded: true,
                  hint: const Text('All'),
                  items: [
                    const DropdownMenuItem(value: null, child: Text('All')),
                    ...pcfs.map((p) => DropdownMenuItem(value: p, child: Text(p))),
                  ],
                  onChanged: (v) async {
                    setState(() => _pcf = v);
                    await _load();
                  },
                ),
              ),
              IconButton(onPressed: _load, icon: const Icon(Icons.refresh)),
            ],
          ),
          const SizedBox(height: 12),
          Expanded(
            child: _issues.isEmpty
                ? const Center(child: Text('No open issues 🎉'))
                : ListView.separated(
                    itemCount: _issues.length,
                    separatorBuilder: (context, index) => const Divider(),
                    itemBuilder: (context, i) {
                      final it = _issues[i];
                      return ListTile(
                        title: Text('${it['contact_name'] ?? '-'} (${it['pcf'] ?? '-'})'),
                        subtitle: Text('${it['phone'] ?? '-'}\n${it['issue_notes'] ?? ''}'),
                        isThreeLine: true,
                        trailing: FilledButton(
                          onPressed: () => _resolve(it['id'] as String),
                          child: const Text('Resolve'),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
