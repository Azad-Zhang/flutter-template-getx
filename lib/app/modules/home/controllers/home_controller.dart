/*
 * @Author: 张仕鹏 1120148291@qq.com
 * @Date: 2025-02-25 16:17:04
 * @LastEditors: 张仕鹏 1120148291@qq.com
 * @LastEditTime: 2025-02-25 17:03:17
 * @FilePath: /flutter-template-getx/lib/app/modules/home/controllers/home_controller.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import 'package:get/get.dart';
import 'package:mmkv/mmkv.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  final count = 0.obs;
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

  void increment() => count.value++;

}
