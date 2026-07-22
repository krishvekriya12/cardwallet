import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_dimensions.dart';

extension AppPaletteContext on BuildContext {
  AppPalette get colors => AppPalette.of(this);
}

class AppPalette {
  final bool isDark;
  const AppPalette({required this.isDark});
  factory AppPalette.of(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return AppPalette(isDark: isDark);
  }

  Color get primary => AppColors.primary;
  Color get primaryLight => AppColors.primaryLight;
  Color get primaryDark => AppColors.primaryDark;
  Color get primarySoft => AppColors.primarySoft;

  Color get secondary => AppColors.secondary;
  Color get secondaryLight => AppColors.secondaryLight;
  Color get secondarySoft => AppColors.secondarySoft;

  Color get success => AppColors.success;
  Color get successSoft => AppColors.successSoft;
  Color get warning => AppColors.warning;
  Color get warningSoft => AppColors.warningSoft;
  Color get error => AppColors.error;
  Color get errorSoft => AppColors.errorSoft;
  Color get info => AppColors.info;
  Color get infoSoft => AppColors.infoSoft;

  Color get page => isDark ? AppColors.darkPage : AppColors.lightPage;
  Color get surface => isDark ? AppColors.darkSurface : AppColors.lightSurface;
  Color get elevated => isDark ? AppColors.darkElevated : AppColors.lightElevated;
  Color get field => isDark ? AppColors.darkField : AppColors.lightField;
  Color get border => isDark ? AppColors.darkBorder : AppColors.lightBorder;
  Color get divider => isDark ? AppColors.darkBorder : AppColors.lightBorder;

  Color get textPrimary =>
      isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary;
  Color get textSecondary =>
      isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary;
  Color get textTertiary =>
      isDark ? AppColors.darkTextTertiary : AppColors.lightTextTertiary;
  Color get textDisabled =>
      isDark ? AppColors.darkTextDisabled : AppColors.lightTextDisabled;
  Color get textMuted =>
      isDark ? AppColors.darkTextTertiary : AppColors.lightTextTertiary;

  Color get onPrimary => AppColors.white;

  Color get surfaceAlt =>
      isDark ? AppColors.darkElevated : AppColors.lightElevated;

  Color get shadow =>
      isDark ? AppColors.darkShadow : AppColors.lightShadow;

  Color get glass => AppColors.glassWhite;
  Color get glassBorder => AppColors.glassBorder;

  List<Color> gradientForType(int typeIndex) {
    const gradients = [
      AppColors.creditGradient,
      AppColors.debitGradient,
      AppColors.pointGradient,
      AppColors.membershipGradient,
      AppColors.couponGradient,
      AppColors.giftGradient,
      AppColors.eventGradient,
      AppColors.otherGradient,
    ];
    if (typeIndex < 0 || typeIndex >= gradients.length) {
      return AppColors.otherGradient;
    }
    return gradients[typeIndex];
  }

  Color get overlay => isDark
      ? AppColors.black.withValues(alpha: 0.7)
      : AppColors.black.withValues(alpha: 0.5);

  LinearGradient get primaryGradient => LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [AppColors.primary, AppColors.primaryDark],
      );

  LinearGradient get surfaceGradient => LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: isDark
            ? [AppColors.darkSurface, AppColors.darkPage]
            : [AppColors.lightSurface, AppColors.lightPage],
      );

  List<BoxShadow> get cardShadow => [
        BoxShadow(
          color: isDark
              ? AppColors.black.withValues(alpha: 0.18)
              : AppColors.primary.withValues(alpha: 0.15),
          blurRadius: AppDim.blurL,
          offset: const Offset(0, 8),
          spreadRadius: -4,
        ),
      ];

  List<BoxShadow> get primaryShadow => [
        BoxShadow(
          color: AppColors.primary.withValues(alpha: isDark ? 0.12 : 0.20),
          blurRadius: AppDim.blurM,
          offset: const Offset(0, 4),
          spreadRadius: -2,
        ),
      ];

  List<BoxShadow> get subtleShadow => [
        BoxShadow(
          color: isDark
              ? AppColors.black.withValues(alpha: 0.08)
              : AppColors.darkPage.withValues(alpha: 0.06),
          blurRadius: AppDim.blurS,
          offset: const Offset(0, 2),
        ),
      ];
}
