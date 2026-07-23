import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'core/router/app_router.dart';
import 'core/theme/app_theme.dart';
import 'features/auth/presentation/widgets/app_lock_gate.dart';
import 'l10n/genrated/app_localizations.dart';
import 'core/security/locale_providers.dart';

class CardWalletApp extends ConsumerWidget {
  const CardWalletApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeLocale = ref.watch(localeProvider);

    const rtlLocales = {'ar', 'he'};
    final textDir = rtlLocales.contains(activeLocale)
        ? TextDirection.rtl
        : TextDirection.ltr;

    return MaterialApp.router(
      locale: Locale(activeLocale),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      title: 'Card Wallet',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      themeMode: ThemeMode.light,
      routerConfig: appRouter,
      builder: (context, child) => Directionality(
        textDirection: textDir,
        child: AnimatedTheme(
          data: Theme.of(context),
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
          child: _ThemeSystemUiOverlay(
            child: AppLockGate(
              child: child ?? const SizedBox.shrink(),
            ),
          ),
        ),
      ),
    );
  }
}

class _ThemeSystemUiOverlay extends StatelessWidget {
  final Widget child;
  const _ThemeSystemUiOverlay({required this.child});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: isDark ? Brightness.light : Brightness.dark,
        statusBarBrightness: isDark ? Brightness.dark : Brightness.light,
        systemNavigationBarColor: theme.scaffoldBackgroundColor,
        systemNavigationBarIconBrightness:
            isDark ? Brightness.light : Brightness.dark,
        systemNavigationBarDividerColor: Colors.transparent,
      ),
    );
    return child;
  }
}
