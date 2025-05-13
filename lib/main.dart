/*
 * @Author: 张仕鹏 1120148291@qq.com
 * @Date: 2025-03-13 16:21:19
 * @LastEditors: 张仕鹏 1120148291@qq.com
 * @LastEditTime: 2025-03-13 16:22:21
 * @FilePath: /flutter-template-getx/lib/main.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */

/// 导入异步操作支持
import 'dart:async';

/// 导入Flutter核心包
import 'package:flutter/material.dart';

/// 导入应用主入口
import 'package:flutter_template_getx/app.dart';

/// 导入MMKV本地存储
import 'package:mmkv/mmkv.dart';

/// 导入GetX状态管理
import 'package:get/get.dart';

/// 导入屏幕适配工具
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// 导入主题控制器
import 'app/core/theme/theme_controller.dart';

/// 应用入口函数
/// 
/// 负责初始化应用所需的各种配置和服务
/// 包括：
/// 1. Flutter绑定初始化
/// 2. 应用设置初始化
/// 3. 主题控制器初始化
/// 4. 启动应用
FutureOr<void> main() async {
  // 确保Flutter绑定初始化
  WidgetsFlutterBinding.ensureInitialized();
  
  // 初始化应用设置
  await initSetting();
  
  // 初始化主题控制器
  Get.put(ThemeController());
  
  // 启动应用
  runApp(const App());
}

/// 初始化应用设置
/// 
/// 负责初始化应用的基础配置，包括：
/// 1. MMKV本地存储初始化
/// 2. 屏幕适配初始化
Future<void> initSetting() async {
  // 初始化MMKV并获取根目录
  final rootDir = await MMKV.initialize();
  print('MMKV for flutter with rootDir = $rootDir');
  
  // 初始化屏幕适配
  await ScreenUtil.ensureScreenSize();
}



