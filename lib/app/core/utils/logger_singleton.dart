/*
 * @Author: 张仕鹏 1120148291@qq.com
 * @Date: 2025-03-13 15:35:12
 * @LastEditors: 张仕鹏 1120148291@qq.com
 * @LastEditTime: 2025-03-13 15:45:45
 * @FilePath: /flutter-template-getx/lib/app/core/utils/logger_singleton.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import 'package:flutter_template_getx/app/core/values/app_values.dart';
import 'package:flutter_template_getx/flavors.dart';
import 'package:logger/logger.dart';


class LoggerSingleton {
  // 静态私有实例
  static Logger? _instance;

  // 私有构造函数
  LoggerSingleton._();

  // 静态公共访问方法
  static Logger getInstance() {
    if (_instance == null) {
      Level logLevel;
      switch (F.appFlavor) {
        case Flavor.dev:
          logLevel = Level.debug;
          break;
        case Flavor.prod:
          logLevel = Level.warning;
          break;
        default:
          logLevel = Level.debug;
      }
      _instance = Logger(
        level: logLevel,
        printer: PrettyPrinter(
          methodCount: AppValues.loggerMethodCount,
          // number of method calls to be displayed
          errorMethodCount: AppValues.loggerErrorMethodCount,
          // number of method calls if stacktrace is provided
          lineLength: AppValues.loggerLineLength,
          // width of the output
          colors: true,
          // Colorful log messages
          printEmojis: true,
          // Print an emoji for each log message
          printTime: false // Should each log print contain a timestamp
          ),
      );
    }
    return _instance!;
  }
}