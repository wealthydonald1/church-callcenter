import 'package:shared_preferences/shared_preferences.dart';

class RoleCache {
  static const _kRole = 'cached_role';
  static const _kRoleUpdatedAt = 'cached_role_updated_at';

  static Future<void> setRole(String role) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_kRole, role);
    await prefs.setString(_kRoleUpdatedAt, DateTime.now().toIso8601String());
  }

  static Future<String?> getRole() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_kRole);
  }

  static Future<String?> getRoleUpdatedAt() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_kRoleUpdatedAt);
  }

  static Future<void> clear() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_kRole);
    await prefs.remove(_kRoleUpdatedAt);
  }
}
