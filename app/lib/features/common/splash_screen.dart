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

  @override
  void initState() {
    super.initState();
    _decide();
  }

  Future<void> _decide() async {
    final session = Supabase.instance.client.auth.currentSession;

    if (session == null) {
      if (mounted) context.go('/login');
      return;
    }

    final role = await _authService.getMyRole();

    if (!mounted) return;

    if (role == 'boss') {
      context.go('/boss');
    } else {
      context.go('/agent');
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
