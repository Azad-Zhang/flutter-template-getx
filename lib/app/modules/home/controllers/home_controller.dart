/*
 * @Author: 张仕鹏 1120148291@qq.com
 * @Date: 2025-02-25 16:17:04
 * @LastEditors: 张仕鹏 1120148291@qq.com
 * @LastEditTime: 2025-02-25 17:03:17
 * @FilePath: /flutter-template-getx/lib/app/modules/home/controllers/home_controller.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import 'package:flutter_template_getx/app/core/base/controller/base_controller.dart';
import 'package:flutter_template_getx/app/core/service/storage_service.dart';
import 'package:flutter_template_getx/app/core/values/app_values.dart';
import 'package:get/get.dart';
import 'package:mmkv/mmkv.dart';
import 'package:flutter_template_getx/app/core/utils/toast_util.dart';
import 'package:flutter_template_getx/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

class HomeController extends BaseController {
  RxString storageString = "".obs;
  
  @override
  void onInit() {
    super.onInit();
    _loadStoredValue();
  }

  void _loadStoredValue() async {
    final result = await storage.getString(AppValues.testValue);
    if (result != null) {
      storageString.value = result;
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void testStorage() async {
     storage.setString(AppValues.testValue, "123");
    final result = await storage.getString(AppValues.testValue);
    if (result != null)
      storageString.value = result;
    else
      logger.d("设置内存字符串出错");
  }

    /// 退出登录
  Future<void> logout() async {
    try {
      // 清空存储
       storage.deleteAll();
      
      // 显示退出成功提示
      ToastUtil.showSuccess(Get.context!, '退出成功');
      
      // 跳转到登录页
      Get.offAllNamed(Routes.AUTH_LOGIN);
    } catch (e) {
      Get.snackbar('错误', '退出失败：$e', backgroundColor: Colors.red);
    }
  }
}
