import 'package:flutter/material.dart';
import 'package:flutter_template_getx/app/core/utils/screen_adapter.dart';
import 'package:flutter_template_getx/app/core/values/app_colors.dart';
import 'package:flutter_template_getx/app/core/values/text_styles.dart';
import 'package:flutter_template_getx/app/core/widgets/svg_wrapper.dart';
import 'package:flutter_template_getx/gen/assets.gen.dart';

/// 自定义认证输入框组件
/// 支持普通文本输入和密码输入两种模式
/// 密码模式下支持显示/隐藏切换
class AuthTextField extends StatefulWidget {
  /// 输入框提示文本
  final String hintText;
  /// 左侧图标路径
  final String svgPath;
  /// 图标大小
  final double svgSize;
  /// 文本控制器
  final TextEditingController? controller;
  /// 文本变化回调
  final ValueChanged<String>? onChanged;
  /// 是否隐藏文本（用于非密码框的文本隐藏）
  final bool obscureText;
  /// 键盘类型
  final TextInputType? keyboardType;
  /// 是否为密码输入框
  final bool isPassword;
  /// 密码可见时的图标
  final String? visibleIcon;
  /// 密码不可见时的图标
  final String? invisibleIcon;
  /// 密码遮挡字符间距控制
  final double passwordSpacing;
  /// 光标颜色
  final Color? cursorColor;
  /// 输入框填充色
  final Color? fillColor;
  /// 输入框圆角半径
  final double borderRadius;

  const AuthTextField({
    super.key,
    required this.hintText,
    required this.svgPath,
    this.svgSize = 24,
    this.controller,
    this.onChanged,
    this.obscureText = false,
    this.keyboardType,
    this.isPassword = false,
    this.visibleIcon,
    this.invisibleIcon,
    this.passwordSpacing = -2,
    this.cursorColor,
    this.fillColor,
    this.borderRadius = 100,
  });

  @override
  State<AuthTextField> createState() => _AuthTextFieldState();
}

class _AuthTextFieldState extends State<AuthTextField> {
  /// 密码可见性状态
  late bool _isVisible;
  /// 内部文本控制器
  late TextEditingController _internalController;

  @override
  void initState() {
    super.initState();
    // 非密码框默认可见，密码框默认不可见
    _isVisible = !widget.isPassword;
    // 如果没有提供外部控制器，则创建内部控制器
    _internalController = widget.controller ?? TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    // 判断当前是否处于密码遮挡状态
    final isObscuring = widget.isPassword && !_isVisible;

    return TextField(
      controller: _internalController,
      onChanged: widget.onChanged,
      obscureText: isObscuring,
      keyboardType: widget.keyboardType,
      style: F13H20C333.copyWith(
        // 仅在密码遮挡状态应用字符间距
        letterSpacing: isObscuring ? widget.passwordSpacing : 0,
      ),
      cursorColor: widget.cursorColor ?? AppColors.hintColor,
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: F13H20C333.copyWith(color: AppColors.hintColor, letterSpacing: 0),
        filled: true,
        fillColor: widget.fillColor ?? Colors.white,
        contentPadding: EdgeInsets.symmetric(
          horizontal: ScreenAdapter.width(16),
          vertical: 0,
        ),
        border: _buildBorder(),
        enabledBorder: _buildBorder(),
        focusedBorder: _buildBorder(),
        prefixIcon: _buildPrefixIcon(),
        suffixIcon: widget.isPassword ? _buildPasswordToggle() : null,
        prefixIconConstraints: BoxConstraints(
          minWidth: 0,
          minHeight: ScreenAdapter.height(50),
        ),
        suffixIconConstraints: BoxConstraints(
          minWidth: 0,
          minHeight: ScreenAdapter.height(50),
        ),
      ),
    );
  }

  /// 构建输入框边框样式
  InputBorder _buildBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(widget.borderRadius),
      borderSide: BorderSide.none,
    );
  }

  /// 构建左侧图标
  Widget _buildPrefixIcon() {
    return Padding(
      padding: EdgeInsets.only(
        left: ScreenAdapter.width(16),
        right: ScreenAdapter.width(12),
      ),
      child: SvgWrapper(
        svgPath: widget.svgPath,
        size: widget.svgSize,
        aspectRatio: 1.0,
      ),
    );
  }

  /// 构建密码可见性切换按钮
  Widget _buildPasswordToggle() {
    return GestureDetector(
      onTap: _togglePasswordVisibility,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: ScreenAdapter.width(16)),
        child: SvgWrapper(
          svgPath: _isVisible
              ? (widget.visibleIcon ?? Assets.images.passwordSee)
              : (widget.invisibleIcon ?? Assets.images.passwordNosee),
          size: widget.svgSize,
          aspectRatio: 1.0,
        ),
      ),
    );
  }

  /// 切换密码可见性
  void _togglePasswordVisibility() {
    // 保存当前光标位置
    final currentSelection = _internalController.selection;

    setState(() {
      _isVisible = !_isVisible;
    });

    // 在下一帧恢复光标位置，避免切换时光标跳动
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_internalController.text.isNotEmpty) {
        _internalController.selection = currentSelection;
      }
    });
  }

  @override
  void dispose() {
    // 仅释放内部创建的控制器
    if (widget.controller == null) {
      _internalController.dispose();
    }
    super.dispose();
  }
}
