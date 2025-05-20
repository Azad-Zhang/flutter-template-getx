import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_template_getx/app/core/base/view/base_view.dart';
import 'package:flutter_template_getx/app/core/utils/screen_adapter.dart';

import 'package:get/get.dart';

import '../controllers/auth_register_controller.dart';

class AuthRegisterView extends BaseView<AuthRegisterController> {

  AuthRegisterView({super.key}) : super(
    // padding: EdgeInsets.symmetric(
    //   vertical: ScreenAdapter.height(16), 
    //   horizontal: ScreenAdapter.width(16)
    // )
  );

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return AppBar(
      title: const Text('注册'),
      centerTitle: true,
    );
  }

  @override
  Widget body(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 350),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Listener(
                onPointerDown: (e) async {
                  await Future.delayed(const Duration(milliseconds: 350));
                  controller.accountFocus.requestFocus();
                  SystemChannels.textInput
                      .invokeMethod('TextInput.show'); //兼容小米手机

                  // FocusScope.of(context).requestFocus(controller.accountFocus);
                },
                child: TextField(
                  onChanged: controller.setUsername,
                  decoration: const InputDecoration(
                    labelText: '用户名',
                    border: OutlineInputBorder(),
                  ),
                )),
            const SizedBox(height: 16),
            Listener(
                onPointerDown: (e) async {
                  await Future.delayed(const Duration(milliseconds: 350));
                  controller.accountFocus.requestFocus();
                  SystemChannels.textInput
                      .invokeMethod('TextInput.show'); //兼容小米手机

                  // FocusScope.of(context).requestFocus(controller.accountFocus);
                },
                child: TextField(
                    onChanged: controller.setPassword,
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: '密码',
                      border: OutlineInputBorder(),
                    ))),
            const SizedBox(height: 16),
            Listener(
                onPointerDown: (e) async {
                  await Future.delayed(const Duration(milliseconds: 350));
                  controller.accountFocus.requestFocus();
                  SystemChannels.textInput
                      .invokeMethod('TextInput.show'); //兼容小米手机

                  // FocusScope.of(context).requestFocus(controller.accountFocus);
                },
                child: TextField(
                  onChanged: controller.setConfirmPassword,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: '确认密码',
                    border: OutlineInputBorder(),
                  ),
                )),
            const SizedBox(height: 24),
            Obx(() => controller.errorMessage.isNotEmpty
                ? Text(
                    controller.errorMessage.value,
                    style: const TextStyle(color: Colors.red),
                  )
                : const SizedBox()),
            const SizedBox(height: 16),
            Obx(() => ElevatedButton(
                  onPressed:
                      controller.isLoading.value ? null : controller.register,
                  child: controller.isLoading.value
                      ? const CircularProgressIndicator()
                      : const Text('注册'),
                )),
            const SizedBox(height: 16),
            TextButton(
              onPressed: controller.goToLogin,
              child: const Text('已有账号？返回登录'),
            ),
          ],
        ),
      ));
    
  }

}
