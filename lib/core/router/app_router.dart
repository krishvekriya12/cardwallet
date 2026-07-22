// ============================================================
// app_router.dart — GoRouter Configuration
// ============================================================
//
// 📚 FLUTTER CONCEPT: GoRouter
//
// GoRouter ek navigation library hai jo URL-based routing deta hai.
// Isme hum routes define karte hain — jaise website pe hoti hain:
//   /home, /add-card, /card/42, /bin-checker etc.
//
// DO TYPES OF ROUTES:
//
// 1. GoRoute — normal screen
//    GoRoute(path: '/home', builder: (ctx, state) => HomeScreen())
//
// 2. StatefulShellRoute — bottom nav tabs
//    Ye special hai — teen tabs maintain karta hai memory mein.
//    Tab switch karne par state RESET nahi hoti.
//    (Normal Navigator mein switch karne par screen rebuild hoti hai)
//
// PAGE TRANSITIONS:
// Default Flutter transition boring hai.
// Hum custom slide+fade transition banate hain — premium feel.
//
// ============================================================

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// Screens
import '../../features/splash/presentation/screens/splash_screen.dart';
import '../../features/home/presentation/screens/home_screen.dart';
import '../../features/my_cards/presentation/screens/my_cards_screen.dart';
import '../../features/profile/presentation/screens/profile_screen.dart';
import '../../features/cards/presentation/screens/add_card_screen.dart';
import '../../features/cards/presentation/screens/card_scan_screen.dart';
import '../../features/cards/presentation/screens/nfc_reader_screen.dart';
import '../../features/cards/presentation/screens/card_details_screen.dart';
import '../../features/cards/presentation/screens/card_photos_screen.dart';
import '../../features/bin_checker/presentation/screens/bin_checker_screen.dart';
import '../../features/bin_checker/presentation/screens/bin_result_screen.dart';
import '../../features/bin_checker/domain/bin_lookup_result.dart';
import '../../features/card_validator/presentation/screens/card_validator_screen.dart';
import '../../features/profile/presentation/screens/backup_screen.dart';
import '../../features/profile/presentation/screens/language_screen.dart';
import '../../features/premium/presentation/screens/premium_screen.dart';
import '../../features/cards/domain/entities/card_type.dart';
import '../../shared/widgets/main_scaffold.dart';

// ─────────────────────────────────────────────────────────────
// Custom Page Transition
// ─────────────────────────────────────────────────────────────
//
// 📚 FLUTTER CONCEPT: CustomTransitionPage
//
// Flutter mein by default pages slide hoti hain (iOS-style).
// Hum apna transition define kar sakte hain.
//
// Hamara transition: Slide (thoda right se) + Fade
// Forward: 320ms, Reverse (back): 240ms
//
// transitionsBuilder ke 4 parameters:
//   context       → current screen context
//   animation     → forward animation (0.0 to 1.0)
//   secondAnimation → previous screen ka animation
//   child         → ye screen jo show ho rahi hai
//
CustomTransitionPage<T> _slideTransition<T>({
  required LocalKey key,
  required Widget child,
}) {
  return CustomTransitionPage<T>(
    key: key,
    child: child,
    transitionDuration: const Duration(milliseconds: 320),
    reverseTransitionDuration: const Duration(milliseconds: 240),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      // 📚 Tween = start value se end value tak smoothly change karo
      // Offset(0.06, 0.0) = screen thodi right side se aaye
      // Offset.zero = final position (center)
      final slideAnimation = Tween<Offset>(
        begin: const Offset(0.06, 0.0),
        end: Offset.zero,
      ).animate(
        CurvedAnimation(
          parent: animation,
          // 📚 Curves.easeOutCubic = fast start, slow end (natural feel)
          curve: Curves.easeOutCubic,
          reverseCurve: Curves.easeInCubic,
        ),
      );

      // Fade animation — 0.0 (invisible) to 1.0 (visible)
      final fadeAnimation = CurvedAnimation(
        parent: animation,
        curve: Curves.easeOut,
      );

      return SlideTransition(
        position: slideAnimation,
        child: FadeTransition(
          opacity: fadeAnimation,
          child: child,
        ),
      );
    },
  );
}

// ─────────────────────────────────────────────────────────────
// App Router — Main Configuration
// ─────────────────────────────────────────────────────────────
//
// 📚 FLUTTER CONCEPT: final vs const
// 'final' = runtime pe ek baar assign hoti hai
// 'const' = compile-time pe fixed (faster)
// GoRouter compile-time pe create nahi ho sakta (needs runtime), so 'final'
//
final rootNavigatorKey = GlobalKey<NavigatorState>();

