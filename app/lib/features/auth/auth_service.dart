import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService {
  final SupabaseClient _sb = Supabase.instance.client;

  User? get currentUser => _sb.auth.currentUser;

  Stream<AuthState> get onAuthStateChange => _sb.auth.onAuthStateChange;

  Future<void> signUp(String email, String password, {String? fullName}) async {
    final res = await _sb.auth.signUp(email: email, password: password);
    if (res.user == null) throw Exception('Sign up failed.');
    await _ensureProfile(res.user!.id, fullName: fullName);
  }

  Future<void> signIn(String email, String password) async {
    final res = await _sb.auth.signInWithPassword(email: email, password: password);
    if (res.user == null) throw Exception('Login failed.');
    await _ensureProfile(res.user!.id);
  }

  Future<void> signOut() => _sb.auth.signOut();

  Future<void> _ensureProfile(String userId, {String? fullName}) async {
    // Check if profile exists
    final existing = await _sb
        .from('profiles')
        .select('id, role')
        .eq('id', userId)
        .maybeSingle();

    if (existing != null) return;

    // Create profile default role=agent
    await _sb.from('profiles').insert({
      'id': userId,
      'full_name': fullName,
      'role': 'agent',
    });
  }

  Future<String> getMyRole() async {
    final user = currentUser;
    if (user == null) return 'guest';

    final row = await _sb
        .from('profiles')
        .select('role')
        .eq('id', user.id)
        .single();

    return (row['role'] as String?) ?? 'agent';
  }
}
