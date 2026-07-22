// ============================================================
// theme_providers.dart — Riverpod Theme State (Riverpod 3.x)
// ============================================================
//
// 📚 FLUTTER CONCEPT: Notifier<ThemeMode>
//
// ThemeMode ek Flutter enum hai — system / light / dark.
// Hum ise Notifier mein wrap karte hain taaki:
//   1. Profile screen se change kar sakein
//   2. MaterialApp.router automatically rebuild ho
//   3. SharedPreferences mein save kar sakein
//
// ============================================================

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// ── Notifier class ────────────────────────────────────────────
class ThemeModeNotifier extends Notifier<ThemeMode> {
  @override
  ThemeMode build() => ThemeMode.system; // Initial = system

  /// Theme mode set karo
  void setMode(ThemeMode mode) => state = mode;

  /// main.dart override ke liye — initial value set karo  
  void setModeOnInit(ThemeMode mode) => state = mode;
}

// ── Provider ──────────────────────────────────────────────────
/// Global theme mode — watched by MaterialApp.router in app.dart
final themeModeProvider = NotifierProvider<ThemeModeNotifier, ThemeMode>(
  ThemeModeNotifier.new,
);
