import 'package:flutter/material.dart';

import '../../../../core/theme/app_palette.dart';
import '../../../../core/theme/card_palette.dart';
import '../../../../l10n/genrated/app_localizations.dart';

/// Row of solid color swatches + a custom-color option. Selecting `null`
/// means "use the card type's default color".
class CardColorPicker extends StatelessWidget {
  final String? selectedColor;
  final ValueChanged<String?> onChanged;

  const CardColorPicker({
    super.key,
    required this.selectedColor,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    Color? selected;
    final isGradient = selectedColor != null && selectedColor!.contains(',');
    if (selectedColor != null && selectedColor!.isNotEmpty) {
      try {
        final parts = selectedColor!.split(',');
        selected = CardPalette.parseHex(parts[0]);
      } catch (_) {}
    }
    final isPreset = !isGradient && selected != null &&
        CardPalette.presets.any((c) => c.toARGB32() == selected!.toARGB32());

    return SizedBox(
      height: 48,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          for (final color in CardPalette.presets)
            _Swatch(
              color: color,
              selected: !isGradient && selected?.toARGB32() == color.toARGB32(),
              onTap: () => onChanged(CardPalette.toHex(color)),
            ),
          _CustomSwatch(
            selected: selected != null && !isPreset,
            currentHex: selectedColor,
            onPicked: onChanged,
          ),
        ],
      ),
    );
  }
}

class _Swatch extends StatelessWidget {
  final Color color;
  final bool selected;
  final VoidCallback onTap;

  const _Swatch({
    required this.color,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 12),
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 160),
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
            border: Border.all(
              color: selected ? context.colors.primary : Colors.transparent,
              width: 2.5,
            ),
            boxShadow: [
              BoxShadow(
                color: color.withValues(
                    alpha: Theme.of(context).brightness == Brightness.dark
                        ? 0.12
                        : 0.20),
                blurRadius: 8,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: selected
              ? const Icon(Icons.check, color: Colors.white, size: 18)
              : null,
        ),
      ),
    );
  }
}

class _CustomSwatch extends StatelessWidget {
  final bool selected;
  final String? currentHex;
  final ValueChanged<String> onPicked;

  const _CustomSwatch({
    required this.selected,
    required this.currentHex,
    required this.onPicked,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final picked = await showModalBottomSheet<String>(
          context: context,
          builder: (_) => _CustomColorSheet(initialHex: currentHex),
        );
        if (picked != null) onPicked(picked);
      },
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: context.colors.surfaceAlt,
          shape: BoxShape.circle,
          border: Border.all(
            color: selected ? context.colors.primary : context.colors.border,
            width: selected ? 2.5 : 1,
          ),
        ),
        child: Icon(Icons.colorize_rounded,
            color: context.colors.textSecondary, size: 18),
      ),
    );
  }
}

/// HSV color picker matching the Jetpack Compose app's ColorPickerDialog:
/// Solid/Gradient tabs, a saturation-value box, and a hue slider.
class _CustomColorSheet extends StatefulWidget {
  final String? initialHex;

  const _CustomColorSheet({this.initialHex});

  @override
  State<_CustomColorSheet> createState() => _CustomColorSheetState();
}

class _CustomColorSheetState extends State<_CustomColorSheet> {
  late bool _gradientMode;
  late HSVColor _color1;
  late HSVColor _color2;
  int _activeIndex = 0;

  @override
  void initState() {
    super.initState();
    final hex = widget.initialHex;
    _gradientMode = hex != null && hex.contains(',');
    final parts = (hex ?? '').split(',');
    
    // Fallback requires context, so we defer initialization logic slightly
    // or assume the AppColors default is accessible or use a context-aware approach.
    // For now keeping consistent with existing structure:
    final c1 = parts.isNotEmpty && parts[0].isNotEmpty
        ? CardPalette.parseHex(parts[0])
        : null; // Placeholder
    final c2 = parts.length > 1 && parts[1].isNotEmpty
        ? CardPalette.parseHex(parts[1])
        : null;
    _color1 = HSVColor.fromColor(c1 ?? Colors.blue);
    _color2 = HSVColor.fromColor(c2 ?? (c1 ?? Colors.blue));
  }

  HSVColor get _active => _activeIndex == 0 ? _color1 : _color2;

