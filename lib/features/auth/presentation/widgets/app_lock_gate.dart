// ============================================================
// app_lock_gate.dart — Biometric App Lock Screen
// ============================================================
//
// 📚 FLUTTER CONCEPT: ConsumerStatefulWidget
//
// ConsumerStatefulWidget = StatefulWidget + Riverpod access
// Jab hume dono chahiye:
//   - State (initState, dispose, lifecycle)
//   - Riverpod (ref.watch, ref.read)
//
// 3 classes banani hoti hain:
//   class AppLockGate extends ConsumerStatefulWidget { ... }
//   class _AppLockGateState extends ConsumerState<AppLockGate>
//                          with WidgetsBindingObserver { ... }
//
// ConsumerState mein 'ref' directly available hota hai —
// build() ya kisi bhi method mein use kar sakte ho.
//
// 📚 FLUTTER CONCEPT: Stack widget
//
// Stack = widgets ek ke upar ek rakhna (like CSS position: absolute)
//   child: child   → pehle background (bottom layer)
//   Positioned() → exact position pe rakhna
//   Align()      → alignment ke hisaab se
//
// Lock screen child ke UPAR dikhani hai — Stack perfect hai.
//
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:expressive_loading_indicator/expressive_loading_indicator.dart';

import '../../../../core/security/biometric_auth.dart';
import '../../../../core/security/lock_providers.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_palette.dart';
import '../../../../l10n/genrated/app_localizations.dart';

class AppLockGate extends ConsumerStatefulWidget {
  final Widget child;

  const AppLockGate({super.key, required this.child});

  @override
  ConsumerState<AppLockGate> createState() => _AppLockGateState();
}

class _AppLockGateState extends ConsumerState<AppLockGate>
    with WidgetsBindingObserver {
  // Lock state — screen dikhao ya nahi
  bool _isLocked = false;
  bool _isAuthenticating = false;
  bool _authFailed = false;

  // 📚 _wasInBackground: track karo app background mein gayi thi ya nahi
  // Isse pata chalega resume hone par lock karna hai ya nahi
  bool _wasInBackground = false;

  @override
  void initState() {
    super.initState();
    // 📚 WidgetsBinding.instance.addObserver(this)
    // = "Mujhe lifecycle changes batao"
    WidgetsBinding.instance.addObserver(this);

    // App start pe check karo — lock enabled hai?
    // Avoid layout flicker by setting initial value synchronously
    final lockEnabled = ref.read(lockEnabledProvider);
    _isLocked = lockEnabled;
  }

  // ─────────────────────────────────────────────────────────
  // App Lifecycle Changes — background/foreground
  // ─────────────────────────────────────────────────────────
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    final lockEnabled = ref.read(lockEnabledProvider);
    if (!lockEnabled) return; // Lock disabled → kuch nahi karo

    final currentlyAuthenticating = _isAuthenticating || BiometricAuth.isAuthenticating;

    switch (state) {
      case AppLifecycleState.paused:
      case AppLifecycleState.hidden:
        // App background mein gayi → flag set karo only if we are not currently authenticating
        if (!currentlyAuthenticating) {
          _wasInBackground = true;
        }
        break;

      case AppLifecycleState.resumed:
        // App wapas aaya + pehle background mein gayi thi → lock karo
        if (_wasInBackground && !currentlyAuthenticating) {
          _wasInBackground = false;
          setState(() {
            _isLocked = true;
            _authFailed = false;
          });
          _authenticate();
        } else {
          // Reset background flag if we resumed from a biometric prompt dialog
          _wasInBackground = false;
        }
        break;

      case AppLifecycleState.inactive:
      case AppLifecycleState.detached:
        // Kuch karne ki zaroorat nahi
        break;
    }
  }

  // ─────────────────────────────────────────────────────────
  // _authenticate() — Biometric dialog show karo
  // ─────────────────────────────────────────────────────────
  Future<void> _authenticate() async {
    if (_isAuthenticating) return; // Already authenticating → skip

    final l10n = AppLocalizations.of(context)!;
    setState(() {
      _isAuthenticating = true;
      _authFailed = false;
    });

    // 📚 BiometricAuth.authenticate() = fingerprint/face/PIN dialog
    final success = await BiometricAuth.authenticate(
      l10n.unlockPrompt,
    );

    if (!mounted) return; // Widget dispose ho gaya? → return

    setState(() {
      _isAuthenticating = false;
      if (success) {
        _isLocked = false; // Unlock!
      } else {
        _authFailed = true; // Show error message
      }
    });
  }

  @override
  void dispose() {
    // 📚 IMPORTANT: Observer ZAROOR remove karo
    // Nahi kiya → memory leak + possible crashes
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  // ─────────────────────────────────────────────────────────
  // Build
  // ─────────────────────────────────────────────────────────
  @override
  Widget build(BuildContext context) {
    final lockEnabled = ref.watch(lockEnabledProvider);
    final splashActive = ref.watch(splashActiveProvider);

    // Splash active hai → seedha splash screen dikhao (do not lock on launch splash)
    if (splashActive) {
      return widget.child;
    }

    // Lock disabled hai ya unlocked hai → seedha app dikhao (no gate)
    if (!lockEnabled || !_isLocked) {
      return widget.child;
    }

    // Trigger authentication if not already doing so
    if (!_isAuthenticating && !BiometricAuth.isAuthenticating) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _authenticate();
      });
    }

    final c = context.colors;
    final l10n = AppLocalizations.of(context)!;

    // Lock screen dikhao — Stack se child ke UPAR
    return Stack(
      children: [
        // App content (blocked from interactions)
        AbsorbPointer(child: widget.child),

        // Blurred overlay with tap-to-unlock gesture
        Positioned.fill(
          child: ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 18, sigmaY: 18),
              child: GestureDetector(
                onTap: _isAuthenticating ? null : _authenticate,
                behavior: HitTestBehavior.opaque,
                child: Material(
                  color: c.page.withValues(alpha: 0.65), // Semi-transparent theme page color
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (_isAuthenticating)
                          ExpressiveLoadingIndicator(
                            color: c.primary,
                            constraints: const BoxConstraints.tightFor(width: 36, height: 36),
                          )
                        else ...[
                          Icon(
                            Icons.lock_outline_rounded,
                            color: c.textPrimary,
                            size: 48,
                          ),
                          const SizedBox(height: 16),
                          Text(
                            l10n.tapToUnlock,
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: c.textPrimary,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          if (_authFailed) ...[
                            const SizedBox(height: 8),
                            Text(
                              l10n.authFailed,
                              style: const TextStyle(
                                fontFamily: 'Montserrat',
                                color: AppColors.error,
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ],
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
