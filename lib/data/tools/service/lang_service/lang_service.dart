import 'package:delivery_pda/data/storage/app/locals/lang_prefs/language_prefs.dart';
import 'package:delivery_pda/data/storage/app/locals/ru_RU.dart';
import 'package:delivery_pda/data/storage/app/locals/uz_UZ.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';




class LangService extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'ru_RU': ruRU, // lang/ru_ru.dart
    'uz_UZ': uzUZ // lang/uz_uz.dart
  };

  static const fallbackLocale = Locale('uz', 'UZ');

  static final items = [
    'Русский',
    'O\'zbekcha',
  ];

  static final langs = ['ru', 'uz'];

  static final List<Locale> locales = [
    const Locale('ru', 'RU'),
    const Locale('uz', 'UZ')
  ];

  static Locale defaultLanguage() {
    var lan = Get.find<LangPrefs>().lang;
    if (lan == "ru") return defLanguage('ru');
    if (lan == "uz") return defLanguage('uz');
    return defLanguage('uz');
  }

  static Locale defLanguage(String code) {
    var index = langs.indexOf(code);
    return locales[index];
  }

  static void changeLocale(String lang) {
    final locale = _getLocaleFromLanguage(lang);
    if (locale != null) {
      Get.updateLocale(locale);
      Get.find<LangPrefs>().lang = lang;
    }
  }

  static Locale? _getLocaleFromLanguage(String lang) {
    for (int i = 0; i < langs.length; i++) {
      if (lang == langs[i]) return locales[i];
    }
    return Get.deviceLocale;
  }
}
