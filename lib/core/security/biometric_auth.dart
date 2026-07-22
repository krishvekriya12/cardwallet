// ============================================================
// biometric_auth.dart — Fingerprint/Face ID Authentication
// ============================================================
//
// 📚 FLUTTER CONCEPT: local_auth plugin
//
// local_auth ek Flutter plugin hai jo device authentication use karta hai:
// Android: Fingerprint, Face ID, PIN, Pattern, Password
// iOS: Face ID, Touch ID
//
// Important settings:
//   biometricOnly: false  → PIN/Pattern bhi allow karo as fallback
//                           true karne se sirf fingerprint/face accept hoga
//   stickyAuth: true      → App background mein jaane par auth cancel nahi hogi
//                           false hone par: home button dabao → auth dismiss
//
// 📚 FLUTTER CONCEPT: Static class (Utility pattern)
//
// BiometricAuth._() = private constructor
// Matlab: new BiometricAuth() nahi ban sakta
// Sab methods static hain → BiometricAuth.authenticate() seedha call hoga
//
// ============================================================

import 'package:local_auth/local_auth.dart';

class BiometricAuth {
  BiometricAuth._(); // Private — instantiation nahi hogi

  static final _auth = LocalAuthentication(); // Plugin instance

  // ── Flag: prevents double authentication ──────────────────
  // 📚 Problem: agar user screen pe wapas aaya aur pehli auth chal rahi hai
  // to doosri auth start mat karo (double dialog bug)
  static bool isAuthenticating = false;

  // ─────────────────────────────────────────────────────────
  // canAuthenticate() — Device biometric support check karo
  // ─────────────────────────────────────────────────────────
  //
  // Returns true agar:
  // - Device biometrics support karta hai (fingerprint/face)
  // - OR device pe PIN/pattern set hai
  //
  // Returns false agar:
  // - No biometrics, no PIN → auto unlock karo (don't block user)
  //
  static Future<bool> canAuthenticate() async {
    try {
      // isDeviceSupported() = hardware support check
      final supported = await _auth.isDeviceSupported();

      // canCheckBiometrics = koi biometric enrolled hai?
      final canCheck = await _auth.canCheckBiometrics;

      return supported || canCheck;
    } catch (_) {
      // Koi error → assume can't authenticate → don't block
      return false;
    }
  }

  // ─────────────────────────────────────────────────────────
  // authenticate() — Actually show auth dialog
  // ─────────────────────────────────────────────────────────
  //
  // Returns:
  //   true  → authenticated successfully (unlock app)
  //   false → failed / cancelled (stay on lock screen)
  //
  static Future<bool> authenticate(String reason) async {
    // 📚 try/catch/finally:
    // try     = ye code chalao
    // catch   = agar error aaye to ye chalao
    // finally = hamesha chalao (error ho ya na ho)
    try {
      // Agar device support nahi karta → block mat karo
      if (!await canAuthenticate()) return true;

      // Double auth prevent karo
      if (isAuthenticating) return false;
      isAuthenticating = true;

      return await _auth.authenticate(
        localizedReason: reason, // Dialog mein dikhane wala message
        options: const AuthenticationOptions(
          biometricOnly: false, // PIN/pattern bhi allow karo
          stickyAuth: true,     // App switch par cancel nahi
        ),
      );
    } catch (_) {
      // Exception = auth failed → lock screen pe raho
      return false;
    } finally {
      // 📚 finally = hamesha chalega — success ho ya fail
      isAuthenticating = false; // Flag reset karo
    }
  }

  // ─────────────────────────────────────────────────────────
  // cancelAuthentication() — Dialog band karo
  // ─────────────────────────────────────────────────────────
  static Future<void> cancelAuthentication() async {
    if (isAuthenticating) {
      await _auth.stopAuthentication();
      isAuthenticating = false;
    }
  }
}
