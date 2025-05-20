import 'package:get/get.dart';

import '../controllers/auth_login_controller.dart';
import 'package:flutter_template_getx/app/network/repositories/account_repository_impl.dart';

class AuthLoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AccountRepositoryImpl>(() => AccountRepositoryImpl());
    Get.lazyPut<AuthLoginController>(() => AuthLoginController());
  }
}
