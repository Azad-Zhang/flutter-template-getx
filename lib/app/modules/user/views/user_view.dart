import 'package:flutter/material.dart';
import 'package:flutter_template_getx/app/core/base/view/base_view.dart';

import 'package:get/get.dart';

import '../controllers/user_controller.dart';

class UserView extends BaseView<UserController> {
  UserView({super.key});

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return AppBar(
      title: const Text('用户'),
    );
  }

  @override
  Widget body(BuildContext context) {
    return const Center(
      child: Text('用户页面'),
    );
  }
}
