import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../auth/auth_service.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final _authService = AuthService();
  String _status = 'Starting...';

  @override
  void initState() {
    super.initState();
    // Run after first frame so context/go_router is ready
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _decideWithTimeout();
    });
  }

  Future<void> _decideWithTimeout() async {
    try {
      setState(() => _status = 'Checking session...');
      final session = Supabase.instance.client.auth.currentSession;

      if (session == null) {
        setState(() => _status = 'No session → go login');
        if (mounted) context.go('/login');
        return;
      }

      setState(() => _status = 'Session found → loading role...');
      final roleFuture = _authService.getMyRoleSafe();

      // Timeout so we never hang forever
      final role = await roleFuture.timeout(const Duration(seconds: 8));

      setState(() => _status = 'Role="$role" → routing...');
      if (!mounted) return;

      if (role == 'boss') {
        context.go('/boss');
      } else {
        context.go('/agent');
      }
    } on TimeoutException {
      setState(() => _status = 'Timed out. Check internet / Supabase access.');
    } catch (e) {
      setState(() => _status = 'Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const CircularProgressIndicator(),
              const SizedBox(height: 16),
              Text(_status, textAlign: TextAlign.center),
              const SizedBox(height: 16),
              OutlinedButton(
                onPressed: _decideWithTimeout,
                child: const Text('Retry'),
              ),
              const SizedBox(height: 8),
              OutlinedButton(
                onPressed: () => context.go('/login'),
                child: const Text('Go to Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
