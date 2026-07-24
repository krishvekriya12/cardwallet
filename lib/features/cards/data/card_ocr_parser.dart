import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import '../../../core/utils/card_utils.dart';
import '../domain/entities/card_type.dart';


class CardOcrResult {
  final String? number;
  final String? expiry;
  final String? holderName;
  final String? bankName;
  final String? cardBrand;
  final String? cvv;
  final CardType detectedType;
  final String? imagePath;
  final double confidence;

  const CardOcrResult({
    this.number,
    this.expiry,
    this.holderName,
    this.bankName,
    this.cardBrand,
    this.cvv,
    this.detectedType = CardType.credit,
    this.imagePath,
    this.confidence = 0.0,
  });

  bool get hasAnything =>
      number != null ||
          expiry != null ||
          holderName != null ||
          bankName != null ||
          cardBrand != null;

  int get detectedFieldCount {
    int count = 0;
    if (number != null && number!.isNotEmpty) count++;
    if (expiry != null && expiry!.isNotEmpty) count++;
    if (holderName != null && holderName!.isNotEmpty) count++;
    if (bankName != null && bankName!.isNotEmpty) count++;
    if (cardBrand != null && cardBrand!.isNotEmpty) count++;
    if (cvv != null && cvv!.isNotEmpty) count++;
    return count;
  }
}


class CardOcrParser {
  CardOcrParser._();

  static CardOcrResult parseRecognizedText(
      RecognizedText recognizedText, {
        String? imagePath,
      }) {
    final rawText = recognizedText.text;
    final blocks = recognizedText.blocks;

    final lines = <String>[];
    for (final b in blocks) {
      for (final l in b.lines) {
        final t = l.text.trim();
        if (t.isNotEmpty) lines.add(t);
      }
    }

    final upperText = rawText.toUpperCase();

    final detectedType = _classifyCardType(upperText);

    final numberExtraction = _extractCardNumberWithSource(lines, rawText);
    final number = numberExtraction.$1;
    final numberLineIndex = numberExtraction.$2;
    final numberDigits = number?.replaceAll(RegExp(r'\D'), '');

    final expiry = _extractExpiryDate(lines, rawText, numberDigits);

    final cvv = _extractCvv(lines, rawText);

    final brand = _detectBrand(upperText, number);

    final bankName = _extractBankName(lines, upperText);

    final holderName = _extractHolderName(
      lines,
      numberLineIndex,
      bankName,
    );

    double conf = 20.0;
    if (number != null && number.isNotEmpty) {
      conf += CardUtils.luhnCheck(numberDigits ?? '') ? 40.0 : 15.0;
    }
    if (expiry != null && expiry.isNotEmpty) conf += 15.0;
    if (holderName != null && holderName.isNotEmpty) conf += 12.0;
    if (bankName != null && bankName.isNotEmpty) conf += 5.0;
    if (brand != null && brand.isNotEmpty) conf += 3.0;
    if (conf > 99.0) conf = 99.0;

    return CardOcrResult(
      number: number,
      expiry: expiry,
      holderName: holderName,
      bankName: bankName,
      cardBrand: brand,
      cvv: cvv,
      detectedType: detectedType,
      imagePath: imagePath,
      confidence: conf,
    );
  }

  static CardOcrResult parse(String rawText, {String? imagePath}) {
    return parseRecognizedText(
      RecognizedText(text: rawText, blocks: []),
      imagePath: imagePath,
    );
  }


  static CardType _classifyCardType(String upper) {
    if (_containsAny(upper, ['GIFT CARD', 'GIFTCARD', 'GIFT CERTIFICATE', 'CLAIM CODE', 'AMAZON GIFT', 'APPLE GIFT', 'GOOGLE PLAY GIFT'])) {
      return CardType.gift;
    }
    if (_containsAny(upper, ['COUPON', 'PROMO CODE', 'VOUCHER', 'DISCOUNT CODE', 'OFFER CODE', '% OFF'])) {
      return CardType.coupon;
    }
    if (_containsAny(upper, ['BOARDING PASS', 'EVENT TICKET', 'MOVIE TICKET', 'PNR NO', 'BOOKING ID'])) {
      return CardType.eventTicket;
    }
    if (_containsAny(upper, ['LOYALTY', 'POINT CARD', 'CLUB CARD', 'FREQUENT FLYER', 'STARBUCKS', 'PAYBACK'])) {
      return CardType.point;
    }
    if (_containsAny(upper, ['MEMBERSHIP', 'MEMBER ID', 'DRIVING LICENCE', 'DRIVING LICENSE', 'PASSPORT', 'AADHAAR', 'VOTER ID', 'STUDENT ID', 'EMPLOYEE ID'])) {
      return CardType.membership;
    }
    if (upper.contains('DEBIT')) return CardType.debit;
    if (_containsAny(upper, ['CREDIT', 'VISA', 'MASTERCARD', 'AMEX', 'RUPAY', 'AMERICAN EXPRESS'])) {
      return CardType.credit;
    }
    return CardType.other;
  }

