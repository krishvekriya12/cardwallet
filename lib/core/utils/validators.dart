class Validators {
  Validators._();

  static String? holderName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter cardholder name';
    }
    return null;
  }

  static String? cardNumber(String? value) {
    final digits = value?.replaceAll(RegExp(r'\D'), '') ?? '';
    if (digits.length < 8) {
      return 'Card number must be at least 8 digits';
    }
    return null;
  }
}
