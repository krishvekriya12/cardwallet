import 'package:flutter/material.dart';

import '../../../../core/utils/card_utils.dart';

/// Small payment-network mark drawn over a card (Mastercard interlocking
/// circles, Visa/Amex wordmarks, or a generic chip label). No image assets.
class NetworkLogo extends StatelessWidget {
  final CardNetwork network;
  final double height;

  const NetworkLogo({super.key, required this.network, this.height = 26});

  @override
  Widget build(BuildContext context) {
    switch (network) {
      case CardNetwork.mastercard:
        return SizedBox(
          height: height,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              _circle(const Color(0xFFEB001B)),
              Transform.translate(
                offset: Offset(-height * 0.32, 0),
                child: _circle(const Color(0xFFF79E1B), blend: true),
              ),
            ],
          ),
        );
      case CardNetwork.visa:
        return _wordmark('VISA', italic: true, size: height * 0.72);
      case CardNetwork.amex:
        return _wordmark('AMEX', size: height * 0.6);
      case CardNetwork.rupay:
        return _wordmark('RuPay', size: height * 0.6);
      case CardNetwork.discover:
        return _wordmark('DISCOVER', size: height * 0.44);
      default:
        return Icon(
          Icons.contactless_rounded,
          color: Colors.white.withValues(alpha: 0.9),
          size: height,
        );
    }
  }

  Widget _circle(Color color, {bool blend = false}) {
    return Container(
      width: height,
      height: height,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: blend ? color.withValues(alpha: 0.9) : color,
      ),
    );
  }

  Widget _wordmark(String text, {bool italic = false, double size = 18}) {
    return Text(
      text,
      style: TextStyle(
        color: Colors.white,
        fontSize: size,
        fontWeight: FontWeight.w800,
        fontStyle: italic ? FontStyle.italic : FontStyle.normal,
        letterSpacing: 1,
      ),
    );
  }
}