  static bool _containsAny(String text, List<String> keywords) {
    for (final k in keywords) {
      if (text.contains(k)) return true;
    }
    return false;
  }

  static String _fixOcrDigits(String text) {
    final sb = StringBuffer();
    for (int i = 0; i < text.length; i++) {
      final c = text[i];
      switch (c) {
        case 'O': case 'o': case 'Q': case 'D': sb.write('0'); break;
        case 'I': case 'l': case '|': case 'i': case '!': sb.write('1'); break;
        case 'Z': case 'z': sb.write('2'); break;
        case 'S': case 's': case '\$': sb.write('5'); break;
        case 'B': sb.write('8'); break;
        case 'G': case 'g': sb.write('6'); break;
        case 'A': case 'a': sb.write('4'); break;
        case 'T': case 't': sb.write('7'); break;
        default: sb.write(c);
      }
    }
    return sb.toString();
  }

  static (String?, int) _extractCardNumberWithSource(List<String> lines, String rawText) {
    for (var i = 0; i < lines.length; i++) {
      final fixed = _fixOcrDigits(lines[i]);
      final looksGrouped = RegExp(r'^\d{4}[\s-]\d{3,6}[\s-]\d{2,6}([\s-]\d{1,6})?$').hasMatch(fixed.trim());
      final digitsOnly = fixed.replaceAll(RegExp(r'\D'), '');
      if (looksGrouped && digitsOnly.length >= 13 && digitsOnly.length <= 19) {
        if (CardUtils.luhnCheck(digitsOnly)) {
          return (_formatCardNumber(digitsOnly), i);
        }
      }
    }

    for (var i = 0; i < lines.length; i++) {
      final fixed = _fixOcrDigits(lines[i]);
      final digitsOnly = fixed.replaceAll(RegExp(r'\D'), '');
      if (digitsOnly.length >= 13 && digitsOnly.length <= 19) {
        if (CardUtils.luhnCheck(digitsOnly)) {
          return (_formatCardNumber(digitsOnly), i);
        }
      }
    }

    final digitGroups = <String>[];
    final digitGroupLineIndex = <int>[];
    for (var i = 0; i < lines.length; i++) {
      final fixed = _fixOcrDigits(lines[i]);
      final groups = RegExp(r'\b\d{3,6}\b').allMatches(fixed).map((m) => m.group(0)!).toList();
      for (final g in groups) {
        digitGroups.add(g);
        digitGroupLineIndex.add(i);
      }
    }
    for (var i = 0; i < digitGroups.length; i++) {
      for (var window = 2; window <= 5; window++) {
        if (i + window <= digitGroups.length) {
          final joined = digitGroups.sublist(i, i + window).join('');
          if (joined.length >= 13 && joined.length <= 19) {
            if (CardUtils.luhnCheck(joined)) {
              return (_formatCardNumber(joined), digitGroupLineIndex[i]);
            }
          }
        }
      }
    }


    final fixedRawText = _fixOcrDigits(rawText);
    final allDigitsOnly = fixedRawText.replaceAll(RegExp(r'\D'), '');
    final candidates = <String>{};
    for (int len = 19; len >= 13; len--) {
      for (int i = 0; i <= allDigitsOnly.length - len; i++) {
        final sub = allDigitsOnly.substring(i, i + len);
        if (CardUtils.luhnCheck(sub)) candidates.add(sub);
      }
      if (candidates.isNotEmpty) break;
    }
    if (candidates.length == 1) {
      return (_formatCardNumber(candidates.first), -1);
    }

    return (null, -1);
  }

