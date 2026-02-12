import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../features/auth/login_screen.dart';
import '../../features/agent/agent_home.dart';
import '../../features/agent/call_queue_screen.dart';
import '../../features/boss/boss_home.dart';
import '../../features/common/splash_screen.dart';

class GoRouterRefreshStream extends ChangeNotifier {
  GoRouterRefreshStream(Stream<dynamic> stream) {
    _sub = stream.asBroadcastStream().listen((_) => notifyListeners());
  }
  late final StreamSubscription<dynamic> _sub;

  @override
  void dispose() {
    _sub.cancel();
    super.dispose();
  }
}

/// OFFLINE SAFE: never throw from role lookup.
Future<String?> _getRoleSafe() async {
  final sb = Supabase.instance.client;
  final user = sb.auth.currentUser;
  if (user == null) return null;

  try {
    final row = await sb
        .from('profiles')
        .select('role')
        .eq('id', user.id)
        .maybeSingle();

    return row == null ? null : row['role'] as String?;
  } catch (_) {
    // Offline or RLS/network error
    return null;
  }
}

final appRouter = GoRouter(
  initialLocation: '/splash',
  refreshListenable: GoRouterRefreshStream(
    Supabase.instance.client.auth.onAuthStateChange.map((event) => event.session),
  ),
  routes: [
    GoRoute(path: '/splash', builder: (context, state) => const SplashScreen()),
    GoRoute(path: '/login', builder: (context, state) => const LoginScreen()),
    GoRoute(path: '/agent', builder: (context, state) => const AgentHome()),
    GoRoute(path: '/boss', builder: (context, state) => const BossHome()),
    GoRoute(path: '/call', builder: (context, state) => const CallQueueScreen()),
  ],
  redirect: (context, state) async {
    try {
      final sb = Supabase.instance.client;
      final user = sb.auth.currentUser;

      final loc = state.uri.toString();
      final goingToSplash = loc == '/splash';
      final goingToLogin = loc == '/login';

      // Not signed in → only allow /login (and /splash)
      if (user == null) {
        return (goingToLogin || goingToSplash) ? null : '/login';
      }

      // Signed in → don’t stay on login
      if (goingToLogin) {
        final role = await _getRoleSafe();
        if (role == 'boss') return '/boss';
        if (role == 'admin') return '/boss'; // TEMP until /admin exists
        return '/agent'; // default (works offline)
      }

      // Signed in and on splash → route based on role (or default offline)
      if (goingToSplash) {
        final role = await _getRoleSafe();
        if (role == 'boss') return '/boss';
        if (role == 'admin') return '/boss';
        return '/agent';
      }

      return null;
    } catch (_) {
      // NEVER blank-screen due to redirect errors
      return null;
    }
  },
);
