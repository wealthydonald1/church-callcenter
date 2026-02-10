import 'package:flutter/material.dart';
import 'core/supabase/supabase_init.dart';
import 'core/router/app_router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initSupabase();
  runApp(const CallCenterApp());
}

class CallCenterApp extends StatelessWidget {
  const CallCenterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Church Call Center',
      theme: ThemeData(useMaterial3: true),
      routerConfig: appRouter,
    );
  }
}
