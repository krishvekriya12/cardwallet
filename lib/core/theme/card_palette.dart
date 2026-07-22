// ============================================================
// card_palette.dart — Premium gradient definitions for each card type
// ============================================================
//
// 📚 FLUTTER CONCEPT: LinearGradient
//
// LinearGradient ek effect hai jisme ek color dheere dheere
// doosre color mein blend hota hai.
//
// LinearGradient(
//   begin: Alignment.topLeft,   ← gradient kahan se shuru
//   end: Alignment.bottomRight, ← kahan khatam
//   colors: [Color1, Color2],   ← konse colors blend honge
//   stops: [0.0, 1.0],         ← kahan kahan color change ho (optional)
// )
//
// Alignment values:
//   Alignment.topLeft     = upper-left corner
//   Alignment.topRight    = upper-right corner
//   Alignment.bottomLeft  = lower-left corner
//   Alignment.bottomRight = lower-right corner
//   Alignment.center      = center
//
// ============================================================

import 'package:flutter/material.dart';

/// Defines the complete visual identity for each card type.
/// Used in CardPreview widget and AddCard color picker.
class CardTypeGradient {
  final String name;
  final List<Color> colors;
  final AlignmentGeometry begin;
  final AlignmentGeometry end;
  final List<double>? stops;

  const CardTypeGradient({
    required this.name,
    required this.colors,
    this.begin = Alignment.topLeft,
    this.end = Alignment.bottomRight,
    this.stops,
  });

  /// Convert to Flutter LinearGradient
  LinearGradient toGradient() => LinearGradient(
        begin: begin,
        end: end,
        colors: colors,
        stops: stops,
      );

  /// Dominant color for shadows, icons
  Color get dominantColor => colors.first;
}

abstract final class CardPalette {
  CardPalette._();

  // ── 8 Card Type Gradients ─────────────────────────────────
  // Each one feels unique — no two look alike

