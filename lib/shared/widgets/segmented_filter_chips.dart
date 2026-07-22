import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';
import '../../core/theme/app_palette.dart';

class FilterChipData {
  final String label;
  final int count;

  const FilterChipData({required this.label, required this.count});
}

/// Horizontal filter-chip row: selected = solid blue pill, unselected =
/// white pill with a hairline border.
class SegmentedFilterChips extends StatelessWidget {
  final List<FilterChipData> items;
  final int selectedIndex;
  final ValueChanged<int> onSelected;

  const SegmentedFilterChips({
    super.key,
    required this.items,
    required this.selectedIndex,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    return SizedBox(
      height: 38,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        separatorBuilder: (_, _) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          final item = items[index];
          final selected = index == selectedIndex;
          return GestureDetector(
            onTap: () => onSelected(index),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 180),
              curve: Curves.easeOut,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: selected ? c.primary : c.surface,
                borderRadius: BorderRadius.circular(19),
                border: Border.all(
                  color: selected ? c.primary : c.border,
                ),
              ),
              alignment: Alignment.center,
              child: Text(
                '${item.label}  ${item.count}',
                style: TextStyle(
                  color: selected ? AppColors.white : c.textSecondary,
                  fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
                  fontSize: 13,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
