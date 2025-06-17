import 'package:flutter/material.dart';
import 'package:flutter_template_getx/app/modules/user/models/user_info.dart';
import 'package:flutter_template_getx/app/network/exceptions/business_exception.dart';
import 'package:flutter_template_getx/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:flutter_template_getx/app/core/base/controller/base_controller.dart';
import 'package:flutter_template_getx/app/network/repositories/account_repository_impl.dart';

class AuthRegisterController extends BaseController {
  final AccountRepositoryImpl _accountRepository =
      Get.find<AccountRepositoryImpl>();

  final ScrollController scrollController = ScrollController();

  // 添加输入框控制器
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // 添加焦点节点
  final FocusNode usernameFocus = FocusNode();
  final FocusNode passwordFocus = FocusNode();

  /// 是否记住密码
  RxBool rememberPassword = false.obs;

  /// 是否同意协议
  RxBool agreement = false.obs;

  Future<void> register() async {
    if (usernameController.text.isEmpty || passwordController.text.isEmpty) {
      logger.d("用户名和密码不能为空");
      return;
    }

    try {
      //1.注册用户
       await _accountRepository.createUser( password: passwordController.text, email: usernameController.text);
      //2.注册成功后，登录
      bool loginResponse = await _accountRepository.login(username: usernameController.text, password: passwordController.text);
      //登录成功后，获取当前用户信息
      UserInfo userInfo = await _accountRepository.getUserInfo();
      if(loginResponse){
        storage.saveUserInfo(userInfo);
        Get.offAllNamed(Routes.TABS);
      }
    } on BusinessException catch (e) {
      showErrorMessage(e.message);
    }
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
    // 清理控制器和焦点节点
    usernameController.dispose();
    passwordController.dispose();
    usernameFocus.dispose();
    passwordFocus.dispose();
    super.onClose();
  }
}
