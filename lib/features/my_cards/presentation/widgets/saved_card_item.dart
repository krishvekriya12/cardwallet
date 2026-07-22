import 'package:flutter/material.dart';
import '../../../../shared/widgets/animated_press_scale.dart';
import '../../../cards/domain/entities/card_entity.dart';
import '../../../cards/presentation/widgets/card_preview.dart';

class SavedCardItem extends StatelessWidget {
  final CardEntity card;
  final VoidCallback onTap;

  const SavedCardItem({super.key, required this.card, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return AnimatedPressScale(
      onTap: onTap,
      child: Hero(
        tag: 'my_cards_card_hero_${card.id}',
        child: Material(
          type: MaterialType.transparency,
          child: CardPreview.fromEntity(
            card: card,
            masked: true,
            showReminder: card.reminderEnabled,
          ),
        ),
      ),
    );
  }
}
