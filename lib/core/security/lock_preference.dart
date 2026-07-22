// ============================================================
// lock_preference.dart — App Lock Setting (SharedPreferences)
// ============================================================
//
// 📚 FLUTTER CONCEPT: SharedPreferences
//
// SharedPreferences = simple key-value storage
// Phone ke local storage mein save hota hai (plain text)
// Use case: settings, flags, small data
// NOT for: sensitive data (passwords, keys) — us ke liye SecureStorage
//
// SharedPreferences vs flutter_secure_storage:
// SharedPreferences: fast, plain text, settings ke liye
// SecureStorage: encrypted, secure, passwords ke liye
//
// ============================================================

import 'package:shared_preferences/shared_preferences.dart';

class LockPreference {
  LockPreference._();

  static const _key = 'cw_lock_enabled';

  // ── Read ──────────────────────────────────────────────────
  // 📚 SharedPreferences.getInstance() = SharedPreferences object lo
  // getBool(key) = boolean value padhlo (default: false)
  static Future<bool> isEnabled() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_key) ?? false; // ?? false = agar null ho to false
  }

  // ── Write ─────────────────────────────────────────────────
  static Future<void> setEnabled(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_key, value);
  }
}
