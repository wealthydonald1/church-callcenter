import 'package:connectivity_plus/connectivity_plus.dart';
import 'local_db.dart';

class OfflineStatus {
  final LocalDb db;

  OfflineStatus(this.db);

  Future<bool> isOffline() async {
    final results = await Connectivity().checkConnectivity();
    return results.contains(ConnectivityResult.none);
  }

  Future<int> pendingCount() async {
    final rows = await (db.select(db.outboxCallLogs)
          ..where((t) => t.status.equals('pending')))
        .get();
    return rows.length;
  }
}
