import 'package:flutter/material.dart';
import 'package:flutter_template_getx/app/core/base/view/base_view.dart';
import 'package:flutter_template_getx/app/core/values/app_colors.dart';
import 'package:flutter_template_getx/app/modules/home/views/home_view.dart';
import 'package:flutter_template_getx/app/modules/tabs/controllers/tabs_controller.dart';
import 'package:flutter_template_getx/app/modules/user/views/user_view.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class TabsView extends BaseView<TabsController> {
   TabsView({super.key});

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return null;
  }

  @override
  Widget body(BuildContext context) {
    return Scaffold(
      body: Obx(() => IndexedStack(
            index: controller.currentIndex.value,
            children: [
              HomeView(),
              UserView(),
            ],
          )),
      bottomNavigationBar: Obx(() => BottomNavigationBar(
            currentIndex: controller.currentIndex.value,
            onTap: controller.switchTab,
            selectedItemColor: AppColors.colorPrimary,
            unselectedItemColor: Colors.grey,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: '首页',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: '我的',
              ),
            ],
          )),
    );
  }
} 