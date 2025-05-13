import 'package:flutter/material.dart';

/// 应用主题配置类
/// 
/// 定义了应用的亮色和暗色主题
/// 包含全局的颜色、文字、组件样式等配置
class AppTheme {
  /// 亮色主题配置
  /// 
  /// 定义了应用在亮色模式下的主题样式，包括：
  /// - 整体亮度为亮色
  /// - 主色调为蓝色
  /// - 背景色为白色
  /// - 导航栏样式（白色背景、无阴影、黑色图标和文字）
  /// - 文本样式（黑色文字）
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.white,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.black),
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    textTheme: TextTheme(
      bodyLarge: TextStyle(color: Colors.black),
      bodyMedium: TextStyle(color: Colors.black),
    ),
  );

  /// 暗色主题配置
  /// 
  /// 定义了应用在暗色模式下的主题样式，包括：
  /// - 整体亮度为暗色
  /// - 主色调为蓝色
  /// - 背景色为深灰色
  /// - 导航栏样式（深灰色背景、无阴影、白色图标和文字）
  /// - 文本样式（白色文字）
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.grey[900],
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.grey[900],
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.white),
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    textTheme: TextTheme(
      bodyLarge: TextStyle(color: Colors.white),
      bodyMedium: TextStyle(color: Colors.white),
    ),
  );
} 