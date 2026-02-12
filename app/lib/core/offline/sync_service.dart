import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:drift/drift.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'local_db.dart';

class SyncService {
  final LocalDb db;
  final SupabaseClient sb;

  StreamSubscription? _sub;
  bool _running = false;

  SyncService({required this.db, required this.sb});

  void start() {
    _sub?.cancel();
    _sub = Connectivity().onConnectivityChanged.listen((_) => trySync());
    trySync();
  }

  Future<void> trySync() async {
    if (_running) return;
    _running = true;

    try {
      // Newer connectivity_plus may return List<ConnectivityResult>
      final results = await Connectivity().checkConnectivity();
      if (results.contains(ConnectivityResult.none)) return;

      final user = sb.auth.currentUser;
      if (user == null) return;

      final pending = await (db.select(db.outboxCallLogs)
            ..where((t) => t.status.equals('pending'))
            ..limit(25))
          .get();

      for (final item in pending) {
        try {
          await sb.from('call_logs').upsert({
            'assignment_item_id': item.assignmentItemId,
            'assignment_id': item.assignmentId,
            'contact_id': item.contactId,
            'contact_name': item.contactName,
            'phone': item.phone,
            'pcf': item.pcf,
            'outcome': item.outcome,
            'tag': item.tag,
            'issue_notes': item.tag == 'ISSUE' ? item.notes : null,
            'created_by': user.id,
            'created_at': item.createdAt.toIso8601String(),
          }, onConflict: 'assignment_item_id');

          await sb.from('assignment_items').update({'status': 'done'}).eq('id', item.assignmentItemId);

          await (db.update(db.outboxCallLogs)..where((t) => t.localId.equals(item.localId)))
              .write(const OutboxCallLogsCompanion(status: Value('synced')));
        } catch (e) {
          await (db.update(db.outboxCallLogs)..where((t) => t.localId.equals(item.localId))).write(
            OutboxCallLogsCompanion(
              status: const Value('failed'),
              retryCount: Value(item.retryCount + 1),
              lastError: Value(e.toString()),
            ),
          );
        }
      }

      // retry failed (max 5 tries)
      await (db.update(db.outboxCallLogs)
            ..where((t) => t.status.equals('failed') & t.retryCount.isSmallerThanValue(5)))
          .write(const OutboxCallLogsCompanion(status: Value('pending')));
    } finally {
      _running = false;
    }
  }

  void dispose() {
    _sub?.cancel();
  }
}
