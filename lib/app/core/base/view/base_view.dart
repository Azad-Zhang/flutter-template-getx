/*
 * @Author: 张仕鹏 1120148291@qq.com
 * @Date: 2025-03-13 15:20:06
 * @LastEditors: 张仕鹏 1120148291@qq.com
 * @LastEditTime: 2025-03-13 16:25:55
 * @FilePath: /flutter-template-getx/lib/app/core/base/view/base_view.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template_getx/app/core/base/controller/base_controller.dart';
import 'package:flutter_template_getx/app/core/model/page_state.dart';
import 'package:flutter_template_getx/app/core/values/app_colors.dart';
import 'package:flutter_template_getx/app/core/values/app_values.dart';
import 'package:flutter_template_getx/app/core/widgets/elevated_container.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

abstract class BaseView<Controller extends BaseController>
    extends GetView<Controller> {
  final Color bgColor;

  BaseView({
    super.key,
    required this.bgColor,
  });

  Widget body(BuildContext context);

  PreferredSizeWidget? appBar(BuildContext context);

    @override
  Widget build(BuildContext context) {
    // return GestureDetector(
    // behavior: HitTestBehavior.translucent,
    // child:
    return Stack(
      clipBehavior: Clip.none,
      children: [
        // annotatedRegion(context),
        // pageScaffold(context),
        Obx(() => controller.pageState == PageState.LOADING
            ? shadowBox()
            : Container()),
        Obx(() => controller.pageState == PageState.LOADING
            ? _showLoading(controller.loadingMessage)
            : Container()),

        // Obx(() => controller.errorMessage.isNotEmpty
        //     ? showErrorSnackBar(controller.errorMessage)
        //     : Container()),
        // 其他组件
        // if (banner != null) banner!, // 检查 banner 是否为 null，然后添加到 children 列表中
      ],
    );
    // )
  }


  Widget _showLoading(String value) {
    return Center(
      child: ElevatedContainer(
          padding: EdgeInsets.all(AppValues.margin),
          decoration: BoxDecoration(),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircularProgressIndicator(
                color: AppColors.colorPrimary,
              ),
              Container(
                // margin: EdgeInsets.only(top: ScreenAdapter.height(8)),
                child: Text(
                // myText,
                "nihao1",
                // style: normalF16H22C666,
              ),
              )
            ],
          )),
    );
  }

  Widget shadowBox() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.black.withOpacity(0.3), // 半透明的阴影色
    );
  }
}
