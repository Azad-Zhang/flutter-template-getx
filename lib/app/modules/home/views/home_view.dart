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
import 'package:flutter_template_getx/app/core/widgets/custom_appbar.dart';
import 'package:flutter_template_getx/app/core/model/page_background.dart';
import 'package:flutter_template_getx/app/core/utils/screen_adapter.dart';
import 'package:flutter_template_getx/app/core/values/app_values.dart';
import 'package:flutter_template_getx/app/modules/home/controllers/home_controller.dart';
import 'package:get/get.dart';
import 'package:flutter_template_getx/gen/assets.gen.dart';
import 'package:flutter_template_getx/app/core/theme/theme_controller.dart';
import 'package:flutter_template_getx/app/core/utils/permission_util.dart';
import 'package:flutter_template_getx/app/core/utils/toast_util.dart';

import '../../../../flavors.dart';
import '../../../core/translations/translation_keys.dart';

class HomeView extends BaseView<HomeController> {
  HomeView({super.key})
      : super(
          bgColor: Color(0xFFFAFAFA),
          bgImage: PageBackground(
            imagePath: Assets.images.backBlueBlur.path,
            width: ScreenAdapter.width(375), // 宽度375
            height: ScreenAdapter.height(320), // 高度320
            fit: BoxFit.fitHeight, // 填充方式
            left: 0,
            // top: -MediaQuery.of(Get.context!).padding.top,
            top: 0,
          ),
        );

  @override
  Widget? appBar(BuildContext context) {
    // return null;
    return CustomAppBar(
      title: Text(T.home.tr, style: TextStyle(color: Colors.black)),
            centerTitle: true,
            backgroundColor: Colors.transparent,
            actions: [],
    );
  }

  @override
  Widget body(BuildContext context) {
    final themeController = Get.find<ThemeController>();

    return SingleChildScrollView(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 主题切换按钮
            Obx(() => Switch(
                  value: themeController.isDarkMode,
                  onChanged: (value) => themeController.toggleTheme(),
                  activeColor: Colors.blue,
                )),
            Text(
              '切换主题',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: AppValues.margin_40),

            // 显示图片
            Image.asset(
              Assets.images.flower.path,
              width: 200,
              height: 200,
              fit: BoxFit.cover,
            ),
            SizedBox(height: AppValues.margin_40),

            // 原有信息显示
            Text('${T.currentEnvironment.tr}: ${F.name}'),
            Text('${T.apiAddress.tr}: ${F.apiBaseUrl}'),
            Text('${T.enableLogging.tr}: ${F.enableLogging}'),
            Obx(() =>
                Text("${T.memoryString.tr}${controller.storageString.value}")),
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
                Future.delayed(Duration(seconds: 3), () {
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

            SizedBox(height: AppValues.margin_40),

            // 权限测试按钮
            Text(
              '权限测试',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: AppValues.margin),

            // 相机权限按钮
            InkWell(
              onTap: () async {
                await PermissionUtil.requestCamera();
              },
              child: Container(
                padding: EdgeInsets.all(AppValues.margin),
                decoration: BoxDecoration(
                  color: Colors.blue.withAlpha(230),
                  borderRadius: BorderRadius.circular(AppValues.smallRadius),
                ),
                child: Text(
                  '请求相机权限',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            SizedBox(height: AppValues.margin),

            // 相册权限按钮
            InkWell(
              onTap: () async {
                await PermissionUtil.requestPhotos();
              },
              child: Container(
                padding: EdgeInsets.all(AppValues.margin),
                decoration: BoxDecoration(
                  color: Colors.green.withAlpha(230),
                  borderRadius: BorderRadius.circular(AppValues.smallRadius),
                ),
                child: Text(
                  '请求相册权限',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            SizedBox(height: AppValues.margin),

            // 位置权限按钮
            InkWell(
              onTap: () async {
                await PermissionUtil.requestLocation();
              },
              child: Container(
                padding: EdgeInsets.all(AppValues.margin),
                decoration: BoxDecoration(
                  color: Colors.orange.withAlpha(230),
                  borderRadius: BorderRadius.circular(AppValues.smallRadius),
                ),
                child: Text(
                  '请求位置权限',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            SizedBox(height: AppValues.margin_40),

            // 退出登录按钮
            InkWell(
              onTap: () => controller.logout(),
              child: Container(
                padding: EdgeInsets.all(AppValues.margin),
                decoration: BoxDecoration(
                  color: Colors.red.withAlpha(230),
                  borderRadius: BorderRadius.circular(AppValues.smallRadius),
                ),
                child: Text(
                  '退出登录',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            SizedBox(height: AppValues.margin_40),
          ],
        ),
      ),
    );
  
  }
}
