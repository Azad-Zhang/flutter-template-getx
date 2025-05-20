import 'package:flutter/material.dart';
import 'package:flutter_template_getx/app/core/values/app_colors.dart';
import 'package:flutter_template_getx/app/modules/home/views/home_view.dart';
import 'package:flutter_template_getx/app/modules/tabs/controllers/tabs_controller.dart';
import 'package:flutter_template_getx/app/modules/user/views/user_view.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class TabsView extends StatelessWidget {
  TabsView({super.key});

  final TabsController controller = Get.find<TabsController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() => Stack(
          children: [
            IndexedStack(
              index: controller.currentIndex.value,
              children: [
                HomeView(),
                UserView(),
              ],
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: BottomNavigationBar(
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
              ),
            ),
          ],
        ));
  }
} 