/*
 * @Author: 张仕鹏 1120148291@qq.com
 * @Date: 2025-02-25 16:17:04
 * @LastEditors: 张仕鹏 1120148291@qq.com
 * @LastEditTime: 2025-03-13 15:18:16
 * @FilePath: /flutter-template-getx/lib/app/modules/home/views/home_view.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../flavors.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('当前运行环境: ${F.name}'),
            Text('API 地址: ${F.apiBaseUrl}'),
            Text('是否开启日志: ${F.enableLogging}'),
            Obx(() => Text("内存字符串${controller.storageString.value}")),
            InkWell(
              onTap: () {
                controller.testStorage();
              },
              child: Container(
                width: 200,
                height: 60,
                color: Colors.red,
                child: Text("设置内存字符串123"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