  set _active(HSVColor value) {
    setState(() {
      if (_activeIndex == 0) {
        _color1 = value;
      } else {
        _color2 = value;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final color1 = _color1.toColor();
    final color2 = _color2.toColor();

    final l10n = AppLocalizations.of(context)!;
    return SingleChildScrollView(
      padding: EdgeInsets.only(
        left: 24,
        right: 24,
        top: 20,
        bottom: 24 + MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            l10n.selectCustomColor,
            style: TextStyle(
              color: context.colors.textPrimary,
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 16),
          _ModeTabs(
            gradientMode: _gradientMode,
            onChanged: (v) => setState(() => _gradientMode = v),
          ),
          const SizedBox(height: 18),
          if (_gradientMode)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _ColorEndpoint(
                  color: color1,
                  label: l10n.startColor,
                  selected: _activeIndex == 0,
                  onTap: () => setState(() => _activeIndex = 0),
                ),
                Expanded(
                  child: Container(
                    height: 40,
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: context.colors.border),
                      gradient: LinearGradient(colors: [color1, color2]),
                    ),
                  ),
                ),
                _ColorEndpoint(
                  color: color2,
                  label: l10n.endColor,
                  selected: _activeIndex == 1,
                  onTap: () => setState(() => _activeIndex = 1),
                ),
              ],
            )
          else
            Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: color1,
                    shape: BoxShape.circle,
                    border: Border.all(color: context.colors.border),
                  ),
                ),
                const SizedBox(width: 16),
                Text(
                  CardPalette.toHex(color1),
                  style: TextStyle(
                    color: context.colors.textSecondary,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          const SizedBox(height: 20),
          SizedBox(
            height: 200,
            child: Row(
              children: [
                Expanded(
                  child: _SatValBox(
                    hsv: _active,
                    onChanged: (s, v) =>
                        _active = _active.withSaturation(s).withValue(v),
                  ),
                ),
                const SizedBox(width: 16),
                SizedBox(
                  width: 30,
                  child: _HueSlider(
                    hue: _active.hue,
                    onChanged: (h) => _active = _active.withHue(h),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text(l10n.cancel),
              ),
              const SizedBox(width: 8),
              FilledButton(
                style: FilledButton.styleFrom(
                  backgroundColor: context.colors.primary,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 12,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  final hex1 = CardPalette.toHex(color1);
                  final result = _gradientMode
                      ? '$hex1,${CardPalette.toHex(color2)}'
                      : hex1;
                  Navigator.of(context).pop(result);
                },
                child: Text(l10n.doneBtn),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ModeTabs extends StatelessWidget {
  final bool gradientMode;
  final ValueChanged<bool> onChanged;

  const _ModeTabs({required this.gradientMode, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Container(
      decoration: BoxDecoration(
        color: context.colors.surfaceAlt,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.all(4),
      child: Row(
        children: [
          Expanded(child: _tab(context, l10n.solidColor, !gradientMode, () => onChanged(false))),
          Expanded(child: _tab(context, l10n.gradientColor, gradientMode, () => onChanged(true))),
        ],
      ),
    );
  }

  Widget _tab(BuildContext context, String label, bool selected, VoidCallback onTap) {
    final c = context.colors;
    final isDark = c.isDark;
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 160),
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: selected
              ? (isDark ? c.primarySoft : c.surface)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
          boxShadow: selected && !isDark
              ? [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.06),
                    blurRadius: 4,
                  ),
                ]
              : null,
        ),
        alignment: Alignment.center,
        child: Text(
          label,
          style: TextStyle(
            color: selected ? c.primary : c.textSecondary,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

class _ColorEndpoint extends StatelessWidget {
  final Color color;
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const _ColorEndpoint({
    required this.color,
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
              border: Border.all(
                color: selected ? context.colors.primary : context.colors.border,
                width: selected ? 3 : 1,
              ),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: selected ? context.colors.textPrimary : context.colors.textMuted,
            ),
          ),
        ],
      ),
    );
  }
}

class _SatValBox extends StatelessWidget {
  final HSVColor hsv;
  final void Function(double saturation, double value) onChanged;

  const _SatValBox({required this.hsv, required this.onChanged});

  void _handle(Offset localPosition, Size size) {
    final s = (localPosition.dx / size.width).clamp(0.0, 1.0);
    final v = 1 - (localPosition.dy / size.height).clamp(0.0, 1.0);
    onChanged(s, v);
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final size = Size(constraints.maxWidth, constraints.maxHeight);
        return ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: GestureDetector(
            onPanUpdate: (d) => _handle(d.localPosition, size),
            onTapDown: (d) => _handle(d.localPosition, size),
            child: CustomPaint(
              size: size,
              painter: _SatValPainter(hsv: hsv),
            ),
          ),
        );
      },
    );
  }
}

class _SatValPainter extends CustomPainter {
  final HSVColor hsv;

  _SatValPainter({required this.hsv});

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;
    final hueColor = HSVColor.fromAHSV(1, hsv.hue, 1, 1).toColor();

    canvas.drawRect(
      rect,
      Paint()
        ..shader = LinearGradient(
          colors: [Colors.white, hueColor],
        ).createShader(rect),
    );
    canvas.drawRect(
      rect,
      Paint()
        ..shader = const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.transparent, Colors.black],
        ).createShader(rect),
    );

    final center = Offset(hsv.saturation * size.width, (1 - hsv.value) * size.height);
    canvas.drawCircle(
      center,
      7,
      Paint()
        ..color = Colors.white
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2.5,
    );
  }

  @override
  bool shouldRepaint(covariant _SatValPainter oldDelegate) =>
      oldDelegate.hsv != hsv;
}

class _HueSlider extends StatelessWidget {
  final double hue;
  final ValueChanged<double> onChanged;

  const _HueSlider({required this.hue, required this.onChanged});

  void _handle(Offset localPosition, Size size) {
    final t = (localPosition.dy / size.height).clamp(0.0, 1.0);
    onChanged(360 - t * 360);
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final size = Size(constraints.maxWidth, constraints.maxHeight);
        return ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: GestureDetector(
            onPanUpdate: (d) => _handle(d.localPosition, size),
            onTapDown: (d) => _handle(d.localPosition, size),
            child: CustomPaint(
              size: size,
              painter: _HuePainter(hue: hue),
            ),
          ),
        );
      },
    );
  }
}

class _HuePainter extends CustomPainter {
  final double hue;

  _HuePainter({required this.hue});

  static const _rainbow = [
    Colors.red,
    Colors.pink,
    Colors.blue,
    Colors.cyan,
    Colors.green,
    Colors.yellow,
    Colors.red,
  ];

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;
    canvas.drawRect(
      rect,
      Paint()
        ..shader = const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: _rainbow,
        ).createShader(rect),
    );

    final cy = ((360 - hue) / 360) * size.height;
    final indicator = Rect.fromLTWH(0, cy - 2, size.width, 4);
    canvas.drawRect(indicator, Paint()..color = Colors.white);
    canvas.drawRect(
      indicator,
      Paint()
        ..color = Colors.black
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1,
    );
  }

  @override
  bool shouldRepaint(covariant _HuePainter oldDelegate) => oldDelegate.hue != hue;
}