  static String _formatCardNumber(String digits) {
    if (digits.length == 15) {
      return '${digits.substring(0, 4)} ${digits.substring(4, 10)} ${digits.substring(10)}';
    }
    final sb = StringBuffer();
    for (int i = 0; i < digits.length; i++) {
      if (i > 0 && i % 4 == 0) sb.write(' ');
      sb.write(digits[i]);
    }
    return sb.toString().trim();
  }

  static String? _extractExpiryDate(List<String> lines, String rawText, String? cardNumberDigits) {
    final cleanText = rawText.replaceAll('\n', ' ');
    for (final line in lines) {
      final lineDigits = line.replaceAll(RegExp(r'\D'), '');
      if (cardNumberDigits != null &&
          lineDigits.isNotEmpty &&
          cardNumberDigits.contains(lineDigits) &&
          lineDigits.length >= 8) {
        continue;
      }
      final res = _parseExpiryFromText(line);
      if (res != null) return res;
    }
    return _parseExpiryFromText(cleanText);
  }

  static String? _parseExpiryFromText(String text) {
    final p1 = RegExp(
      r'(?:VALID|GOOD|THRU|THROUGH|EXPIRES|EXPIRATION|EXP|MONTH/YEAR|UNTIL)?'
      r'\s*[:\-]?\s*\b(0?[1-9]|1[0-2])\s*[\/\.\-\\:\s]\s*([2-4]\d|20[2-4]\d)\b',
      caseSensitive: false,
    );
    for (final m in p1.allMatches(text)) {
      final mStr = m.group(1)!.padLeft(2, '0');
      var yStr = m.group(2)!;
      if (yStr.length == 4) yStr = yStr.substring(2);
      final yNum = int.tryParse(yStr) ?? 0;
      if (yNum >= 24 && yNum <= 45) {
        return '$mStr/$yStr';
      }
    }

    final p2 = RegExp(
      r'(?:VALID|GOOD|THRU|EXPIRES|EXP)\s*[:\-]?\s*\b(0[1-9]|1[0-2])([2-4]\d)\b',
      caseSensitive: false,
    );
    final m2 = p2.firstMatch(text);
    if (m2 != null) {
      return '${m2.group(1)}/${m2.group(2)}';
    }

    return null;
  }

  static String? _extractCvv(List<String> lines, String rawText) {
    final p1 = RegExp(
      r'(?:CVV2?|CVC2?|CID|CSC|SECURITY\s*CODE)\s*[:\-]?\s*(\d{3,4})\b',
      caseSensitive: false,
    );
    final m1 = p1.firstMatch(rawText);
    if (m1 != null) return m1.group(1);

    for (final line in lines) {
      final upper = line.toUpperCase();
      if (upper.contains('CVV') || upper.contains('CVC') || upper.contains('SECURITY')) {
        final m = RegExp(r'\b\d{3,4}\b').firstMatch(line);
        if (m != null) return m.group(0);
      }
    }

    return null;
  }

  static String? _detectBrand(String upper, String? cardNumber) {
    if (upper.contains('AMERICAN EXPRESS') || upper.contains('AMEX')) return 'American Express';
    if (upper.contains('MASTERCARD') || upper.contains('MASTER CARD')) return 'Mastercard';
    if (upper.contains('VISA ELECTRON')) return 'Visa Electron';
    if (upper.contains('VISA')) return 'Visa';
    if (upper.contains('RUPAY')) return 'RuPay';
    if (upper.contains('MAESTRO')) return 'Maestro';
    if (upper.contains('DISCOVER')) return 'Discover';
    if (upper.contains('DINERS')) return 'Diners Club';
    if (upper.contains('JCB')) return 'JCB';
    if (upper.contains('UNIONPAY') || upper.contains('UNION PAY')) return 'UnionPay';

    if (cardNumber != null && cardNumber.isNotEmpty) {
      final d = cardNumber.replaceAll(RegExp(r'\D'), '');
      if (d.startsWith('4')) return 'Visa';
      if (RegExp(r'^(5[1-5]|2[2-7])').hasMatch(d)) return 'Mastercard';
      if (RegExp(r'^(34|37)').hasMatch(d)) return 'American Express';
      if (RegExp(r'^(6011|65|64[4-9])').hasMatch(d)) return 'Discover';
      if (RegExp(r'^(60|65|81|82|508)').hasMatch(d)) return 'RuPay';
      if (RegExp(r'^(30[0-5]|36|38)').hasMatch(d)) return 'Diners Club';
      if (RegExp(r'^(352[8-9]|35[3-8])').hasMatch(d)) return 'JCB';
      if (RegExp(r'^62').hasMatch(d)) return 'UnionPay';
    }
    return null;
  }