  /// Credit Card — Deep Space: Rich Purple → Electric Blue
  static const credit = CardTypeGradient(
    name: 'Deep Space',
    colors: [Color(0xFF4A00E0), Color(0xFF2D6AE0), Color(0xFF1CB5E0)],
    stops: [0.0, 0.5, 1.0],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  /// Debit Card — Ocean Depth: Emerald → Dark Teal
  static const debit = CardTypeGradient(
    name: 'Ocean Depth',
    colors: [Color(0xFF00B09B), Color(0xFF0A7A6A), Color(0xFF064D43)],
    stops: [0.0, 0.5, 1.0],
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
  );

  /// Point / Loyalty — Sunset: Amber → Deep Orange → Red
  static const point = CardTypeGradient(
    name: 'Sunset',
    colors: [Color(0xFFFFB347), Color(0xFFFF6B35), Color(0xFFC0392B)],
    stops: [0.0, 0.55, 1.0],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  /// Membership — Midnight: Dark Navy → Indigo
  static const membership = CardTypeGradient(
    name: 'Midnight',
    colors: [Color(0xFF1A237E), Color(0xFF283593), Color(0xFF3949AB)],
    stops: [0.0, 0.6, 1.0],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  /// Coupon — Rose Blossom: Pink → Violet
  static const coupon = CardTypeGradient(
    name: 'Rose Blossom',
    colors: [Color(0xFFEC407A), Color(0xFFAB47BC), Color(0xFF7E57C2)],
    stops: [0.0, 0.5, 1.0],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  /// Gift Card — Golden Hour: Gold → Amber → Deep Orange
  static const gift = CardTypeGradient(
    name: 'Golden Hour',
    colors: [Color(0xFFFFD700), Color(0xFFFFB300), Color(0xFFE65100)],
    stops: [0.0, 0.45, 1.0],
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
  );

  /// Event Ticket — Jungle: Emerald → Forest Green
  static const eventTicket = CardTypeGradient(
    name: 'Jungle',
    colors: [Color(0xFF00C853), Color(0xFF00897B), Color(0xFF004D40)],
    stops: [0.0, 0.5, 1.0],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  /// Other — Nebula: Indigo → Deep Purple
  static const other = CardTypeGradient(
    name: 'Nebula',
    colors: [Color(0xFF5C6BC0), Color(0xFF512DA8), Color(0xFF4A148C)],
    stops: [0.0, 0.5, 1.0],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  // ── Ordered list (matches CardType enum index) ────────────
  // 📚 List in Dart: elements in square brackets, 0-indexed
  static const all = [
    credit,     // index 0 = CardType.credit
    debit,      // index 1 = CardType.debit
    point,      // index 2 = CardType.point
    membership, // index 3 = CardType.membership
    coupon,     // index 4 = CardType.coupon
    gift,       // index 5 = CardType.gift
    eventTicket,// index 6 = CardType.eventTicket
    other,      // index 7 = CardType.other
  ];

  /// Get gradient for a card type by index
  static CardTypeGradient forIndex(int index) {
    if (index < 0 || index >= all.length) return other;
    return all[index];
  }

  // ── Custom single-color options (for color picker) ────────
  // Users can also pick a solid color instead of gradient
  static const solidOptions = [
    Color(0xFF6C63FF), // Indigo
    Color(0xFFFF6584), // Coral
    Color(0xFF00D9A5), // Mint
    Color(0xFFFF9A3C), // Amber
    Color(0xFF3CAEFC), // Sky
    Color(0xFF00B09B), // Teal
    Color(0xFFEC407A), // Pink
    Color(0xFF4A00E0), // Purple
    Color(0xFF1A237E), // Navy
    Color(0xFF004D40), // Forest
    Color(0xFF37474F), // Slate
    Color(0xFF212121), // Charcoal
  ];

  // ── Shimmer / Holographic overlay ─────────────────────────
  // Diagonal light sweep on cards for premium feel
  static LinearGradient get holographicShimmer => const LinearGradient(
        begin: Alignment(-1.0, -1.0),
        end: Alignment(0.5, 0.5),
        colors: [
          Color(0x22FFFFFF),
          Color(0x00FFFFFF),
        ],
      );

  // ── Card top glass shine ──────────────────────────────────
  static LinearGradient get cardGloss => const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment(0.4, 0.4),
        colors: [
          Color(0x20FFFFFF),
          Color(0x00FFFFFF),
        ],
      );

  // ── Default type colors (for icons, badges) ───────────────
  static const List<Color> typeDefaults = [
    Color(0xFF4A00E0), // credit
    Color(0xFF00B09B), // debit
    Color(0xFFFF6B35), // point
    Color(0xFF1A237E), // membership
    Color(0xFFEC407A), // coupon
    Color(0xFFFFB300), // gift
    Color(0xFF00C853), // event
    Color(0xFF5C6BC0), // other
  ];

  // ── Preset solid colors list (alias for solidOptions) ─────
  // 📚 getter 'presets' = solidOptions ka alias
  static List<Color> get presets => solidOptions;

  // ── Hex Color utilities ───────────────────────────────────
  //
  // 📚 HEX COLOR FORMAT:
  // '#FF6C63FF' = Alpha(FF) Red(6C) Green(63) Blue(FF)
  // DB mein colors as String (hex) save karte hain
  // Display karne ke liye Color object mein convert karte hain
  //

  /// Convert hex String → Flutter Color
  /// Input: '#FF6C63FF' or '6C63FF' (with or without # and alpha)
  static Color parseHex(String hex) {
    // # remove karo
    var h = hex.replaceAll('#', '');

    // 6 chars = no alpha → add FF (fully opaque)
    if (h.length == 6) h = 'FF$h';

    // 📚 int.parse() = String → int
    // radix: 16 = hexadecimal parsing
    return Color(int.parse(h, radix: 16));
  }

  /// Convert Flutter Color → hex String (with alpha)
  /// Output: '#FF6C63FF'
  static String toHex(Color color) {
    // 📚 toRadixString(16) = int → hex string
    // padLeft(2, '0') = minimum 2 chars, pad with '0' if needed
    // toUpperCase() = 'ff' → 'FF'
    final a = (color.a * 255).round().toRadixString(16).padLeft(2, '0');
    final r = (color.r * 255).round().toRadixString(16).padLeft(2, '0');
    final g = (color.g * 255).round().toRadixString(16).padLeft(2, '0');
    final b = (color.b * 255).round().toRadixString(16).padLeft(2, '0');
    return '#$a$r$g$b'.toUpperCase();
  }
}

