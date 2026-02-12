import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../core/offline/role_cache.dart';
import 'issues_screen.dart';
import 'import_batches_screen.dart';

class BossHome extends StatelessWidget {
  const BossHome({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Boss / Admin'),
          actions: [
            IconButton(
              tooltip: 'Logout',
              icon: const Icon(Icons.logout),
              onPressed: () async {
                await Supabase.instance.client.auth.signOut();
                await RoleCache.clear();
                // No manual navigation: router redirect handles it (offline-safe).
              },
            ),
          ],
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Open Issues'),
              Tab(text: 'Imports'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            IssuesScreen(),
            ImportBatchesScreen(),
          ],
        ),
      ),
    );
  }
}
