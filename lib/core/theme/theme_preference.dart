// ============================================================
// theme_preference.dart — Theme Mode Setting (SharedPreferences)
// ============================================================
//
// 📚 FLUTTER CONCEPT: Enum in Dart
//
// Enum = predefined set of values
// ThemeMode Flutter ka enum hai:
//   ThemeMode.system  → phone setting follow karo
//   ThemeMode.light   → always light
//   ThemeMode.dark    → always dark
//
// Hum ThemeMode ko String mein save karte hain:
//   'system', 'light', 'dark'
// Aur wapas ThemeMode mein convert karte hain.
//
// ============================================================

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemePreference {
  ThemePreference._();

  static const _key = 'cw_theme_mode';

  // ── Read ──────────────────────────────────────────────────
  static Future<ThemeMode> getMode() async {
    final prefs = await SharedPreferences.getInstance();
    final value = prefs.getString(_key) ?? 'system'; // Default: system

    // 📚 switch statement = multiple if-else ka short form
    return switch (value) {
      'light' => ThemeMode.light,
      'dark' => ThemeMode.dark,
      _ => ThemeMode.system, // _ = default case (baaki sab)
    };
  }

  // ── Write ─────────────────────────────────────────────────
  static Future<void> setMode(ThemeMode mode) async {
    final prefs = await SharedPreferences.getInstance();

    // 📚 ThemeMode.name = enum value ka naam as String
    // ThemeMode.dark.name = 'dark'
    // ThemeMode.light.name = 'light'
    await prefs.setString(_key, mode.name);
  }
}
