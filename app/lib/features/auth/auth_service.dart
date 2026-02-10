import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService {
  final SupabaseClient _sb = Supabase.instance.client;

  User? get currentUser => _sb.auth.currentUser;

  Future<void> signUp(String email, String password, {String? fullName}) async {
    final res = await _sb.auth.signUp(email: email, password: password);
    if (res.user == null) throw Exception('Sign up failed.');
    await ensureProfile(res.user!.id, fullName: fullName);
  }

  Future<void> signIn(String email, String password) async {
    final res = await _sb.auth.signInWithPassword(email: email, password: password);
    if (res.user == null) throw Exception('Login failed.');
    await ensureProfile(res.user!.id);
  }

  Future<void> signOut() => _sb.auth.signOut();

  Future<void> ensureProfile(String userId, {String? fullName}) async {
    final existing = await _sb
        .from('profiles')
        .select('id, role')
        .eq('id', userId)
        .maybeSingle();

    if (existing != null) return;

    await _sb.from('profiles').insert({
      'id': userId,
      'full_name': fullName,
      'role': 'agent',
    });
  }

  Future<String> getMyRoleSafe() async {
    final user = currentUser;
    if (user == null) return 'guest';

    // If profile is missing, create it and default to agent
    final row = await _sb
        .from('profiles')
        .select('role')
        .eq('id', user.id)
        .maybeSingle();

    if (row == null) {
      await ensureProfile(user.id);
      return 'agent';
    }

    return (row['role'] as String?) ?? 'agent';
  }
}
