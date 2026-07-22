import 'package:flutter/material.dart';

import '../../../cards/domain/entities/card_entity.dart';
import '../../../cards/presentation/widgets/card_preview.dart';
import '../../../../shared/widgets/animated_press_scale.dart';

class HomeCardCarousel extends StatefulWidget {
  final List<CardEntity> cards;
  final void Function(CardEntity card) onCardTap;

  const HomeCardCarousel({
    super.key,
    required this.cards,
    required this.onCardTap,
  });

  @override
  State<HomeCardCarousel> createState() => _HomeCardCarouselState();
}

class _HomeCardCarouselState extends State<HomeCardCarousel>
    with TickerProviderStateMixin {
  late List<CardEntity> _order;
  late final AnimationController _swipeOutController;
  late final AnimationController _slideInController;

  Animation<Offset>? _swipeOutOffsetAnim;
  Animation<double>? _swipeOutRotAnim;

  Animation<Offset>? _slideInOffsetAnim;
  Animation<double>? _slideInRotAnim;

  Offset _dragOffset = Offset.zero;
  double _dragRotation = 0;
  bool _flyingAway = false;

  int? _returningCardId;
  Offset _backCardOffset = Offset.zero;
  double _backCardRotation = 0;

  @override
  void initState() {
    super.initState();
    _order = List.of(widget.cards);

    _swipeOutController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 240),
    )..addListener(() {
        setState(() {
          _dragOffset = _swipeOutOffsetAnim?.value ?? _dragOffset;
          _dragRotation = _swipeOutRotAnim?.value ?? _dragRotation;
        });
      });

    _swipeOutController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        if (_flyingAway) {
          final swipedCard = _order[0];
          setState(() {
            _order.add(_order.removeAt(0));
            _returningCardId = swipedCard.id;
            _flyingAway = false;

            _backCardOffset = _dragOffset;
            _backCardRotation = _dragRotation;

            _dragOffset = Offset.zero;
            _dragRotation = 0;
          });

          _slideInOffsetAnim = Tween<Offset>(
            begin: _backCardOffset,
            end: Offset.zero,
          ).animate(CurvedAnimation(
            parent: _slideInController,
            curve: Curves.easeOutBack,
          ));

          final visibleCount = _order.take(3).length;
          final targetDepth = visibleCount - 1;
          final double targetRot = targetDepth == 2 ? 0.05 : (targetDepth == 1 ? 0.08 : 0.0);

          _slideInRotAnim = Tween<double>(
            begin: _backCardRotation,
            end: targetRot,
          ).animate(CurvedAnimation(
            parent: _slideInController,
            curve: Curves.easeOutBack,
          ));

          _slideInController.forward(from: 0);
        }
      }
    });

    _slideInController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 320),
    )..addListener(() {
        setState(() {
          _backCardOffset = _slideInOffsetAnim?.value ?? _backCardOffset;
          _backCardRotation = _slideInRotAnim?.value ?? _backCardRotation;
        });
      });

    _slideInController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          _returningCardId = null;
          _backCardOffset = Offset.zero;
          _backCardRotation = 0;
        });
      }
    });
  }

  @override
  void didUpdateWidget(covariant HomeCardCarousel oldWidget) {
    super.didUpdateWidget(oldWidget);
    final oldIds = oldWidget.cards.map((c) => c.id).toSet();
    final newIds = widget.cards.map((c) => c.id).toSet();
    if (!oldIds.containsAll(newIds) || !newIds.containsAll(oldIds)) {
      _order = List.of(widget.cards);
    } else {
      _order = _order
          .map((c) => widget.cards
              .cast<CardEntity>()
              .firstWhere((n) => n.id == c.id, orElse: () => c))
          .toList();
    }
  }

  @override
  void dispose() {
    _swipeOutController.dispose();
    _slideInController.dispose();
    super.dispose();
  }

  void _onPanUpdate(DragUpdateDetails details) {
    if (_swipeOutController.isAnimating || _slideInController.isAnimating) return;
    setState(() {
      _dragOffset += details.delta;
      _dragRotation = (_dragOffset.dx / 300).clamp(-0.5, 0.5);
    });
  }

  void _onPanEnd(DragEndDetails details) {
    if (_swipeOutController.isAnimating || _slideInController.isAnimating) return;
    final width = MediaQuery.of(context).size.width;
    final threshold = width * 0.25;
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
    _swipeOutOffsetAnim = Tween<Offset>(
      begin: _dragOffset,
      end: Offset(direction * width * 0.95, _dragOffset.dy + 20),
    ).animate(CurvedAnimation(
        parent: _swipeOutController, curve: Curves.easeOutCubic));
    _swipeOutRotAnim = Tween<double>(
      begin: _dragRotation,
      end: direction * 0.35,
    ).animate(CurvedAnimation(
        parent: _swipeOutController, curve: Curves.easeOutCubic));
    _swipeOutController.forward(from: 0);
  }

  void _snapBack() {
    _flyingAway = false;
    _swipeOutOffsetAnim = Tween<Offset>(begin: _dragOffset, end: Offset.zero)
        .animate(CurvedAnimation(
            parent: _swipeOutController, curve: Curves.elasticOut));
    _swipeOutRotAnim = Tween<double>(begin: _dragRotation, end: 0).animate(
        CurvedAnimation(
            parent: _swipeOutController, curve: Curves.elasticOut));
    _swipeOutController.forward(from: 0);
  }

  Widget _buildCard(CardEntity card, {Key? key}) {
    return Hero(
      tag: 'home_card_hero_${card.id}',
      child: Material(
        type: MaterialType.transparency,
        child: CardPreview.fromEntity(
          key: key,
          card: card,
          masked: true,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_order.isEmpty) return const SizedBox.shrink();

    final visible = _order.take(3).toList();
    final width = MediaQuery.of(context).size.width;
    final threshold = width * 0.25;
    final progress = (_dragOffset.dx.abs() / threshold).clamp(0.0, 1.0);

    final cardWidth = width - 40; // horizontal padding: 20 * 2
    final cardHeight = cardWidth / 1.586;
    final carouselHeight = cardHeight + 40.0; // peak offset of the back-most card is 40.0

    return SizedBox(
      height: carouselHeight,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          for (var i = visible.length - 1; i >= 0; i--)
            _buildCardAt(context, visible[i], i, progress),
        ],
      ),
    );
  }

  Widget _buildCardAt(
      BuildContext context, CardEntity card, int depth, double progress) {
    final cardWidget = _buildCard(card, key: ValueKey('card-${card.id}'));

    if (depth == 0) {
      final angleY = (_dragOffset.dx / 320).clamp(-0.35, 0.35);
      final angleX = -(_dragOffset.dy / 320).clamp(-0.2, 0.2);

      return Transform(
        alignment: Alignment.center,
        transform: Matrix4.identity()
          ..setEntry(3, 2, 0.0011)
          ..rotateY(angleY)
          ..rotateX(angleX),
        child: Transform.translate(
          offset: _dragOffset,
          child: GestureDetector(
            onPanUpdate: _onPanUpdate,
            onPanEnd: _onPanEnd,
            child: AnimatedPressScale(
              onTap: () => widget.onCardTap(card),
              child: cardWidget,
            ),
          ),
        ),
      );
    }

    // Depth > 0 (second or third card behind)
    final double scale;
    final double yOffset;
    final double opacity;
    final double rot;

    if (depth == 1) {
      scale = 0.94 + 0.06 * progress;
      yOffset = -22.0 + 22.0 * progress;
      opacity = 1.0;
      rot = 0.08 * (1.0 - progress);
    } else {
      scale = 0.88 + 0.06 * progress;
      yOffset = -40.0 + 18.0 * progress;
      opacity = 0.6 + 0.4 * progress;
      rot = 0.05 + 0.03 * progress;
    }

    Widget child = Transform.scale(
      scale: scale,
      child: IgnorePointer(child: cardWidget),
    );

    if (card.id == _returningCardId) {
      final angleY = (_backCardOffset.dx / 320).clamp(-0.35, 0.35);
      final angleX = -(_backCardOffset.dy / 320).clamp(-0.2, 0.2);
      child = Transform(
        alignment: Alignment.center,
        transform: Matrix4.identity()
          ..setEntry(3, 2, 0.0011)
          ..rotateY(angleY)
          ..rotateX(angleX)
          ..rotateZ(_backCardRotation),
        child: Transform.translate(
          offset: _backCardOffset,
          child: child,
        ),
      );
    } else {
      child = Transform.rotate(
        angle: rot,
        alignment: Alignment.center,
        child: child,
      );
    }

    return Opacity(
      opacity: opacity,
      child: Transform.translate(
        offset: Offset(0, yOffset),
        child: child,
      ),
    );
  }
}

