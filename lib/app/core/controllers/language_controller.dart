import 'package:get/get.dart';
import 'package:flutter/material.dart' show Locale;

/// 语言控制器
/// 
/// 负责管理应用程序的语言设置，支持中英文切换
/// 使用 GetX 状态管理，实现响应式的语言切换
class LanguageController extends GetxController {
  /// 当前语言区域设置
  /// 
  /// 使用 Rx 变量实现响应式更新
  /// 默认为中文（简体）
  final _currentLocale = const Locale('zh', 'CN').obs;

  /// 获取当前语言区域设置
  /// 
  /// 返回当前的语言区域对象
  Locale get currentLocale => _currentLocale.value;

  /// 切换应用程序语言
  /// 
  /// [languageCode] 语言代码，如 'zh'、'en'
  /// [countryCode] 国家/地区代码，如 'CN'、'US'
  void changeLanguage(String languageCode, String countryCode) {
    final locale = Locale(languageCode, countryCode);
    Get.updateLocale(locale);
    _currentLocale.value = locale;
  }

  /// 切换中英文
  /// 
  /// 如果当前是中文，则切换到英文
  /// 如果当前是英文，则切换到中文
  void toggleLanguage() {
    if (_currentLocale.value.languageCode == 'zh') {
      changeLanguage('en', 'US');
    } else {
      changeLanguage('zh', 'CN');
    }
  }
} 