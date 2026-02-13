import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AgentHome extends StatefulWidget {
  const AgentHome({super.key});

  @override
  State<AgentHome> createState() => _AgentHomeState();
}

class _AgentHomeState extends State<AgentHome> {
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
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Agent'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () => context.go('/call'),
            child: const Text('Open Call Queue'),
          ),
        ),
      ),
    );
  }
}
