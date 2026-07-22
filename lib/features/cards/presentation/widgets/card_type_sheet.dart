import 'package:flutter/material.dart';

import '../../../../core/theme/app_palette.dart';
import '../../domain/entities/card_type.dart';
import '../../../../l10n/genrated/app_localizations.dart';

Future<CardType?> showCardTypeSheet(BuildContext context, CardType current) {
  final isDark = Theme.of(context).brightness == Brightness.dark;
  return showModalBottomSheet<CardType>(
    context: context,
    backgroundColor: isDark ? context.colors.surface : Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
      side: BorderSide(
        color: isDark ? context.colors.border : Colors.grey.withValues(alpha: 0.3),
        width: 1.2,
      ),
    ),
    builder: (context) {
      final c = context.colors;
      final l10n = AppLocalizations.of(context)!;
      return SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  margin: const EdgeInsets.only(bottom: 18),
                  decoration: BoxDecoration(
                    color: c.border,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              Text(
                l10n.chooseCardType,
                style: TextStyle(
                  color: c.textPrimary,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 16),
              GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 3.2,
                children: [
                  for (final type in CardType.values)
                    _TypeTile(
                      type: type,
                      selected: type == current,
                      onTap: () => Navigator.of(context).pop(type),
                    ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}

class _TypeTile extends StatelessWidget {
  final CardType type;
  final bool selected;
  final VoidCallback onTap;

  const _TypeTile({
    required this.type,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          color: selected ? c.primarySoft : c.surfaceAlt,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: selected ? c.primary : c.border,
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                color: type.color,
                borderRadius: BorderRadius.circular(9),
              ),
              child: Icon(type.icon, size: 16, color: Colors.white),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                type.getLocalizedLabel(context),
                style: TextStyle(
                  color: selected ? c.primary : c.textPrimary,
                  fontWeight: FontWeight.w600,
                  fontSize: 13,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
