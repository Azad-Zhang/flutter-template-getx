import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template_getx/app/bingdings/initial_binding.dart';
import 'package:flutter_template_getx/app/core/translations/app_translations.dart';
import 'package:flutter_template_getx/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'flavors.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
    );
  }
}
