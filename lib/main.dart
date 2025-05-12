import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_template_getx/app.dart';
import 'package:mmkv/mmkv.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'app/core/theme/theme_controller.dart';

FutureOr<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initSetting();
  Get.put(ThemeController());
  runApp(const App());
}

Future<void> initSetting() async {
  final rootDir = await MMKV.initialize();
  print('MMKV for flutter with rootDir = $rootDir');
  
  // 初始化屏幕适配
  await ScreenUtil.ensureScreenSize();
}