  static const Map<String, String> _bankDictionary = {
    'STATE BANK OF INDIA': 'State Bank of India',
    'STATE BANK': 'State Bank of India',
    'SBI': 'State Bank of India',
    'HDFC BANK': 'HDFC Bank',
    'HDFC': 'HDFC Bank',
    'ICICI BANK': 'ICICI Bank',
    'ICICI': 'ICICI Bank',
    'AXIS BANK': 'Axis Bank',
    'AXIS': 'Axis Bank',
    'KOTAK MAHINDRA BANK': 'Kotak Mahindra Bank',
    'KOTAK BANK': 'Kotak Mahindra Bank',
    'KOTAK': 'Kotak Mahindra Bank',
    'CITIBANK': 'Citibank',
    'CITI': 'Citibank',
    'CHASE': 'Chase',
    'CAPITAL ONE': 'Capital One',
    'WELLS FARGO': 'Wells Fargo',
    'BANK OF AMERICA': 'Bank of America',
    'BOFA': 'Bank of America',
    'HSBC': 'HSBC',
    'BARCLAYS': 'Barclays',
    'STANDARD CHARTERED': 'Standard Chartered',
    'PUNJAB NATIONAL BANK': 'Punjab National Bank',
    'PNB': 'Punjab National Bank',
    'CANARA BANK': 'Canara Bank',
    'CANARA': 'Canara Bank',
    'BANK OF BARODA': 'Bank of Baroda',
    'BOB': 'Bank of Baroda',
    'INDIAN BANK': 'Indian Bank',
    'UNION BANK OF INDIA': 'Union Bank of India',
    'UNION BANK': 'Union Bank of India',
    'YES BANK': 'Yes Bank',
    'IDFC FIRST BANK': 'IDFC FIRST Bank',
    'IDFC FIRST': 'IDFC FIRST Bank',
    'IDFC': 'IDFC FIRST Bank',
    'FEDERAL BANK': 'Federal Bank',
    'INDUSIND BANK': 'IndusInd Bank',
    'INDUSIND': 'IndusInd Bank',
    'RBL BANK': 'RBL Bank',
    'RBL': 'RBL Bank',
    'BANDHAN BANK': 'Bandhan Bank',
    'AU SMALL FINANCE BANK': 'AU Small Finance Bank',
    'PAYTM PAYMENTS BANK': 'Paytm Bank',
    'BANK OF INDIA': 'Bank of India',
    'CENTRAL BANK OF INDIA': 'Central Bank of India',
    'UCO BANK': 'UCO Bank',
    'SCOTIABANK': 'Scotiabank',
    'TD BANK': 'TD Bank',
    'REVOLUT': 'Revolut',
    'MONZO': 'Monzo',
    'N26': 'N26',
    'SANTANDER': 'Santander',
    'DBS BANK': 'DBS Bank',
    'DBS': 'DBS Bank',
    'DEUTSCHE BANK': 'Deutsche Bank',
    'ING': 'ING',
  };

  static String? _extractBankName(List<String> lines, String upperText) {
    final sortedKeys = _bankDictionary.keys.toList()..sort((a, b) => b.length.compareTo(a.length));
    for (final key in sortedKeys) {
      final pattern = RegExp(r'(^|[^A-Z])' + RegExp.escape(key) + r'([^A-Z]|$)');
      if (pattern.hasMatch(upperText)) {
        return _bankDictionary[key];
      }
    }

    for (final line in lines) {
      final u = line.toUpperCase().trim();
      if (u.contains('BANK') || u.contains('CREDIT UNION')) {
        var cleaned = line.replaceAll(RegExp(r'(DEBIT|CREDIT|CARD|PLATINUM|GOLD|VISA|MASTERCARD)', caseSensitive: false), '').trim();
        if (cleaned.length >= 4 && cleaned.length <= 40) {
          return cleaned;
        }
      }
    }

    return null;
  }

