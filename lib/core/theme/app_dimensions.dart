// ============================================================
// app_dimensions.dart — Spacing, Radius, Duration constants
// ============================================================
//
// 📚 FLUTTER CONCEPT: 8dp Grid System
// UI mein sab spacing 8 ka multiple hona chahiye: 4,8,16,24,32,40...
// Isse designs consistent aur harmonious lagte hain.
// Ek bhi widget mein SizedBox(height: 17) mat karo — always 8 ka multiple.
//
// 📚 FLUTTER CONCEPT: abstract final class
// 'abstract' = is class ka object nahi ban sakta
// 'final' = is class ko extend nahi kar sakte
// Iska matlab: AppDim sirf ek namespace hai — AppDim.s16 likhenge
//
// ============================================================

abstract final class AppDim {
  AppDim._();

  // ── Spacing (8dp grid) ────────────────────────────────────
  // 📚 'dp' = density-independent pixels
  // Flutter mein hum actual pixels nahi likhte — dp likhte hain.
  // 1dp = 1px on 1x screen, 2px on 2x screen, 3px on 3x screen
  static const double s2 = 2.0;
  static const double s4 = 4.0;
  static const double s6 = 6.0;
  static const double s8 = 8.0;
  static const double s10 = 10.0;
  static const double s12 = 12.0;
  static const double s14 = 14.0;
  static const double s16 = 16.0;
  static const double s20 = 20.0;
  static const double s24 = 24.0;
  static const double s28 = 28.0;
  static const double s32 = 32.0;
  static const double s40 = 40.0;
  static const double s48 = 48.0;
  static const double s56 = 56.0;
  static const double s64 = 64.0;
  static const double s80 = 80.0;
  static const double s96 = 96.0;

  // ── Border Radius ─────────────────────────────────────────
  // 📚 BorderRadius.circular() se corners round hote hain
  static const double rXS = 6.0; // Chips, badges, small tags
  static const double rS = 10.0; // Buttons, small cards
  static const double rM = 16.0; // Bottom sheets, dialogs
  static const double rL = 20.0; // Standard cards
  static const double rXL = 24.0; // Large containers
  static const double rCard = 22.0; // Credit card style
  static const double rFull = 999.0; // Fully rounded (pills)

  // ── Icon Sizes ────────────────────────────────────────────
  static const double iconXS = 14.0;
  static const double iconS = 18.0;
  static const double iconM = 22.0;
  static const double iconL = 28.0;
  static const double iconXL = 36.0;
  static const double iconXXL = 48.0;

  // ── Animation Durations (in milliseconds) ─────────────────
  // 📚 Duration class use hoti hai animations mein
  // Micro: button press feel (150ms)
  // Standard: page transitions, card flip (300ms)
  // Hero: major screen transitions (600ms)
  static const Duration micro = Duration(milliseconds: 150);
  static const Duration fast = Duration(milliseconds: 200);
  static const Duration standard = Duration(milliseconds: 300);
  static const Duration medium = Duration(milliseconds: 450);
  static const Duration slow = Duration(milliseconds: 600);
  static const Duration xSlow = Duration(milliseconds: 900);

  // Also as int (for flutter_animate package's .ms extension)
  // 📚 flutter_animate mein 300.ms likhte hain = Duration(milliseconds:300)
  static const int microMs = 150;
  static const int fastMs = 200;
  static const int standardMs = 300;
  static const int mediumMs = 450;
  static const int slowMs = 600;
  static const int xSlowMs = 900;

  // ── Elevation / Blur ──────────────────────────────────────
  // 📚 blur = BackdropFilter mein use hota hai (glassmorphism)
  static const double blurS = 8.0;
  static const double blurM = 16.0;
  static const double blurL = 24.0;
  static const double blurXL = 40.0;

  // ── Credit Card Aspect Ratio ──────────────────────────────
  // Standard credit card is 85.6mm × 53.98mm = 1.586 ratio
  // 📚 AspectRatio widget mein use hota hai
  static const double cardAspectRatio = 85.6 / 53.98; // ≈ 1.586

  // ── Bottom Nav ────────────────────────────────────────────
  static const double bottomNavHeight = 72.0;
  static const double bottomNavPadding = 12.0;

  // ── App Bar ───────────────────────────────────────────────
  static const double appBarHeight = 56.0;

  // ── Page Padding ─────────────────────────────────────────
  // Har screen ke left-right mein yeh padding rehti hai
  static const double pagePadding = s20;

  // ── Card EMV Chip Size ────────────────────────────────────
  static const double chipWidth = 42.0;
  static const double chipHeight = 28.0;

  // ── Section Label ─────────────────────────────────────────
  static const double sectionBarWidth = 4.0;
  static const double sectionBarHeight = 18.0;
}
