import 'dart:math' as math;

import 'package:flutter/material.dart';
import '../../../cards/domain/entities/card_entity.dart';
import '../../../cards/presentation/widgets/card_preview.dart';

class CardDeckStack extends StatefulWidget {
  final List<CardEntity> cards;
  final void Function(CardEntity card) onCardTap;
  const CardDeckStack({super.key, required this.cards, required this.onCardTap});

  @override
  State<CardDeckStack> createState() => _CardDeckStackState();
}

class _CardDeckStackState extends State<CardDeckStack>
    with TickerProviderStateMixin {
  late List<CardEntity> _order;

  late final AnimationController _dragController;
  Animation<Offset>? _offsetAnim;
  Animation<double>? _rotAnim;
  Offset _dragOffset = Offset.zero;
  double _dragRotation = 0;
  bool _flyingAway = false;


  late final AnimationController _flipController;
  CardEntity? _flippingCard;

  @override
  void initState() {
    super.initState();
    _order = List.of(widget.cards);

    _dragController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 320),
    )..addListener(() {
      setState(() {
        _dragOffset = _offsetAnim?.value ?? _dragOffset;
        _dragRotation = _rotAnim?.value ?? _dragRotation;
      });
    });
    _dragController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          if (_flyingAway) {
            _order.add(_order.removeAt(0));
            _flyingAway = false;
          }
          _dragOffset = Offset.zero;
          _dragRotation = 0;
        });
      }
    });

    _flipController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 420),
    );
  }

  @override
  void didUpdateWidget(covariant CardDeckStack oldWidget) {
    super.didUpdateWidget(oldWidget);
    final oldIds = oldWidget.cards.map((c) => c.id).toList();
    final newIds = widget.cards.map((c) => c.id).toList();
    if (oldIds.length != newIds.length || !oldIds.toSet().containsAll(newIds)) {
      _order = List.of(widget.cards);
    } else {
      _order = _order
          .map((c) => widget.cards.cast<CardEntity>().firstWhere((n) => n.id == c.id, orElse: () => c))
          .toList();
    }
  }

  @override
  void dispose() {
    _dragController.dispose();
    _flipController.dispose();
    super.dispose();
  }

  void _onPanUpdate(DragUpdateDetails details) {
    if (_flipController.isAnimating) return;
    setState(() {
      _dragOffset += details.delta;
      _dragRotation = (_dragOffset.dx / 300).clamp(-0.5, 0.5);
    });
  }

  void _onPanEnd(DragEndDetails details) {
    final width = MediaQuery.of(context).size.width;
    final threshold = width * 0.22;
    final flungFast = details.velocity.pixelsPerSecond.dx.abs() > 700;
    if (_dragOffset.dx.abs() > threshold || flungFast) {
      _flyAway(_dragOffset.dx < 0 ? -1 : 1);
    } else {
      _snapBack();
    }
  }

  void _flyAway(int direction) {
    final width = MediaQuery.of(context).size.width;
    _flyingAway = true;
    _offsetAnim = Tween<Offset>(
      begin: _dragOffset,
      end: Offset(direction * width * 1.3, _dragOffset.dy + 40),
    ).animate(CurvedAnimation(parent: _dragController, curve: Curves.easeIn));
    _rotAnim = Tween<double>(begin: _dragRotation, end: direction * 0.7).animate(
      CurvedAnimation(parent: _dragController, curve: Curves.easeIn),
    );
    _dragController.forward(from: 0);
  }

  void _snapBack() {
    _flyingAway = false;
    _offsetAnim = Tween<Offset>(begin: _dragOffset, end: Offset.zero).animate(
      CurvedAnimation(parent: _dragController, curve: Curves.elasticOut),
    );
    _rotAnim = Tween<double>(begin: _dragRotation, end: 0).animate(
      CurvedAnimation(parent: _dragController, curve: Curves.elasticOut),
    );
    _dragController.forward(from: 0);
  }

  Future<void> _handleTap(CardEntity card) async {
    if (_dragOffset.distance > 6) return;
    setState(() => _flippingCard = card);
    await _flipController.forward(from: 0);
    if (!mounted) return;
    widget.onCardTap(card);
    _flipController.reset();
    setState(() => _flippingCard = null);
  }

  @override
  Widget build(BuildContext context) {
    if (_order.isEmpty) return const SizedBox.shrink();
    final visible = _order.take(3).toList();
    final width = MediaQuery.of(context).size.width;
    final threshold = width * 0.22;
    final progress = (_dragOffset.dx.abs() / threshold).clamp(0.0, 1.0);

    return SizedBox(
      height: 250,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          for (var i = visible.length - 1; i >= 0; i--)
            _buildCardAt(context, visible[i], i, progress),
        ],
      ),
    );
  }

  Widget _buildCardAt(BuildContext context, CardEntity card, int depth, double progress) {
    final content = Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: CardPreview.fromEntity(
        card: card,
        masked: true,
      ),
    );

    if (depth == 0) {
      final angleY = (_dragOffset.dx / 320).clamp(-0.35, 0.35);
      final angleX = -(_dragOffset.dy / 320).clamp(-0.2, 0.2);

      Widget front = Transform(
        alignment: Alignment.center,
        transform: Matrix4.identity()
          ..setEntry(3, 2, 0.0011)
          ..rotateY(angleY)
          ..rotateX(angleX),
        child: Transform.translate(
          offset: _dragOffset,
          child: content,
        ),
      );

      front = AnimatedBuilder(
        animation: _flipController,
        builder: (context, child) {
          if (_flippingCard?.id != card.id || _flipController.value == 0) {
            return child!;
          }
          final t = _flipController.value;
          final angle = t * math.pi;
          final matrix = Matrix4.identity()
            ..setEntry(3, 2, 0.0014)
            ..rotateX(-angle);
          final scale = 1 - (0.5 - (t - 0.5).abs()) * 0.16;
          return Transform(
            alignment: Alignment.center,
            transform: matrix..scaleByDouble(scale, scale, scale, 1.0),
            child: child,
          );
        },
        child: front,
      );

      return GestureDetector(
        onPanUpdate: _onPanUpdate,
        onPanEnd: _onPanEnd,
        onTap: () => _handleTap(card),
        child: front,
      );
    }

    final double scale;
    final double yOffset;
    final double opacity;

    if (depth == 1) {
      scale = 0.94 + 0.06 * progress;
      yOffset = -12.0 + 12.0 * progress;
      opacity = 1.0;
    } else {
      scale = 0.88 + 0.06 * progress;
      yOffset = -24.0 + 12.0 * progress;
      opacity = 0.6 + 0.4 * progress;
    }

    return Opacity(
      opacity: opacity,
      child: Transform.translate(
        offset: Offset(0, yOffset),
        child: Transform.scale(
          scale: scale,
          child: IgnorePointer(child: content),
        ),
      ),
    );
  }
}

