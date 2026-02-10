import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> initSupabase() async {
  const url = String.fromEnvironment('SUPABASE_URL');
  const anon = String.fromEnvironment('SUPABASE_ANON_KEY');

  if (url.isEmpty || anon.isEmpty) {
    throw Exception('Missing SUPABASE_URL or SUPABASE_ANON_KEY dart-define.');
  }

  await Supabase.initialize(
    url: url,
    anonKey: anon,
  );
}
