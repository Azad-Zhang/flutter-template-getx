/*
 * @Author: 张仕鹏 1120148291@qq.com
 * @Date: 2025-02-25 16:17:04
 * @LastEditors: 张仕鹏 1120148291@qq.com
 * @LastEditTime: 2025-03-13 15:18:16
 * @FilePath: /flutter-template-getx/lib/app/modules/home/views/home_view.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import 'package:flutter/material.dart';
import 'package:flutter_template_getx/app/core/base/view/base_view.dart';
import 'package:flutter_template_getx/app/core/values/app_colors.dart';
import 'package:flutter_template_getx/app/core/values/app_values.dart';
import 'package:flutter_template_getx/app/modules/home/controllers/home_controller.dart';
import 'package:get/get.dart';

import '../../../../flavors.dart';
import '../controllers/home_controller.dart';
import '../../../core/translations/translation_keys.dart';
import '../../../core/controllers/language_controller.dart';

class HomeView extends BaseView<HomeController> {
  HomeView({Key? key}) : super(key: key);

  @override
  Widget body(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // 原有信息显示
          Text('${T.currentEnvironment.tr}: ${F.name}'),
          Text('${T.apiAddress.tr}: ${F.apiBaseUrl}'),
          Text('${T.enableLogging.tr}: ${F.enableLogging}'),
          Obx(() => Text("${T.memoryString.tr}${controller.storageString.value}")),
          InkWell(
            onTap: () {
              controller.testStorage();
            },
            child: Container(
              width: 200,
              height: 60,
              color: Colors.red,
              child: Center(
                child: Text(
                  T.setMemoryString.tr,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          
          SizedBox(height: AppValues.margin_40),
          
          // 消息测试按钮
          Text(
            '消息测试',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: AppValues.margin),
          
          // 普通消息按钮
          InkWell(
            onTap: () => controller.showMessage('这是一条普通消息'),
            child: Container(
              padding: EdgeInsets.all(AppValues.margin),
              decoration: BoxDecoration(
                color: Colors.black.withAlpha(230),
                borderRadius: BorderRadius.circular(AppValues.smallRadius),
              ),
              child: Text(
                '显示普通消息',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          SizedBox(height: AppValues.margin),

          // 成功消息按钮
          InkWell(
            onTap: () => controller.showSuccessMessage('操作成功！'),
            child: Container(
              padding: EdgeInsets.all(AppValues.margin),
              decoration: BoxDecoration(
                color: Colors.green.withAlpha(230),
                borderRadius: BorderRadius.circular(AppValues.smallRadius),
              ),
              child: Text(
                '显示成功消息',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          SizedBox(height: AppValues.margin),

          // 错误消息按钮
          InkWell(
            onTap: () => controller.showErrorMessage('操作失败！'),
            child: Container(
              padding: EdgeInsets.all(AppValues.margin),
              decoration: BoxDecoration(
                color: Colors.red.withAlpha(230),
                borderRadius: BorderRadius.circular(AppValues.smallRadius),
              ),
              child: Text(
                '显示错误消息',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          SizedBox(height: AppValues.margin_40),

          // 加载状态测试按钮
          Text(
            '加载状态测试',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: AppValues.margin),
          InkWell(
            onTap: () {
              controller.showLoading("正在加载...");
              Future.delayed(Duration(seconds: 2), () {
                controller.hideLoading();
              });
            },
            child: Container(
              padding: EdgeInsets.all(AppValues.margin),
              decoration: BoxDecoration(
                color: Colors.blue.withAlpha(230),
                borderRadius: BorderRadius.circular(AppValues.smallRadius),
              ),
              child: Text(
                '显示加载状态',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    final languageController = Get.find<LanguageController>();
    
    return AppBar(
      title: Text(T.home.tr),
      centerTitle: true,
      actions: [
        IconButton(
          icon: const Icon(Icons.language),
          onPressed: () => languageController.toggleLanguage(),
        ),
      ],
    );
  }
}
