import 'package:flutter/material.dart';
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
