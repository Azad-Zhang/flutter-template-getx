import 'package:get/get.dart';
import 'package:flutter/material.dart' show Locale;

class LanguageController extends GetxController {
  final _currentLocale = const Locale('zh', 'CN').obs;
  Locale get currentLocale => _currentLocale.value;

  void changeLanguage(String languageCode, String countryCode) {
    final locale = Locale(languageCode, countryCode);
    Get.updateLocale(locale);
    _currentLocale.value = locale;
  }

  void toggleLanguage() {
    if (_currentLocale.value.languageCode == 'zh') {
      changeLanguage('en', 'US');
    } else {
      changeLanguage('zh', 'CN');
    }
  }
} 