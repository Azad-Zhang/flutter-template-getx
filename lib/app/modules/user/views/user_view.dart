import 'package:flutter/material.dart';
import 'package:flutter_template_getx/app/core/base/view/base_view.dart';
import 'package:flutter_template_getx/app/core/widgets/custom_appbar.dart';

import 'package:get/get.dart';

import '../controllers/user_controller.dart';

class UserView extends BaseView<UserController> {
  UserView({super.key});
  @override
  Widget? appBar(BuildContext context) {
    return CustomAppBar(
      title: const Text('用户'),
      backgroundColor: Colors.transparent,
      centerTitle: true,
    );
  }

  @override
  Widget body(BuildContext context) {
    return  Container(
      child: Text('用户页面'),
    );
  }
}
