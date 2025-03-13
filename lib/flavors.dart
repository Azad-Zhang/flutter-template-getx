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

enum Flavor {
  dev,
  prod,
}

class F {
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? '';

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
