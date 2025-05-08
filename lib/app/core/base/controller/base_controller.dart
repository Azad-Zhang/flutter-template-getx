import 'package:flutter_template_getx/app/core/model/page_state.dart';
import 'package:flutter_template_getx/app/core/service/storage_service.dart';
import 'package:flutter_template_getx/app/core/utils/logger_singleton.dart';
import 'package:flutter_template_getx/app/network/exceptions/api_exception.dart';
import 'package:flutter_template_getx/app/network/exceptions/app_exception.dart';
import 'package:flutter_template_getx/app/network/exceptions/json_format_exception.dart';
import 'package:flutter_template_getx/app/network/exceptions/network_exception.dart';
import 'package:flutter_template_getx/app/network/exceptions/not_found_exception.dart';
import 'package:flutter_template_getx/app/network/exceptions/timeout_exception.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:logger/logger.dart';
import 'dart:async';
import 'package:cherry_toast/cherry_toast.dart';
import 'package:cherry_toast/resources/arrays.dart';
import 'package:flutter/material.dart';

import '../../../network/exceptions/service_unavailable_exception.dart';
import '../../../network/exceptions/unauthorize_exception.dart';

/**
 * 基础控制器
 * 
 * 功能特性：
 * 1. 日志管理 - 统一的日志记录
 * 2. 国际化支持 - 多语言支持
 * 3. 页面刷新 - 页面数据刷新控制
 * 4. 状态管理 - 页面状态统一管理
 * 5. 加载提示 - 统一的加载状态展示
 * 6. 消息提示 - 统一的提示框管理
 */
abstract class BaseController extends GetxController {
  // =============== 基础服务 ===============
  /// 安全存储服务实例
  final storage = SecureStorageService.instance;

  /// 日志服务实例
  final Logger logger = LoggerSingleton.getInstance();

  // =============== 页面状态管理 ===============
  /// 页面状态控制器
  final Rx<PageState> _pageStateController = PageState.DEFAULT.obs;
  /// 对外暴露的页面状态
  PageState get pageState => _pageStateController.value;

  /// 临时状态控制器
  final Rx<PageState?> _tempStateController = Rx<PageState?>(null);
  /// 对外暴露的临时状态
  PageState? get tempState => _tempStateController.value;

  /// 页面刷新控制器
  final RxBool _refreshController = false.obs;
  /// 触发页面刷新
  refreshPage(bool refresh) => _refreshController(refresh);

  // =============== 加载状态管理 ===============
  /// 加载提示信息控制器
  final Rx<String> _loadingMessage = ''.obs;
  /// 获取当前加载提示信息
  String get loadingMessage => _loadingMessage.value;

  // =============== 消息提示管理 ===============
  /// 显示消息
  void showMessage(String message) {
    _tempStateController.value = PageState.MESSAGE;
    CherryToast.info(
      title: Text(message),
      animationType: AnimationType.fromTop,
      animationDuration: Duration(milliseconds: 300),
      autoDismiss: true,
      enableIconAnimation: true,
    ).show(Get.context!);
    Future.delayed(Duration(milliseconds: 300), () {
      _tempStateController.value = null;
    });
  }

  /// 显示成功消息
  void showSuccessMessage(String message) {
    _tempStateController.value = PageState.MESSAGE;
    CherryToast.success(
      title: Text(message),
      animationType: AnimationType.fromTop,
      animationDuration: Duration(milliseconds: 300),
      autoDismiss: true,
      enableIconAnimation: true,
    ).show(Get.context!);
    Future.delayed(Duration(milliseconds: 300), () {
      _tempStateController.value = null;
    });
  }

  /// 显示错误消息
  void showErrorMessage(String message) {
    _tempStateController.value = PageState.MESSAGE;
    CherryToast.error(
      title: Text(message),
      animationType: AnimationType.fromTop,
      animationDuration: Duration(milliseconds: 300),
      autoDismiss: true,
      enableIconAnimation: true,
    ).show(Get.context!);
    Future.delayed(Duration(milliseconds: 300), () {
      _tempStateController.value = null;
    });
  }

  /// 显示警告消息
  void showWarningMessage(String message) {
    _tempStateController.value = PageState.MESSAGE;
    CherryToast.warning(
      title: Text(message),
      animationType: AnimationType.fromTop,
      animationDuration: Duration(milliseconds: 300),
      autoDismiss: true,
      enableIconAnimation: true,
    ).show(Get.context!);
    Future.delayed(Duration(milliseconds: 300), () {
      _tempStateController.value = null;
    });
  }

  // =============== 页面状态操作方法 ===============
  /// 重置页面状态为默认状态
  void resetPageState() => _pageStateController(PageState.DEFAULT);

  /// 更新页面状态
  void updatePageState(PageState state) => _pageStateController(state);

  // =============== 加载状态操作方法 ===============
  /// 显示加载状态
  /// [message] 可选的加载提示信息
  showLoading([String? message]) {
    _tempStateController.value = PageState.LOADING;
    _loadingMessage.value = message ?? '';
  }

  /// 隐藏加载状态
  hideLoading() {
    _tempStateController.value = null;
    _loadingMessage.value = '';
  }

  // =============== 生命周期方法 ===============
  @override
  void onClose() {
    _loadingMessage.close();
    _pageStateController.close();
    _tempStateController.close();
    super.onClose();
  }
}