final appRouter = GoRouter(
  navigatorKey: rootNavigatorKey,
  // 📚 initialLocation = app open hone par pehli screen
  initialLocation: '/splash',

  routes: [
    // ── Splash ──────────────────────────────────────────────
    // Yeh simple GoRoute hai — bottom nav nahi hai
    GoRoute(
      path: '/splash',
      builder: (context, state) => const SplashScreen(),
    ),

    // ── Main Shell (Bottom Nav — 3 Tabs) ────────────────────
    //
    // 📚 FLUTTER CONCEPT: StatefulShellRoute
    //
    // StatefulShellRoute.indexedStack matlab:
    // Teeno tabs ek saath memory mein rahenge (IndexedStack).
    // Tab 1 → Tab 2 → Tab 1 karo — Tab 1 ki state SAME rahegi.
    // Without this: Tab 1 rebuild hoti har baar.
    //
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        // MainScaffold ko navigationShell pass karte hain
        // MainScaffold neeche bottom bar dikhata hai
        return MainScaffold(navigationShell: navigationShell);
      },
      branches: [
        // Branch 1 — Home Tab
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/home',
              builder: (context, state) => const HomeScreen(),
            ),
          ],
        ),

        // Branch 2 — My Cards Tab
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/my-cards',
              builder: (context, state) => const MyCardsScreen(),
            ),
          ],
        ),

        // Branch 3 — Profile Tab
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/profile',
              builder: (context, state) => const ProfileScreen(),
            ),
          ],
        ),
      ],
    ),

    GoRoute(
      path: '/add-card',
      pageBuilder: (context, state) {
        final extra = state.extra;
        AddCardArgs args;
        if (extra is AddCardArgs) {
          args = extra;
        } else if (extra is Map<String, dynamic>) {
          args = AddCardArgs(
            cardId: extra['cardId'] as int?,
            initialType: extra['initialType'] as CardType?,
            brandName: extra['brandName'] as String?,
            prefillNumber: extra['prefillNumber'] as String?,
            prefillExpiry: extra['prefillExpiry'] as String?,
            prefillHolderName: extra['prefillHolderName'] as String?,
            prefillBankName: extra['prefillBankName'] as String?,
            prefillCvv: extra['prefillCvv'] as String?,
            prefillFrontPhotoPath: extra['prefillFrontPhotoPath'] as String?,
            prefillBackPhotoPath: extra['prefillBackPhotoPath'] as String?,
          );
        } else {
          args = const AddCardArgs();
        }
        return _slideTransition(
          key: state.pageKey,
          child: AddCardScreen(args: args),
        );
      },
    ),

    // ── Card Scan (Camera OCR) ────────────────────────────────
    GoRoute(
      path: '/card-scan',
      pageBuilder: (context, state) => _slideTransition(
        key: state.pageKey,
        child: const CardScanScreen(),
      ),
    ),

    // ── NFC Reader ───────────────────────────────────────────
    GoRoute(
      path: '/nfc-reader',
      pageBuilder: (context, state) => _slideTransition(
        key: state.pageKey,
        child: const NfcReaderScreen(),
      ),
    ),

    // ── Card Details ─────────────────────────────────────────
    // 📚 path: '/card/:id' — ':id' ek dynamic parameter hai
    // /card/42 → state.pathParameters['id'] = '42'
    GoRoute(
      path: '/card/:id',
      pageBuilder: (context, state) => _slideTransition(
        key: state.pageKey,
        child: CardDetailsScreen(
          cardId: int.parse(state.pathParameters['id']!),
        ),
      ),
    ),

    // ── Card Photos ──────────────────────────────────────────
    GoRoute(
      path: '/card/:id/photos',
      pageBuilder: (context, state) => _slideTransition(
        key: state.pageKey,
        child: CardPhotosScreen(
          cardId: int.parse(state.pathParameters['id']!),
        ),
      ),
    ),

    // ── BIN Checker ──────────────────────────────────────────
    GoRoute(
      path: '/bin-checker',
      pageBuilder: (context, state) => _slideTransition(
        key: state.pageKey,
        child: const BinCheckerScreen(),
      ),
    ),

    // ── BIN Result ───────────────────────────────────────────
    GoRoute(
      path: '/bin-checker/result',
      pageBuilder: (context, state) => _slideTransition(
        key: state.pageKey,
        child: BinResultScreen(
          result: state.extra as BinLookupResult,
        ),
      ),
    ),

    // ── Card Validator ───────────────────────────────────────
    GoRoute(
      path: '/card-validator',
      pageBuilder: (context, state) => _slideTransition(
        key: state.pageKey,
        child: const CardValidatorScreen(),
      ),
    ),

    // ── Backup ───────────────────────────────────────────────
    GoRoute(
      path: '/backup',
      pageBuilder: (context, state) => _slideTransition(
        key: state.pageKey,
        child: const BackupScreen(),
      ),
    ),

    // ── Language ─────────────────────────────────────────────
    GoRoute(
      path: '/language',
      pageBuilder: (context, state) => _slideTransition(
        key: state.pageKey,
        child: const LanguageScreen(),
      ),
    ),

    // ── Premium ──────────────────────────────────────────────
    GoRoute(
      path: '/premium',
      pageBuilder: (context, state) => _slideTransition(
        key: state.pageKey,
        child: const PremiumScreen(),
      ),
    ),
  ],
);
