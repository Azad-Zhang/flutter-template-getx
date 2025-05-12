import 'package:flutter_template_getx/app/core/base/controller/base_controller.dart';
import 'package:get/get.dart';

class TabsController extends BaseController {
  /// 当前选中的底部导航栏索引
  final RxInt currentIndex = 0.obs;
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

  /// 切换底部导航栏
  void switchTab(int index) {
    currentIndex.value = index;
  }
}
