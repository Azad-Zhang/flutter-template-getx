/*
 * @Author: 张仕鹏 1120148291@qq.com
 * @Date: 2025-03-13 16:21:19
 * @LastEditors: 张仕鹏 1120148291@qq.com
 * @LastEditTime: 2025-03-13 16:22:21
 * @FilePath: /flutter-template-getx/lib/app/core/widgets/elevated_container.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import 'package:flutter/material.dart';
import 'package:flutter_template_getx/app/core/values/app_colors.dart';


import '/app/core/values/app_values.dart';

/**
 * 一个带有阴影和圆角的容器
 */
class ElevatedContainer extends StatelessWidget {
  final Widget child;
  final Color bgColor;
  final EdgeInsetsGeometry? padding;
  final double borderRadius;

  const ElevatedContainer({
    Key? key,
    required this.child,
    this.bgColor = AppColors.pageBackground,
    this.padding,
    this.borderRadius = AppValues.smallRadius, required BoxDecoration decoration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          boxShadow: [
            BoxShadow(
              color: AppColors.elevatedContainerColorOpacity,
              spreadRadius: 3,
              blurRadius: 8,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
          color: AppColors.pageBackground),
      child: child,
    );
  }
}
