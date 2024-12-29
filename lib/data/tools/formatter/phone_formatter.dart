
import 'package:flutter/services.dart';

class PhoneFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    final digitOnly = newValue.text.replaceAll(RegExp(r'[^\d]+'), '');
    final initialSpecialSymbolCount = newValue.selection.textBefore(newValue.text).replaceAll(RegExp(r'[\d]+'), '').length;
    final cursorPosition = newValue.selection.start - initialSpecialSymbolCount;
    var finalCursorPosition = cursorPosition;
    final digitOnlyChars = digitOnly.split('');

    var newString = <String>[];
    for (int i = 0; i < digitOnlyChars.length; i++) {
      if (newString.isEmpty && i == 0) {
        newString.add('+${digitOnlyChars[i]}');
        if (i <= cursorPosition) finalCursorPosition += 1;
      } else if (i == 3) {
        newString.add(' (${digitOnlyChars[i]}');
        if (i <= cursorPosition) finalCursorPosition += 2;
      } else if (i == 5) {
        newString.add(') ${digitOnlyChars[i]}');
        if (i <= cursorPosition) finalCursorPosition += 2;
      } else if (i == 8 || i == 10) {
        newString.add(' ${digitOnlyChars[i]}');
        if (i <= cursorPosition) finalCursorPosition += 1;
      } else {
        newString.add(digitOnlyChars[i]);
      }

      if (i > 11) {
        newString.removeLast();
        finalCursorPosition -= 1;
      }
    }

    final resultString = newString.join('');

    return TextEditingValue(
      text: resultString,
      selection: TextSelection.collapsed(offset: finalCursorPosition),
    );
  }
}

class PhoneFormatterShort extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    final digitOnly = newValue.text.replaceAll(RegExp(r'[^\d]+'), '');
    final initialSpecialSymbolCount = newValue.selection.textBefore(newValue.text).replaceAll(RegExp(r'[\d]+'), '').length;
    final cursorPosition = newValue.selection.start - initialSpecialSymbolCount;
    var finalCursorPosition = cursorPosition;
    final digitOnlyChars = digitOnly.split('');

    final newString = <String>[];
    for (var i = 0; i < digitOnlyChars.length; i++) {
      if (i == 0) {
        newString.add(' (${digitOnlyChars[i]}');
        if (i <= cursorPosition) finalCursorPosition += 2;
      } else if (i == 2) {
        newString.add(') ${digitOnlyChars[i]}');
        if (i <= cursorPosition) finalCursorPosition += 2;
      } else if (i == 5) {
        newString.add(' ${digitOnlyChars[i]}');
        if (i <= cursorPosition) finalCursorPosition += 1;
      }else if (i == 7) {
        newString.add(' ${digitOnlyChars[i]}');
        if (i <= cursorPosition) finalCursorPosition += 1;
      }
      else {
        newString.add(digitOnlyChars[i]);
      }

      if (i > 8) {
        newString.removeLast();
        finalCursorPosition -= 1;
      }
    }

    final resultString = newString.join('');

    return TextEditingValue(
      text: resultString,
      selection: TextSelection.collapsed(offset: finalCursorPosition),
    );
  }
}