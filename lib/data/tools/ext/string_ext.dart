extension StringExtensions on String {
  String toTime() {
    List<String> str = split('T');
    if (str.length == 2) {
      return '${str.first} ${str.last}';
    } else {
      return '';
    }
  }

  // 2023-11-29T07:47:36
  String toTime3() {
    List<String> str = split('T');
    if (str.length == 2) {
      str = str.last.split(':');
      return '${str.first}:${str[1]}';
    } else {
      return '';
    }
  }

  String toTime6() {
    List<String> str = split('T');
    if (str.length == 2) {
      return str.first;
    } else {
      return '';
    }
  }

  String toTime4() {
    List<String> str = split('T');
    if (str.length == 2) {
      return str.first.replaceAll('-', '.');
    } else {
      return '';
    }
  }

  String toPhone() {
    if (length == 12) {
      String first = '+';
      first += substring(0,3);
      first += ' (';
      first += substring(3, 5);
      first += ') ';
      first += substring(5, 8);
      first += '-';
      first += substring(8, 10);
      first += '-';
      first += substring(10, 12);
      return first;
    } else {
      return this;
    }
  }

  String toTime5() {
    List<String> str = split(' ');
    if (str.length == 2) {
      var str2 = str.last.split('.');
      return '${str.first}_${str2.first.replaceAll(':', '.')}_';
    } else {
      return '';
    }
  }

  String getSomeWords(int i) {

    if (length >= i) {
      return '${substring(0, i - 1)}...';
    } else {
      return this;
    }
  }

  String toTime2(bool b) {
      List<String> str = split('T');
      List<String> str2 = str.last.split('.');
      List<String> str3 = str2.first.split(':');
      if (str.length == 2) {
        return b ?
        '${str.first} ${str3.first}:${str3[1]}' :
        '${str.first.replaceAll('-', '.')} | ${str3.first}:${str3[1]}';
      } else {
        return '';
      }
  }

  String subStringForDescription() {
    if (length >= 40) {
      return '${substring(0, 35)}...';
    } else {
      return this;
    }
  }

  String removeWhiteSpace() => replaceAll(RegExp(r'\s+\b|\b\s'), '');

  String onlyNumbers() => replaceAll(RegExp(r'[^0-9]'), '');

  bool isAlphabet() => RegExp(r'^[a-zA-Zа-яА-Я]+$').hasMatch(this);

  bool isPhone() => RegExp(r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$').hasMatch(this);

  bool isPassword() => length < 6 || contains("'") || contains('"');

  bool isName() => length < 4 || length > 32;

  bool isNotNul() => isNotEmpty;

  String maxLength() => length > 28 ? substring(0, 28) : this;

  String changeUnitOfMoney() => substring(0, indexOf(' '));

  String datetimeFormatInHistory() => substring(0, indexOf(' '));

  String convertIntToString(int number) {
    return number > 9 ? "$number" : "0$number";
  }

  String? getTimeOneLine() {
    if (int.tryParse(this) == null) return null;
    var date = DateTime.fromMillisecondsSinceEpoch(int.parse(this));
    return '${convertIntToString(date.year)}.${convertIntToString(date.month)}.${convertIntToString(date.day)}';
  }

  String limitedText() => length > 60 ? substring(0, 60) : this;
}
