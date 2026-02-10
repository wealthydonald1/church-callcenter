import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../auth/auth_service.dart';

class BossHome extends StatelessWidget {
  const BossHome({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = AuthService();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Boss Dashboard'),
        actions: [
          IconButton(
            onPressed: () async {
              await auth.signOut();
              if (context.mounted) context.go('/login');
            },
            icon: const Icon(Icons.logout),
          )
        ],
      ),
      body: const Padding(
        padding: EdgeInsets.all(16),
        child: Text('Next: Pressing issues + Resolve + Reports by PCF + Agent.'),
      ),
    );
  }
}
