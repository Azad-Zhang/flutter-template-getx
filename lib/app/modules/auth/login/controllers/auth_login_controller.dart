import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_template_getx/app/network/repositories/account_repository_impl.dart';

class AuthLoginController extends GetxController {
  final AccountRepositoryImpl _accountRepository = Get.find<AccountRepositoryImpl>();

  final ScrollController scrollController = ScrollController();
  
  final username = ''.obs;
  final password = ''.obs;
  final isLoading = false.obs;
  final errorMessage = ''.obs;

  // 添加输入框控制器
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  
  // 添加焦点节点
  final FocusNode usernameFocus = FocusNode();
  final FocusNode passwordFocus = FocusNode();

  void setUsername(String value) => username.value = value;
  void setPassword(String value) => password.value = value;

  Future<void> login() async {
    if (username.value.isEmpty || password.value.isEmpty) {
      errorMessage.value = '用户名和密码不能为空';
      return;
    }

    try {
      isLoading.value = true;
      errorMessage.value = '';
      
      final response = await _accountRepository.login(username.value, password.value);
      
      if (response.statusCode == 200) {
        // 登录成功，跳转到首页
        Get.offAllNamed('/tabs');
      } else {
        errorMessage.value = '登录失败：${response.data['message'] ?? '未知错误'}';
      }
    } catch (e) {
      errorMessage.value = '登录失败：$e';
    } finally {
      isLoading.value = false;
    }
  }

  void goToRegister() {
    Get.toNamed('/auth/register');
  }

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    // 监听输入变化
    usernameController.addListener(() {
      username.value = usernameController.text;
    });
    passwordController.addListener(() {
      password.value = passwordController.text;
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    // 清理控制器和焦点节点
    usernameController.dispose();
    passwordController.dispose();
    usernameFocus.dispose();
    passwordFocus.dispose();
    super.onClose();
  }

  void increment() => count.value++;
}
