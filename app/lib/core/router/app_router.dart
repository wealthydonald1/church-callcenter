import 'package:go_router/go_router.dart';

import '../../features/agent/agent_home.dart';
import '../../features/boss/boss_home.dart';
import '../../features/auth/login_screen.dart';

// TEMP: hardcoded role until we wire Supabase profiles
String fakeRole = 'agent'; // change to 'boss' to test

final appRouter = GoRouter(
  initialLocation: '/login',
  routes: [
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) =>
          fakeRole == 'boss' ? const BossHome() : const AgentHome(),
    ),
  ],
);
