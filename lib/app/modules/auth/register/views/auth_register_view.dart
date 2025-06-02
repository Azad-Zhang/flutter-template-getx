import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_template_getx/app/core/base/view/base_view.dart';
import 'package:flutter_template_getx/app/core/utils/screen_adapter.dart';

import 'package:get/get.dart';

import '../controllers/auth_register_controller.dart';

class AuthRegisterView extends BaseView<AuthRegisterController> {
  AuthRegisterView({super.key});

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return AppBar(
      title: const Text('注册'),
      centerTitle: true,
    );
  }

  @override
  bool get resizeToAvoidBottomInset => true;

  @override
  Widget body(BuildContext context) {
    return _AnimatedRegisterContent(controller: controller);
  }
}

class _AnimatedRegisterContent extends StatefulWidget {
  final AuthRegisterController controller;

  const _AnimatedRegisterContent({
    required this.controller,
  });

  @override
  State<_AnimatedRegisterContent> createState() => _AnimatedRegisterContentState();
}

class _AnimatedRegisterContentState extends State<_AnimatedRegisterContent> with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;
    final isKeyboardVisible = bottomInset > 0;

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: ScreenAdapter.width(16),
          vertical: ScreenAdapter.height(24),
        ),
        child: AnimatedBuilder(
          animation: _animationController,
          builder: (context, child) {
            return AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeOutCubic,
              constraints: BoxConstraints(
                maxWidth: ScreenAdapter.width(400),
                minHeight: MediaQuery.of(context).size.height - 
                  MediaQuery.of(context).padding.top - 
                  MediaQuery.of(context).padding.bottom - 
                  kToolbarHeight - 
                  (isKeyboardVisible ? bottomInset : 0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    controller: widget.controller.usernameController,
                    focusNode: widget.controller.usernameFocus,
                    textInputAction: TextInputAction.next,
                    onSubmitted: (_) {
                      FocusScope.of(context).requestFocus(widget.controller.passwordFocus);
                    },
                    decoration: const InputDecoration(
                      labelText: '用户名',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: widget.controller.passwordController,
                    focusNode: widget.controller.passwordFocus,
                    textInputAction: TextInputAction.next,
                    onSubmitted: (_) {
                      FocusScope.of(context).requestFocus(widget.controller.confirmPasswordFocus);
                    },
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: '密码',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: widget.controller.confirmPasswordController,
                    focusNode: widget.controller.confirmPasswordFocus,
                    textInputAction: TextInputAction.done,
                    onSubmitted: (_) {
                      if (!widget.controller.isLoading.value) {
                        widget.controller.register();
                      }
                    },
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: '确认密码',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Obx(() => widget.controller.errorMessage.isNotEmpty
                      ? Text(
                          widget.controller.errorMessage.value,
                          style: const TextStyle(color: Colors.red),
                        )
                      : const SizedBox()),
                  const SizedBox(height: 16),
                  Obx(() => ElevatedButton(
                        onPressed:
                            widget.controller.isLoading.value ? null : widget.controller.register,
                        child: widget.controller.isLoading.value
                            ? const CircularProgressIndicator()
                            : const Text('注册'),
                      )),
                  const SizedBox(height: 16),
                  TextButton(
                    onPressed: widget.controller.goToLogin,
                    child: const Text('已有账号？返回登录'),
                  ),
                  if (isKeyboardVisible) SizedBox(height: bottomInset),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
