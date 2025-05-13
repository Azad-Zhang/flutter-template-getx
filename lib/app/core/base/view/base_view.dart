/*
 * @Author: 张仕鹏 1120148291@qq.com
 * @Date: 2025-03-13 15:20:06
 * @LastEditors: 张仕鹏 1120148291@qq.com
 * @LastEditTime: 2025-03-13 16:25:55
 * @FilePath: /flutter-template-getx/lib/app/core/base/view/base_view.dart
 * @Description: 基础视图类，提供统一的页面布局和状态管理
 */
import 'package:flutter/material.dart';
import 'package:flutter_template_getx/app/core/base/controller/base_controller.dart';
import 'package:flutter_template_getx/app/core/model/page_background.dart';
import 'package:flutter_template_getx/app/core/model/page_state.dart';
import 'package:flutter_template_getx/app/core/utils/screen_adapter.dart';
import 'package:flutter_template_getx/app/core/values/app_colors.dart';
import 'package:flutter_template_getx/app/core/values/app_values.dart';
import 'package:flutter_template_getx/app/core/widgets/elevated_container.dart';
import 'package:get/get.dart';



/// 基础视图类
/// 提供统一的页面布局和状态管理
/// 包括：加载状态、错误提示、成功提示、默认消息等
abstract class BaseView<Controller extends BaseController>
    extends GetView<Controller> {
  /// 背景颜色
  final Color bgColor;

  /// 页面背景配置
  final PageBackground? bgImage;

  BaseView({
    super.key,
    this.bgColor = Colors.white,
    this.bgImage,
  });

  /// 页面主体内容
  Widget body(BuildContext context);

  /// 页面顶部导航栏
  PreferredSizeWidget? appBar(BuildContext context);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      extendBodyBehindAppBar: true,
      appBar: appBar(context) != null
          ? PreferredSize(
              preferredSize: const Size.fromHeight(kToolbarHeight),
              child: Container(
                color: Colors.transparent,
                child: appBar(context),
              ),
            )
          : null,
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          // 背景图片
          if (bgImage != null)
            Positioned(
                top: bgImage!.top,
                left: bgImage!.left,
                  child: Container(
                    
                    width: bgImage!.width,
                  height: bgImage!.height,
                    decoration: BoxDecoration(
                      // color: Colors.red,
                      image: DecorationImage(
                          image: AssetImage(bgImage!.imagePath),
                          fit: bgImage!.fit),
                    ),
                  
                )),

          // 主体内容
          bgImage != null ? Container(
            margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top + kToolbarHeight) ,
            child: body(context),
          ) : body(context),
          // body(context),

          // 加载状态遮罩
          Obx(() => controller.pageState == PageState.LOADING
              ? shadowBox()
              : Container()),

          // 加载提示
          Obx(() => controller.pageState == PageState.LOADING
              ? _showLoading(controller.loadingMessage)
              : Container()),
        ],
      ),
    );
  }

  /// 显示加载提示
  Widget _showLoading(String message) {
    return Center(
      child: ElevatedContainer(
        padding: EdgeInsets.all(AppValues.margin),
        borderRadius: AppValues.smallRadius,
        bgColor: Colors.white,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircularProgressIndicator(
              color: AppColors.colorPrimary,
            ),
            if (message.isNotEmpty)
              Container(
                margin: EdgeInsets.only(top: AppValues.margin),
                child: Text(
                  message,
                  style: TextStyle(
                    color: AppColors.colorPrimary,
                    fontSize: 14,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  /// 加载遮罩层
  Widget shadowBox() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.black.withAlpha(77),
    );
  }
}
