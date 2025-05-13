/*
 * @Author: 张仕鹏 1120148291@qq.com
 * @Date: 2025-02-25 16:17:04
 * @LastEditors: 张仕鹏 1120148291@qq.com
 * @LastEditTime: 2025-03-13 15:38:27
 * @FilePath: /flutter-template-getx/lib/flavors.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import 'package:flutter_template_getx/app/core/values/app_values.dart';
import 'package:logger/web.dart';

/// 应用环境枚举
/// 
/// 用于区分不同的应用环境：
/// - dev: 开发环境
/// - prod: 生产环境
enum Flavor {
  /// 开发环境
  dev,
  /// 生产环境
  prod,
}

/// 应用环境配置类
/// 
/// 用于管理不同环境下的应用配置，包括：
/// - 应用名称
/// - API基础URL
/// - 日志开关
/// - 其他环境相关配置
class F {
  /// 当前应用环境
  static Flavor? appFlavor;

  /// 获取当前环境名称
  /// 
  /// 返回当前环境的名称字符串，如果未设置则返回空字符串
  static String get name => appFlavor?.name ?? '';

  /// 获取应用标题
  /// 
  /// 根据当前环境返回对应的应用标题：
  /// - 开发环境：'模板Dev'
  /// - 生产环境：'模板Prod'
  /// - 默认：'title'
  static String get title {
    switch (appFlavor) {
      case Flavor.dev:
        return '模板Dev';
      case Flavor.prod:
        return '模板Prod';
      default:
        return 'title';
    }
  }

  /// 获取API基础URL
  /// 
  /// 根据当前环境返回对应的API基础地址：
  /// - 开发环境：'https://dev.api.com'
  /// - 生产环境：'https://prod.api.com'
  /// - 默认：空字符串
  static String get apiBaseUrl {
    switch (appFlavor) {
      case Flavor.dev:
        return 'https://dev.api.com'; // 开发环境的 API 地址
      case Flavor.prod:
        return 'https://prod.api.com'; // 生产环境的 API 地址
      default:
        return '';
    }
  }

  /// 获取日志开关状态
  /// 
  /// 根据当前环境返回是否启用日志：
  /// - 开发环境：true（启用日志）
  /// - 生产环境：false（禁用日志）
  /// - 默认：false
  static bool get enableLogging {
    switch (appFlavor) {
      case Flavor.dev:
        return true; // 开发环境开启日志
      case Flavor.prod:
        return false; // 生产环境关闭日志
      default:
        return false;
    }
  }
}
