import 'package:flutter/material.dart';

/// A realistic EMV-style contact chip: gold rounded rect with the classic
/// grid of contact pads, drawn with CustomPaint (no image assets).
class CardChip extends StatelessWidget {
  final double width;

  const CardChip({super.key, this.width = 42});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: width * 0.78,
      child: CustomPaint(painter: _ChipPainter()),
    );
  }
}

class _ChipPainter extends CustomPainter {
  static const _gold = Color(0xFFE8C77A);
  static const _goldDark = Color(0xFFC79A44);

  @override
  void paint(Canvas canvas, Size size) {
    final outer = RRect.fromRectAndRadius(
      Offset.zero & size,
      Radius.circular(size.height * 0.22),
    );

    canvas.drawRRect(outer, Paint()..color = _gold);
    canvas.drawRRect(
      outer,
      Paint()
        ..color = _goldDark
        ..style = PaintingStyle.stroke
        ..strokeWidth = 0.8,
    );

    final linePaint = Paint()
      ..color = _goldDark
      ..strokeWidth = 1.1;

    // Two vertical dividers.
    final x1 = size.width * 0.36;
    final x2 = size.width * 0.64;
    canvas.drawLine(Offset(x1, 0), Offset(x1, size.height), linePaint);
    canvas.drawLine(Offset(x2, 0), Offset(x2, size.height), linePaint);

    // Horizontal divider across the middle band only (between the two
    // verticals), matching the classic 6-pad EMV layout.
    final yMid = size.height * 0.5;
    canvas.drawLine(Offset(x1, yMid), Offset(x2, yMid), linePaint);

    // Outer horizontal bands (top/bottom) across the full width.
    final yTop = size.height * 0.28;
    final yBottom = size.height * 0.72;
    canvas.drawLine(Offset(0, yTop), Offset(x1, yTop), linePaint);
    canvas.drawLine(Offset(x2, yTop), Offset(size.width, yTop), linePaint);
    canvas.drawLine(Offset(0, yBottom), Offset(x1, yBottom), linePaint);
    canvas.drawLine(Offset(x2, yBottom), Offset(size.width, yBottom), linePaint);
  }

  @override
  bool shouldRepaint(covariant _ChipPainter oldDelegate) => false;
}
