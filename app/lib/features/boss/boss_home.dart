import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../core/offline/role_cache.dart';
import 'issues_screen.dart';
import 'import_batches_screen.dart';

class BossHome extends StatefulWidget {
  const BossHome({super.key});

  @override
  State<BossHome> createState() => _BossHomeState();
}

class _BossHomeState extends State<BossHome> {
  DateTime? _lastBackPressed;

  bool _shouldExitOrPop() {
    final router = GoRouter.of(context);

    if (router.canPop()) {
      router.pop();
      return false;
    }

    final now = DateTime.now();
    if (_lastBackPressed == null ||
        now.difference(_lastBackPressed!) > const Duration(seconds: 2)) {
      _lastBackPressed = now;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Press back again to exit'),
          duration: Duration(seconds: 2),
        ),
      );
      return false;
    }

    return true;
  }

  @override
  Widget build(BuildContext context) {
    return PopScope<void>(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;
        final shouldExit = _shouldExitOrPop();
        if (shouldExit) {
          Navigator.of(context).pop();
        }
      },
      child: DefaultTabController(
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
      ),
    );
  }
}
