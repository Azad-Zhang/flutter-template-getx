import 'package:flutter_template_getx/app/core/base/controller/base_controller.dart';
import 'package:flutter_template_getx/app/core/service/storage_service.dart';
import 'package:flutter_template_getx/app/modules/user/models/user_info.dart';
import 'package:get/get.dart';

class UserController extends BaseController {
  final userInfo = Rxn<UserInfo>();

  @override
  void onInit() {
    super.onInit();
    loadUserInfo();
  }

  /// 加载用户信息
  void loadUserInfo()  {
    try {
      final userInfoJson =  storage.getUserInfo();
      if (userInfoJson != null) { 
        userInfo.value = userInfoJson;  
        logger.d("userInfo: ${userInfo.value.toString()}");
      } else {
        showErrorMessage('未找到用户信息，请重新登录');
      }
    } catch (e) {
      showErrorMessage('加载用户信息失败：$e');
    }
  }

  /// 更新用户信息
  Future<void> updateUserInfo(UserInfo info) async {
    try {
       storage.setUserInfo(info);
      userInfo.value = info;
    } catch (e) {
      showErrorMessage('更新用户信息失败：$e');
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
