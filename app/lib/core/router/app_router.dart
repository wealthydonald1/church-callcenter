import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../features/auth/login_screen.dart';
import '../../features/agent/agent_home.dart';
import '../../features/boss/boss_home.dart';
import '../../features/common/splash_screen.dart';
import '../../features/auth/auth_service.dart';

final auth = Supabase.instance.client.auth;
final authService = AuthService();

class AuthNotifier extends ChangeNotifier {
  late final StreamSubscription _sub;

  AuthNotifier() {
    _sub = auth.onAuthStateChange.listen((_) => notifyListeners());
  }

  @override
  void dispose() {
    _sub.cancel();
    super.dispose();
  }
}

final authNotifier = AuthNotifier();

final appRouter = GoRouter(
  initialLocation: '/splash',
  refreshListenable: authNotifier,
  routes: [
    GoRoute(
      path: '/splash',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/agent',
      builder: (context, state) => const AgentHome(),
    ),
    GoRoute(
      path: '/boss',
      builder: (context, state) => const BossHome(),
    ),
  ],
  redirect: (context, state) async {
    final session = auth.currentSession;
    final loc = state.matchedLocation;

    final goingToLogin = loc == '/login';
    final goingToSplash = loc == '/splash';

    if (session == null) {
      return goingToLogin ? null : '/login';
    }

    if (goingToLogin || goingToSplash) {
      final role = await authService.getMyRole();
      return role == 'boss' ? '/boss' : '/agent';
    }

    return null;
  },
);
