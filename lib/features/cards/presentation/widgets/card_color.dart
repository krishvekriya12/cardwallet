import 'package:flutter/material.dart';

import '../../../../core/theme/card_palette.dart';
import '../../domain/entities/card_entity.dart';
import '../../domain/entities/card_type.dart';

/// Resolves a card's solid color: a custom color the user picked, or the
/// card type's default solid color. If a gradient is defined, returns the first
/// color of the gradient as the dominant solid color.
Color resolveCardColor(CardEntity card) {
  final color = card.cardColor;
  if (color == null || color.isEmpty) {
    return CardType.fromValue(card.cardType).color;
  }
  try {
    final parts = color.split(',');
    return CardPalette.parseHex(parts[0]);
  } catch (_) {
    return CardType.fromValue(card.cardType).color;
  }
}

/// Resolves a card's background gradient if the card has a gradient custom color
/// (comma-separated hex string).
Gradient? resolveCardGradient(CardEntity card) {
  final color = card.cardColor;
  if (color == null || !color.contains(',')) {
    return null;
  }
  try {
    final parts = color.split(',');
    final colors = parts.map((h) => CardPalette.parseHex(h)).toList();
    return LinearGradient(
      colors: colors,
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );
  } catch (_) {
    return null;
  }
}
