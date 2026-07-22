// ============================================================
// lock_providers.dart — Riverpod Lock State
// ============================================================
//
// 📚 FLUTTER CONCEPT: Riverpod 3.x — Notifier
//
// Riverpod 3.x mein StateProvider hata diya gaya.
// Ab hum Notifier use karte hain — zyada powerful aur explicit.
//
// Notifier<State> = State + methods to change it
//
// Kaise kaam karta hai:
//   class LockNotifier extends Notifier<bool> {
//     build() → initial state return karo
//     toggle() → state change karo
//   }
//
// Widget mein:
//   ref.watch(lockEnabledProvider) → current bool value
//   ref.read(lockEnabledProvider.notifier).toggle() → change karo
//
// ============================================================

import 'package:flutter_riverpod/flutter_riverpod.dart';

// ── Notifier class ────────────────────────────────────────────
class LockNotifier extends Notifier<bool> {
  @override
  bool build() => false; // Initial state = lock OFF

  /// Lock ON/OFF set karo
  void setEnabled(bool value) => state = value;

  /// main.dart override ke liye — initial value set karo
  void setEnabledOnInit(bool value) => state = value;

  /// Toggle karo (ON→OFF, OFF→ON)
  void toggle() => state = !state;
}

// ── Provider ──────────────────────────────────────────────────
/// Global lock enabled/disabled state.
/// Profile screen mein toggle karte hain.
/// AppLockGate mein ref.watch() karte hain.
final lockEnabledProvider = NotifierProvider<LockNotifier, bool>(
  LockNotifier.new,
);

// ── Splash Active Provider ────────────────────────────────────
class SplashActiveNotifier extends Notifier<bool> {
  @override
  bool build() => true; // Initial state = splash is active on launch

  void setFinished() => state = false;
}

/// Tracks whether app launch splash screen is active
final splashActiveProvider = NotifierProvider<SplashActiveNotifier, bool>(
  SplashActiveNotifier.new,
);

