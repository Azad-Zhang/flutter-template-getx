import 'package:flutter/widgets.dart';
import 'package:flutter_template_getx/app/core/base/controller/base_controller.dart';
import 'package:get/get.dart';
import 'package:flutter_template_getx/app/network/repositories/account_repository_impl.dart';

class AuthRegisterController extends BaseController {
  final AccountRepositoryImpl _accountRepository = Get.find<AccountRepositoryImpl>();

  final accountFocus = FocusNode();
  final passwordFocus = FocusNode();
  final confirmPasswordFocus = FocusNode();
  
  final username = ''.obs;
  final password = ''.obs;
  final confirmPassword = ''.obs;
  final isLoading = false.obs;
  final errorMessage = ''.obs;

  void setUsername(String value) => username.value = value;
  void setPassword(String value) => password.value = value;
  void setConfirmPassword(String value) => confirmPassword.value = value;

  Future<void> register() async {
    if (username.value.isEmpty || password.value.isEmpty || confirmPassword.value.isEmpty) {
      errorMessage.value = '所有字段都必须填写';
      return;
    }

    if (password.value != confirmPassword.value) {
      errorMessage.value = '两次输入的密码不一致';
      return;
    }

    try {
      isLoading.value = true;
      errorMessage.value = '';
      
      final userData = {
        'username': username.value,
        'password': password.value,
      };
      
      final response = await _accountRepository.createUser(userData);
      
      if (response.statusCode == 200) {
        // 注册成功，跳转到登录页
        Get.offAllNamed('/auth/login');
      } else {
        errorMessage.value = '注册失败：${response.data['message'] ?? '未知错误'}';
      }
    } catch (e) {
      errorMessage.value = '注册失败：$e';
    } finally {
      isLoading.value = false;
    }
  }

  void goToLogin() {
    Get.back();
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
