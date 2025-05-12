import 'package:flutter_template_getx/app/modules/home/controllers/home_controller.dart';
import 'package:flutter_template_getx/app/modules/user/controllers/user_controller.dart';
import 'package:get/get.dart';

import '../controllers/tabs_controller.dart';

class TabsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TabsController>(
      () => TabsController(),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<UserController>(
      () => UserController(),
    );
  }
}
