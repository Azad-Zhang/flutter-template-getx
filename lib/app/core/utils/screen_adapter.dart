/*
 * @Author: 张仕鹏 1120148291@qq.com
 * @Date: 2025-03-13 16:31:05
 * @LastEditors: 张仕鹏 1120148291@qq.com
 * @LastEditTime: 2025-03-13 16:31:12
 * @FilePath: /flutter-template-getx/lib/app/core/utils/screen_adapter.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// 屏幕适配工具类
/// 
/// 基于 flutter_screenutil 实现的屏幕适配工具
/// 提供统一的屏幕尺寸、字体大小等适配方法
/// 支持不同屏幕尺寸的自适应布局
class ScreenAdapter {
  /// 宽度适配
  /// 
  /// [v] 设计稿上的宽度值
  /// 返回适配后的宽度值
  static width(num v) {
    return v.w;
  }

  /// 高度适配
  /// 
  /// [v] 设计稿上的高度值
  /// 返回适配后的高度值
  static height(num v) {
    return v.h;
  }

  /// 字体大小适配
  /// 
  /// [v] 设计稿上的字体大小
  /// 返回适配后的字体大小
  static fontSize(double v) {
    return v.sp;
  }

  /// 获取屏幕宽度
  /// 
  /// [v] 比例值（0-1之间）
  /// 返回屏幕宽度的对应比例值
  static getScreenWidth(num v) {
    // return ScreenUtil().screenWidth;
    return 1.sw;
  }

  /// 获取屏幕高度
  /// 
  /// [v] 比例值（0-1之间）
  /// 返回屏幕高度的对应比例值
  static getScreenHeight(num v) {
    // return ScreenUtil().screenHeight;
    return 1.sh;
  }

  /// 获取状态栏高度
  /// 
  /// 返回当前设备状态栏的高度
  /// 用于适配不同设备的状态栏
  static getStatusBarHeight() {
    return ScreenUtil().statusBarHeight;
  }
}