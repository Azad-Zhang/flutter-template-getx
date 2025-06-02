import 'package:flutter/widgets.dart';
import 'package:flutter_template_getx/app/core/base/controller/base_controller.dart';
import 'package:get/get.dart';
import 'package:flutter_template_getx/app/network/repositories/account_repository_impl.dart';
import 'package:flutter/services.dart';

class AuthRegisterController extends BaseController {
  final AccountRepositoryImpl _accountRepository = Get.find<AccountRepositoryImpl>();

  // 输入控制器
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  // 焦点节点
  final usernameFocus = FocusNode();
  final passwordFocus = FocusNode();
  final confirmPasswordFocus = FocusNode();
  
  final username = ''.obs;
  final password = ''.obs;
  final confirmPassword = ''.obs;
  final isLoading = false.obs;
  final errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    // 设置键盘场景标记
    SystemChannels.textInput.invokeMethod('TextInput.setCurrentIsKeyboardScene', true);
    
    // 监听输入变化
    usernameController.addListener(() {
      username.value = usernameController.text;
    });
    passwordController.addListener(() {
      password.value = passwordController.text;
    });
    confirmPasswordController.addListener(() {
      confirmPassword.value = confirmPasswordController.text;
    });

    // 监听焦点变化
    usernameFocus.addListener(_handleUsernameFocusChange);
    passwordFocus.addListener(_handlePasswordFocusChange);
    confirmPasswordFocus.addListener(_handleConfirmPasswordFocusChange);
  }

  void _handleUsernameFocusChange() {
    if (usernameFocus.hasFocus) {
      Future.delayed(const Duration(milliseconds: 100), () {
        if (usernameFocus.hasFocus) {
          SystemChannels.textInput.invokeMethod('TextInput.show');
        }
      });
    }
  }

  void _handlePasswordFocusChange() {
    if (passwordFocus.hasFocus) {
      Future.delayed(const Duration(milliseconds: 100), () {
        if (passwordFocus.hasFocus) {
          SystemChannels.textInput.invokeMethod('TextInput.show');
        }
      });
    }
  }

  void _handleConfirmPasswordFocusChange() {
    if (confirmPasswordFocus.hasFocus) {
      Future.delayed(const Duration(milliseconds: 100), () {
        if (confirmPasswordFocus.hasFocus) {
          SystemChannels.textInput.invokeMethod('TextInput.show');
        }
      });
    }
  }

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
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    // 清理控制器
    usernameController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    
    // 清理焦点节点
    usernameFocus.removeListener(_handleUsernameFocusChange);
    passwordFocus.removeListener(_handlePasswordFocusChange);
    confirmPasswordFocus.removeListener(_handleConfirmPasswordFocusChange);
    
    usernameFocus.dispose();
    passwordFocus.dispose();
    confirmPasswordFocus.dispose();
    
    // 重置键盘场景标记
    SystemChannels.textInput.invokeMethod('TextInput.setCurrentIsKeyboardScene', false);
    
    super.onClose();
  }
}
