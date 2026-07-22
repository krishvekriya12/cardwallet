/// Card network (issuer network) detected from a BIN/IIN prefix.
enum CardNetwork {
  visa('Visa'),
  mastercard('Mastercard'),
  amex('American Express'),
  discover('Discover'),
  dinersClub('Diners Club'),
  jcb('JCB'),
  maestro('Maestro'),
  rupay('RuPay'),
  unionPay('UnionPay'),
  unknown('Card');

  final String label;

  const CardNetwork(this.label);
}

class CardUtils {
  CardUtils._();

  /// Standard Luhn (mod-10) checksum validation.
  static bool luhnCheck(String number) {
    final digits = number.replaceAll(RegExp(r'\D'), '');
    if (digits.length < 8) return false;

    var sum = 0;
    var alternate = false;
    for (var i = digits.length - 1; i >= 0; i--) {
      var n = int.parse(digits[i]);
      if (alternate) {
        n *= 2;
        if (n > 9) n -= 9;
      }
      sum += n;
      alternate = !alternate;
    }
    return sum % 10 == 0;
  }

  /// Detects the card network from the leading digits (BIN ranges).
  static CardNetwork detectNetwork(String number) {
    final digits = number.replaceAll(RegExp(r'\D'), '');
    if (digits.isEmpty) return CardNetwork.unknown;

    if (RegExp(r'^4').hasMatch(digits)) return CardNetwork.visa;
    if (RegExp(r'^(5[1-5]|2[2-7])').hasMatch(digits)) {
      return CardNetwork.mastercard;
    }
    if (RegExp(r'^3[47]').hasMatch(digits)) return CardNetwork.amex;
    if (RegExp(r'^6(?:011|5)').hasMatch(digits)) return CardNetwork.discover;
    if (RegExp(r'^3(?:0[0-5]|[68])').hasMatch(digits)) {
      return CardNetwork.dinersClub;
    }
    if (RegExp(r'^35(?:2[89]|[3-8])').hasMatch(digits)) return CardNetwork.jcb;
    if (RegExp(r'^(5018|5020|5038|5893|6304|6759|676[1-3])').hasMatch(digits)) {
      return CardNetwork.maestro;
    }
    if (RegExp(r'^60|^65|^81|^82|^508').hasMatch(digits)) {
      return CardNetwork.rupay;
    }
    if (RegExp(r'^62').hasMatch(digits)) return CardNetwork.unionPay;

    return CardNetwork.unknown;
  }

  /// Digit-group sizes for a given network (Amex 4-6-5, Diners 4-6-4, else
  /// standard 4-4-4-4...).
  static List<int> groupFormat(CardNetwork network) {
    switch (network) {
      case CardNetwork.amex:
        return [4, 6, 5];
      case CardNetwork.dinersClub:
        return [4, 6, 4];
      default:
        return [4, 4, 4, 4, 3];
    }
  }

  /// Formats raw digits into a spaced, network-aware grouping.
  static String formatCardNumber(String raw) {
    final digits = raw.replaceAll(RegExp(r'\D'), '');
    final groups = groupFormat(detectNetwork(digits));

    final buffer = StringBuffer();
    var index = 0;
    for (final size in groups) {
      if (index >= digits.length) break;
      final end = (index + size).clamp(0, digits.length);
      if (buffer.isNotEmpty) buffer.write(' ');
      buffer.write(digits.substring(index, end));
      index = end;
    }
    return buffer.toString();
  }

  static String maskNumber(String raw, {bool showLast4 = true}) {
    final digits = raw.replaceAll(RegExp(r'\D'), '');
    if (digits.length <= 4) return digits;
    final last4 = digits.substring(digits.length - 4);
    final network = detectNetwork(digits);
    final maskedLen = digits.length - 4;
    final masked = '•' * maskedLen;
    final combined = masked + last4;

    final groups = groupFormat(network);
    final buffer = StringBuffer();
    var index = 0;
    for (final size in groups) {
      if (index >= combined.length) break;
      final end = (index + size).clamp(0, combined.length);
      if (buffer.isNotEmpty) buffer.write(' ');
      buffer.write(combined.substring(index, end));
      index = end;
    }
    return buffer.toString();
  }
}
