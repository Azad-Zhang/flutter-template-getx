import 'package:flutter/cupertino.dart';
import 'package:flutter_template_getx/app/core/service/storage_service.dart';
import 'package:flutter_template_getx/app/core/utils/logger_singleton.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:logger/logger.dart';

/// BaseWidgetMixin 是一个基础组件混入类，为所有StatelessWidget提供通用功能
/// 
/// 该混入类提供了以下功能：
/// 1. 日志记录功能 - 通过Logger实例
/// 2. 安全存储功能 - 通过SecureStorageService实例
/// 3. 标准化的build方法实现
mixin BaseWidgetMixin on StatelessWidget {
  /// 日志记录器实例
  final Logger logger = LoggerSingleton.getInstance();
  
  /// 安全存储服务实例
  final storage = SecureStorageService.instance;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: body(context),
    );
  }

  /// 子类必须实现的body方法，用于构建具体的UI内容
  /// 
  /// [context] 构建上下文
  /// 返回要显示的Widget
  Widget body(BuildContext context);
}
