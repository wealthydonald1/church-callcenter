import 'package:flutter/material.dart';

class BossHome extends StatelessWidget {
  const BossHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Boss Dashboard')),
      body: const Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Summary', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
            SizedBox(height: 12),
            Text('• Total calls'),
            Text('• Reached vs Not reached'),
            Text('• Pressing issues (Open)'),
            Text('• Resolved today'),
          ],
        ),
      ),
    );
  }
}
