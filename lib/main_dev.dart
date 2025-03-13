/*
 * @Author: 张仕鹏 1120148291@qq.com
 * @Date: 2025-02-25 16:17:04
 * @LastEditors: 张仕鹏 1120148291@qq.com
 * @LastEditTime: 2025-03-13 14:54:32
 * @FilePath: /flutter-template-getx/lib/main_dev.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import 'flavors.dart';

import 'main.dart' as runner;

Future<void> main() async {
  F.appFlavor = Flavor.dev;
  
  await runner.main();
}
