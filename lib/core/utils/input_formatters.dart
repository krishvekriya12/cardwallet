import 'package:flutter/services.dart';

import 'card_utils.dart';

/// Live-formats a card number field with network-aware spacing as the user
/// types (mirrors the Compose app's DynamicCardNumberVisualTransformation).
class CardNumberInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final digits = newValue.text.replaceAll(RegExp(r'\D'), '');
    final limited = digits.length > 19 ? digits.substring(0, 19) : digits;
    final formatted = CardUtils.formatCardNumber(limited);
    final selectionOffset = _calculateOffset(newValue.text, formatted, newValue.selection.start);
    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: selectionOffset),
    );
  }
}

/// Formats an expiry date field as MM/YY.
class ExpiryDateInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final digits = newValue.text.replaceAll(RegExp(r'\D'), '');
    final limited = digits.length > 4 ? digits.substring(0, 4) : digits;
    final buffer = StringBuffer();
    for (var i = 0; i < limited.length; i++) {
      if (i == 2) buffer.write('/');
      buffer.write(limited[i]);
    }
    final formatted = buffer.toString();
    final selectionOffset = _calculateOffset(newValue.text, formatted, newValue.selection.start);
    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: selectionOffset),
    );
  }
}

int _calculateOffset(String newText, String formattedText, int selectionStart) {
  if (selectionStart <= 0) return 0;
  var digitsBeforeCursor = 0;
  for (var i = 0; i < selectionStart && i < newText.length; i++) {
    if (RegExp(r'\d').hasMatch(newText[i])) {
      digitsBeforeCursor++;
    }
  }

  var digitCount = 0;
  var formattedOffset = 0;
  while (formattedOffset < formattedText.length && digitCount < digitsBeforeCursor) {
    if (RegExp(r'\d').hasMatch(formattedText[formattedOffset])) {
      digitCount++;
    }
    formattedOffset++;
  }
  return formattedOffset;
}
