import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// 通用 AppBar 组件
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  /// 标题
  final Widget? title;
  
  /// 是否居中显示标题
  final bool centerTitle;
  
  /// 背景颜色
  final Color? backgroundColor;
  
  /// 阴影高度
  final double elevation;
  
  /// 右侧操作按钮
  final List<Widget>? actions;
  
  /// 左侧按钮
  final Widget? leading;
  
  /// 状态栏颜色
  final Color statusBarColor;
  
  /// 状态栏图标亮度
  final Brightness statusBarIconBrightness;
  
  /// iOS 状态栏亮度
  final Brightness statusBarBrightness;

  const CustomAppBar({
    Key? key,
    this.title,
    this.centerTitle = true,
    this.backgroundColor,
    this.elevation = 0,
    this.actions,
    this.leading,
    this.statusBarColor = Colors.transparent,
    this.statusBarIconBrightness = Brightness.dark,
    this.statusBarBrightness = Brightness.light,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title,
      centerTitle: centerTitle,
      backgroundColor: backgroundColor,
      elevation: elevation,
      actions: actions,
      leading: leading,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: statusBarColor,
        statusBarIconBrightness: statusBarIconBrightness,
        statusBarBrightness: statusBarBrightness,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
} 