import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/auth_login_controller.dart';

class AuthLoginView extends GetView<AuthLoginController> {
  const AuthLoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('登录'),
        centerTitle: true,
      ),
      body: _buildContent(),
    );
  }

  Widget _buildContent() {
    return SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 40),
            _buildInputFields(),
            const SizedBox(height: 24),
            _buildActionButtons(),
            const SizedBox(height: 20),
            _buildRegisterButton(),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildInputFields() {
    return Column(
      children: [
        TextField(
          controller: controller.usernameController,
          focusNode: controller.usernameFocus,
          decoration: const InputDecoration(
            labelText: '用户名',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 16),
        TextField(
          controller: controller.passwordController,
          focusNode: controller.passwordFocus,
          obscureText: true,
          decoration: const InputDecoration(
            labelText: '密码',
            border: OutlineInputBorder(),
          ),
        ),
      ],
    );
  }

  Widget _buildActionButtons() {
    return Column(
      children: [
        Obx(() => controller.errorMessage.isNotEmpty
            ? Text(
                controller.errorMessage.value,
                style: const TextStyle(color: Colors.red),
              )
            : const SizedBox.shrink()),
        const SizedBox(height: 16),
        Obx(() => ElevatedButton(
              onPressed: controller.isLoading.value ? null : controller.login,
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
              ),
              child: controller.isLoading.value
                  ? const CircularProgressIndicator()
                  : const Text('登录'),
            )),
      ],
    );
  }

  Widget _buildRegisterButton() {
    return TextButton(
      onPressed: controller.goToRegister,
      child: const Text('没有账号？立即注册'),
    );
  }
}

// 自定义键盘回避组件
class KeyboardAvoidingWrapper extends StatelessWidget {
  final Widget child;

  const KeyboardAvoidingWrapper({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: constraints.maxHeight,
            ),
            child: IntrinsicHeight(
              child: Padding(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                child: child,
              ),
            ),
          ),
        );
      },
    );
  }
}