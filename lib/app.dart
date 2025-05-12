import 'package:flutter/material.dart';
import 'package:flutter_template_getx/app/bingdings/initial_binding.dart';
import 'package:flutter_template_getx/app/core/theme/app_theme.dart';
import 'package:flutter_template_getx/app/core/translations/app_translations.dart';
import 'package:flutter_template_getx/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'flavors.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812), // 设计稿尺寸
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          title: F.title,
          debugShowCheckedModeBanner: false,
          initialRoute: AppPages.INITIAL,
          initialBinding: InitialBinding(),
          defaultTransition: Transition.rightToLeft,
          transitionDuration: const Duration(milliseconds: 200),
          getPages: AppPages.routes,
          translations: AppTranslations(),
          locale: const Locale('zh', 'CN'), // 默认语言
          fallbackLocale: const Locale('en', 'US'), // 备用语言
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: ThemeMode.system,
        );
      },
    );
  }
}
