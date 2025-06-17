/*
 * @Author: 张仕鹏 1120148291@qq.com
 * @Date: 2025-03-13 16:21:19
 * @LastEditors: 张仕鹏 1120148291@qq.com
 * @LastEditTime: 2025-03-13 16:22:21
 * @FilePath: /flutter-template-getx/lib/app.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */

/// 导入Flutter核心包
import 'package:flutter/material.dart';

/// 导入初始绑定配置
import 'package:flutter_template_getx/app/bingdings/initial_binding.dart';

/// 导入应用主题配置
import 'package:flutter_template_getx/app/core/theme/app_theme.dart';

/// 导入应用翻译配置
import 'package:flutter_template_getx/app/core/translations/app_translations.dart';

/// 导入应用路由配置
import 'package:flutter_template_getx/app/routes/app_pages.dart';

/// 导入GetX状态管理
import 'package:get/get.dart';

/// 导入屏幕适配工具
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// 导入应用环境配置
import 'flavors.dart';

/// 导入语言控制器
import 'package:flutter_template_getx/app/core/controllers/language_controller.dart';

/// 应用根组件
/// 
/// 负责配置和初始化应用的核心功能，包括：
/// 1. 屏幕适配配置
/// 2. 路由配置
/// 3. 主题配置
/// 4. 国际化配置
/// 5. 页面转场动画配置
class App extends StatelessWidget {
  final String initialRoute;

  /// 构造函数
    App({Key? key, required this.initialRoute}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final languageController = Get.find<LanguageController>();
    print("initialRoute: $initialRoute");
    
    return ScreenUtilInit(
      // 设计稿尺寸，用于屏幕适配
      designSize: const Size(375, 812),
      // 是否根据宽度/高度中的最小值进行适配
      minTextAdapt: true,
      // 支持分屏尺寸
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          // 应用标题
          title: F.title,
          // 是否显示调试标签
          debugShowCheckedModeBanner: false,
          // 初始路由
          initialRoute: initialRoute,
          // 初始绑定
          initialBinding: InitialBinding(),
          // 默认页面转场动画
          defaultTransition: Transition.rightToLeft,
          // 转场动画时长
          transitionDuration: const Duration(milliseconds: 200),
          // 路由配置
          getPages: AppPages.routes,
          // 国际化配置
          translations: AppTranslations(),
          // 默认语言：系统语言
          locale: languageController.currentLocale,
          // 备用语言：英文
          fallbackLocale: const Locale('en', 'US'),
          // 亮色主题
          theme: AppTheme.lightTheme,
          // 暗色主题
          darkTheme: AppTheme.darkTheme,
          // 主题模式：跟随系统
          themeMode: ThemeMode.system,
        );
      },
    );
  }
}
