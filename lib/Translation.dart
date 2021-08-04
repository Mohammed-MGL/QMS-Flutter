import 'package:get/get.dart';

import 'package:qms/components/Lang/en.dart';
import 'dart:ui';

import 'package:qms/components/lang/ar.dart';

//import 'package:qms/components/lang/ar.dart';

class Translation extends Translations {
   // Default locale
  static final locale = Locale('en', 'US');

  // fallbackLocale saves the day when the locale gets in trouble
  static final fallbackLocale = Locale('ar', '');

  // Supported languages
  // Needs to be same order with locales
  static final langs = [
    'English',
    'Arabic',
    
  ];

  // Supported locales
  // Needs to be same order with langs
  static final locales = [
    Locale('en', 'US'),
    Locale('ar', 'SA'),
    
  ];

  // Keys and their translations
  // Translations are separated maps in lang file
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': enUS,
        'ar_SA': ar,
        
      };

  // Gets locale from language, and updates the locale
  void changeLocale(String lang) {
    final locale = _getLocaleFromLanguage(lang);
    Get.updateLocale(locale);
  }

  // Finds language in langs list and returns it as Locale
  Locale _getLocaleFromLanguage(String lang) {
    for (int i = 0; i < langs.length; i++) {
      if (lang == langs[i]) return locales[i];
    }
    return Get.locale;
  }
}