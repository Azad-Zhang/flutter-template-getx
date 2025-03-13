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

import '../../../network/exceptions/service_unavailable_exception.dart';
import '../../../network/exceptions/unauthorize_exception.dart';

/**
 * 封装基础控制器
 * 1、日志
 * 2、国际化
 * 3、刷新页面
 * 4、页面状态管理
 * 5、加载提示
 * 6、显示消息框
 */
abstract class BaseController extends GetxController {
  final storage = SecureStorageService.instance;

  // 获取 logger 单例
  final Logger logger = LoggerSingleton.getInstance();

  // AppLocalizations get appLocalization => AppLocalizations.of(Get.context!)!;

  // 页面状态控制
  final Rx<PageState> _pageStateController = PageState.DEFAULT.obs;
  //向外界抛出
  PageState get pageState => _pageStateController.value;

  final Rx<String> _loadingMessage = ''.obs;
  String get loadingMessage => _loadingMessage.value;

  //Reload the page
  final RxBool _refreshController = false.obs;
  refreshPage(bool refresh) => _refreshController(refresh);

  // 重置页面状态
  void resetPageState() => _pageStateController(PageState.DEFAULT);
  //更新页面状态
  void updatePageState(PageState state) => _pageStateController(state);

  // 显示加载状态
  showLoading([String? message]) {
    updatePageState(PageState.LOADING);
    _loadingMessage.value = message ?? '';
  }

  // 隐藏加载状态
  hideLoading() {
    resetPageState();
    _loadingMessage.value = '';
  }

  //显示默认弹窗信息
  final _messageController = ''.obs;
  String get message => _messageController.value;
  showMessage(String msg) {
    updatePageState(PageState.MESSAGE);
    _messageController(msg);
  }

  //显示失败弹窗信息
  final _errorMessageController = ''.obs;
  String get errorMessage => _errorMessageController.value;
  showErrorMessage(String msg) {
    updatePageState(PageState.MESSAGE);
    _errorMessageController("");
    _errorMessageController(msg);
  }

  //显示成功弹窗信息
  final _successMessageController = ''.obs;
  String get successMessage => _successMessageController.value;
  showSuccessMessage(String msg) {
    updatePageState(PageState.MESSAGE);
    _successMessageController(msg);
  }

  // 消息显示完成后重置页面状态
  void resetMessageState() {
    resetPageState();
    _messageController.value = '';
    _errorMessageController.value = '';
    _successMessageController.value = '';
  }

  /**
   * @description: A universal data service calling function callDataService，
   * It accepts an asynchronous operation future，
   * And provides some callback functions to handle success, failure, and completion events。
   * @return dynamic
   */
  dynamic callDataService<T>(
    Future<T> future, {
    Function(Exception exception)? onError,
    Function(T response)? onSuccess,
    Function? onStart,
    Function? onComplete,
  }) async {
    Exception? _exception;

    onStart == null ? showLoading() : onStart();

    try {
      final T response = await future;

      if (onSuccess != null) onSuccess(response);

      onComplete == null ? hideLoading() : onComplete();

      return response;
    } // 按照不同的异常类型进行捕获和处理
    on ServiceUnavailableException catch (exception) {
      _exception = exception;
      showErrorMessage(exception.message);
    } on UnauthorizedException catch (exception) {
      _exception = exception;
      showErrorMessage(exception.message);
    } on TimeoutException catch (exception) {
      _exception = exception;
      showErrorMessage(exception.message ?? 'Timeout exception');
    } on NetworkException catch (exception) {
      _exception = exception;
      showErrorMessage(exception.message);
    } on JsonFormatException catch (exception) {
      _exception = exception;
      showErrorMessage(exception.message);
    } on NotFoundException catch (exception) {
      _exception = exception;
      showErrorMessage(exception.message);
    } on ApiException catch (exception) {
      _exception = exception;
    } on AppException catch (exception) {
      _exception = exception;
      showErrorMessage(exception.message);
    } catch (error) {
      _exception = AppException(message: "$error");
      logger.e("Controller>>>>>> error $error");
    }
    if (onError != null) onError(_exception);
    onComplete == null ? hideLoading() : onComplete();
  }

  @override
  void onClose() {
    _loadingMessage.close();
    _pageStateController.close();
    _messageController.close();
    _errorMessageController.close();
    _successMessageController.close();
    super.onClose();
  }
}