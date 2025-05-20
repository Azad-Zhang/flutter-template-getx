import 'package:get/get.dart';

import '../controllers/auth_register_controller.dart';
import 'package:flutter_template_getx/app/network/repositories/account_repository_impl.dart';

class AuthRegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AccountRepositoryImpl>(() => AccountRepositoryImpl());
    Get.lazyPut<AuthRegisterController>(() => AuthRegisterController());
  }
}
