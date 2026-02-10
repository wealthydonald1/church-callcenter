import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../features/auth/login_screen.dart';
import '../../features/agent/agent_home.dart';
import '../../features/boss/boss_home.dart';
import '../../features/common/splash_screen.dart';

final appRouter = GoRouter(
  initialLocation: '/splash',
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
);
