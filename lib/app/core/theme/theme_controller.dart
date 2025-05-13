import 'package:get/get.dart';
import 'package:flutter/material.dart';

/// 主题控制器
/// 
/// 负责管理应用程序的主题切换
/// 使用 GetX 状态管理，实现响应式的主题切换
/// 支持亮色和暗色主题的动态切换
class ThemeController extends GetxController {
  /// 当前是否为暗色模式
  /// 
  /// 使用 Rx 变量实现响应式更新
  /// 默认为 false，表示使用亮色主题
  final _isDarkMode = false.obs;
  
  /// 获取当前主题模式
  /// 
  /// 返回 true 表示暗色模式，false 表示亮色模式
  bool get isDarkMode => _isDarkMode.value;
  
  /// 切换主题模式
  /// 
  /// 在亮色和暗色主题之间切换
  /// 自动更新 GetX 的主题模式
  void toggleTheme() {
    _isDarkMode.value = !_isDarkMode.value;
    Get.changeThemeMode(_isDarkMode.value ? ThemeMode.dark : ThemeMode.light);
  }
  
  /// 设置主题模式
  /// 
  /// [isDark] 是否使用暗色主题
  /// true 表示使用暗色主题，false 表示使用亮色主题
  void setTheme(bool isDark) {
    _isDarkMode.value = isDark;
    Get.changeThemeMode(isDark ? ThemeMode.dark : ThemeMode.light);
  }
}