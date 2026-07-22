// ignore_for_file: avoid_print
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import '../../../core/utils/card_utils.dart';
import '../domain/entities/card_type.dart';

// ─── Result Model ────────────────────────────────────────────────────────────

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

// ─── Parser Engine ───────────────────────────────────────────────────────────

class CardOcrParser {
  CardOcrParser._();

  /// Primary entry point using ML Kit's RecognizedText
  static CardOcrResult parseRecognizedText(
    RecognizedText recognizedText, {
    String? imagePath,
  }) {
    final rawText = recognizedText.text;
    final blocks = recognizedText.blocks;

    // Collect all lines from blocks
    final lines = <String>[];
    for (final b in blocks) {
      for (final l in b.lines) {
        final t = l.text.trim();
        if (t.isNotEmpty) lines.add(t);
      }
    }

    final upperText = rawText.toUpperCase();

    // 1. Detect Card Type
    final detectedType = _classifyCardType(upperText);

    // 2. Extract Card Number
    final number = _extractCardNumber(lines, rawText);

    // 3. Extract Expiry Date
    final expiry = _extractExpiryDate(lines, rawText);

    // 4. Extract CVV
    final cvv = _extractCvv(lines, rawText);

    // 5. Detect Card Brand/Network
    final brand = _detectBrand(upperText, number);

    // 6. Extract Bank Name
    final bankName = _extractBankName(lines, upperText);

    // 7. Extract Cardholder Name
    final holderName = _extractHolderName(lines, rawText, number, expiry, bankName);

    // Calculate confidence score
    double conf = 30.0;
    if (number != null && number.isNotEmpty) conf += 35.0;
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

  /// Fallback plain text parser
  static CardOcrResult parse(String rawText, {String? imagePath}) {
    return parseRecognizedText(
      RecognizedText(text: rawText, blocks: []),
      imagePath: imagePath,
    );
  }

  // ──────────────────────────────────────────────────────────────────────────
  // 1. CARD TYPE CLASSIFIER
  // ──────────────────────────────────────────────────────────────────────────

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

  // ──────────────────────────────────────────────────────────────────────────
  // 2. CARD NUMBER EXTRACTION
  // ──────────────────────────────────────────────────────────────────────────

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

  static String? _extractCardNumber(List<String> lines, String rawText) {
    // Strategy 1: Test full raw text with all non-digits stripped (handles multi-line card numbers)
    final fixedRawText = _fixOcrDigits(rawText);
    final allDigitsOnly = fixedRawText.replaceAll(RegExp(r'\D'), '');

    // Search for 13 to 19 digit windows in allDigitsOnly
    for (int len = 16; len >= 13; len--) {
      for (int i = 0; i <= allDigitsOnly.length - len; i++) {
        final sub = allDigitsOnly.substring(i, i + len);
        if (CardUtils.luhnCheck(sub)) {
          return _formatCardNumber(sub);
        }
      }
    }

    // Strategy 2: Test line by line
    for (final line in lines) {
      final fixed = _fixOcrDigits(line);
      final digitsOnly = fixed.replaceAll(RegExp(r'\D'), '');
      if (digitsOnly.length >= 13 && digitsOnly.length <= 19) {
        if (CardUtils.luhnCheck(digitsOnly)) {
          return _formatCardNumber(digitsOnly);
        }
      }
    }

    // Strategy 3: Group windows across lines
    final digitGroups = <String>[];
    for (final line in lines) {
      final fixed = _fixOcrDigits(line);
      final groups = RegExp(r'\b\d{3,6}\b').allMatches(fixed).map((m) => m.group(0)!).toList();
      digitGroups.addAll(groups);
    }
    for (int i = 0; i < digitGroups.length; i++) {
      for (int window = 2; window <= 5; window++) {
        if (i + window <= digitGroups.length) {
          final joined = digitGroups.sublist(i, i + window).join('');
          if (joined.length >= 13 && joined.length <= 19) {
            if (CardUtils.luhnCheck(joined)) {
              return _formatCardNumber(joined);
            }
          }
        }
      }
    }

    // Strategy 4 (Fallback): Return first 13-19 digit run even if Luhn fails due to bad OCR reflection
    if (allDigitsOnly.length >= 13) {
      final fallbackLen = allDigitsOnly.length >= 16 ? 16 : allDigitsOnly.length.clamp(13, 19);
      return _formatCardNumber(allDigitsOnly.substring(0, fallbackLen));
    }

    return null;
  }

  static String _formatCardNumber(String digits) {
    if (digits.length == 15) {
      // AMEX 4-6-5 format
      return '${digits.substring(0, 4)} ${digits.substring(4, 10)} ${digits.substring(10)}';
    }
    // Standard 4-4-4-4 format
    final sb = StringBuffer();
    for (int i = 0; i < digits.length; i++) {
      if (i > 0 && i % 4 == 0) sb.write(' ');
      sb.write(digits[i]);
    }
    return sb.toString().trim();
  }

  // ──────────────────────────────────────────────────────────────────────────
  // 3. EXPIRY DATE EXTRACTION
  // ──────────────────────────────────────────────────────────────────────────

  static String? _extractExpiryDate(List<String> lines, String rawText) {
    final cleanText = rawText.replaceAll('\n', ' ');
    for (final line in lines) {
      final res = _parseExpiryFromText(line);
      if (res != null) return res;
    }
    return _parseExpiryFromText(cleanText);
  }

  static String? _parseExpiryFromText(String text) {
    // Pattern 1: Standard MM/YY, MM/YYYY, MM-YY, MM.YY, MM\YY with optional labels
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

    // Pattern 2: Compact 4 digits after EXP/THRU label e.g., "EXP 0528" -> "05/28"
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

  // ──────────────────────────────────────────────────────────────────────────
  // 4. CVV EXTRACTION
  // ──────────────────────────────────────────────────────────────────────────

  static String? _extractCvv(List<String> lines, String rawText) {
    final p1 = RegExp(
      r'(?:CVV2?|CVC2?|CID|CSC|SECURITY\s*CODE)\s*[:\-]?\s*(\d{3,4})\b',
      caseSensitive: false,
    );
    final m1 = p1.firstMatch(rawText);
    if (m1 != null) return m1.group(1);

    for (final line in lines) {
      final upper = line.toUpperCase();
      if (upper.contains('CVV') || upper.contains('CVC') || upper.contains('SECURITY') || upper.contains('SIGNATURE')) {
        final m = RegExp(r'\b\d{3,4}\b').firstMatch(line);
        if (m != null) return m.group(0);
      }
    }

    return null;
  }

  // ──────────────────────────────────────────────────────────────────────────
  // 5. BRAND / NETWORK DETECTION
  // ──────────────────────────────────────────────────────────────────────────

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

  // ──────────────────────────────────────────────────────────────────────────
  // 6. BANK NAME EXTRACTION
  // ──────────────────────────────────────────────────────────────────────────

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
  };

  static String? _extractBankName(List<String> lines, String upperText) {
    final sortedKeys = _bankDictionary.keys.toList()..sort((a, b) => b.length.compareTo(a.length));
    for (final key in sortedKeys) {
      if (upperText.contains(key)) {
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

  // ──────────────────────────────────────────────────────────────────────────
  // 7. CARDHOLDER NAME EXTRACTION
  // ──────────────────────────────────────────────────────────────────────────

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
  };

  static String? _extractHolderName(
    List<String> lines,
    String rawText,
    String? cardNumber,
    String? expiry,
    String? bankName,
  ) {
    for (final line in lines) {
      final trimmed = line.trim();
      // Remove digits and symbols (like dates 05/21, account numbers, etc) so person name remains
      final lineNoDigits = trimmed.replaceAll(RegExp(r'[\d\/\.\-\:\,\#]'), ' ');
      final cleanLine = lineNoDigits.replaceAll(RegExp(r"[^A-Za-z\s]"), ' ').replaceAll(RegExp(r'\s+'), ' ').trim();

      if (cleanLine.length < 3 || cleanLine.length > 36) continue;

      final words = cleanLine.toUpperCase().split(' ').where((w) => w.isNotEmpty).toList();

      // Filter out blacklisted keywords
      final validNameWords = <String>[];
      for (final w in words) {
        if (!_blacklistWords.contains(w) && (w.length >= 2 || w == 'A' || w == 'I')) {
          validNameWords.add(w);
        }
      }

      // Cardholder name must have 2 to 4 valid name words
      if (validNameWords.length >= 2 && validNameWords.length <= 4) {
        final formattedName = validNameWords.map((w) => w[0] + w.substring(1).toLowerCase()).join(' ');
        return formattedName;
      }
    }

    return null;
  }
}