  static const Set<String> _blacklistWords = {
    'VISA', 'MASTERCARD', 'AMEX', 'AMERICAN', 'EXPRESS', 'DISCOVER', 'RUPAY',
    'MAESTRO', 'DINERS', 'CLUB', 'UNIONPAY', 'JCB', 'ELECTRON',
    'DEBIT', 'CREDIT', 'CARD', 'BANK', 'HDFC', 'SBI', 'ICICI', 'AXIS',
    'KOTAK', 'CITI', 'CITIBANK', 'CHASE', 'HSBC', 'BARCLAYS', 'PNB', 'BOB',
    'VALID', 'THRU', 'THROUGH', 'FROM', 'UNTIL', 'EXPIRES', 'EXPIRY', 'EXP',
    'GOOD', 'MEMBER', 'SINCE', 'CVV', 'CVV2', 'CVC', 'SECURITY', 'CODE',
    'PLATINUM', 'GOLD', 'SIGNATURE', 'CLASSIC', 'WORLD', 'ELITE', 'PREPAID',
    'BUSINESS', 'REWARDS', 'SELECT', 'INTERNATIONAL', 'AUTHORIZED', 'PAY',
    'CASHBACK', 'TITANIUM', 'INFINITE', 'CORPORATE', 'ELECTRONIC', 'USE', 'ONLY',
    'MONTH', 'YEAR', 'PRIORITY', 'PASS', 'FINANCIAL', 'GIFT', 'COUPON',
    'VOUCHER', 'DISCOUNT', 'TICKET', 'BOARDING', 'HOLDER', 'NAME',
    'ACCOUNT', 'NUMBER', 'NO', 'CUSTOMER', 'SERVICE', 'PHONE', 'CALL',
    'NOT', 'TRANSFERABLE', 'WELCOME', 'INDUSIND', 'RBL', 'FEDERAL', 'CANARA',
    'UNION', 'BANDHAN', 'IDFC', 'STANDARD', 'CHARTERED', 'WELLS', 'FARGO', 'CAPITAL',
    'DBS', 'DEUTSCHE', 'SANTANDER', 'REVOLUT', 'MONZO',
  };

  static String? _candidateNameFrom(String line) {
    final trimmed = line.trim();
    if (RegExp(r'\d').hasMatch(trimmed)) return null;

    final cleanLine = trimmed
        .replaceAll(RegExp(r'[\/\.\-\:\,\#]'), ' ')
        .replaceAll(RegExp(r"[^A-Za-z\s]"), ' ')
        .replaceAll(RegExp(r'\s+'), ' ')
        .trim();

    if (cleanLine.length < 3 || cleanLine.length > 36) return null;

    final words = cleanLine.toUpperCase().split(' ').where((w) => w.isNotEmpty).toList();
    final validNameWords = <String>[];
    for (final w in words) {
      if (!_blacklistWords.contains(w) && (w.length >= 2 || w == 'A' || w == 'I')) {
        validNameWords.add(w);
      }
    }

    if (validNameWords.length < 2 || validNameWords.length > 4) return null;
    if (validNameWords.length < words.length - 1) return null;

    return validNameWords.map((w) => w[0] + w.substring(1).toLowerCase()).join(' ');
  }

  static String? _extractHolderName(
      List<String> lines,
      int numberLineIndex,
      String? bankName,
      ) {
    final ordered = <int>[];
    if (numberLineIndex >= 0) {
      for (var offset = 1; offset <= 3; offset++) {
        final below = numberLineIndex + offset;
        if (below < lines.length) ordered.add(below);
      }
      for (var offset = 1; offset <= 2; offset++) {
        final above = numberLineIndex - offset;
        if (above >= 0) ordered.add(above);
      }
    }
    for (var i = 0; i < lines.length; i++) {
      if (!ordered.contains(i)) ordered.add(i);
    }

    for (final idx in ordered) {
      final name = _candidateNameFrom(lines[idx]);
      if (name != null &&
          (bankName == null || !name.toUpperCase().contains(bankName.toUpperCase()))) {
        return name;
      }
    }

    return null;
  }
}