import 'package:flutter/material.dart';
import 'package:flutter_template_getx/app/core/base/view/base_view.dart';
import 'package:flutter_template_getx/app/core/widgets/custom_appbar.dart';
import 'package:flutter_template_getx/app/core/values/app_values.dart';
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
    return Obx(() {
      final user = controller.userInfo.value;
      
      if (user == null) {
        return const Center(
          child: Text('加载中...'),
        );
      }

      return SingleChildScrollView(
        padding: EdgeInsets.all(AppValues.margin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 用户头像
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundImage: user.avatar != null 
                    ? NetworkImage(user.avatar!) 
                    : null,
                child: user.avatar == null 
                    ? const Icon(Icons.person, size: 50)
                    : null,
              ),
            ),
            SizedBox(height: AppValues.margin_20),

            // 用户信息卡片
            Card(
              child: Padding(
                padding: EdgeInsets.all(AppValues.margin),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildInfoRow('用户名', user.username),
                    if (user.email != null) 
                      _buildInfoRow('邮箱', user.email!),
                    if (user.phone != null) 
                      _buildInfoRow('电话', user.phone!),
                    if (user.bio != null) 
                      _buildInfoRow('简介', user.bio!),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    });
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: AppValues.margin_10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 80,
            child: Text(
              label,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
          ),
          Expanded(
            child: Text(value),
          ),
        ],
      ),
    );
  }
}
