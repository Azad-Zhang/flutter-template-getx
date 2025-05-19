import 'package:permission_handler/permission_handler.dart';
import 'package:get/get.dart';
import 'package:flutter_template_getx/app/core/translations/translation_keys.dart';

class PermissionUtil {
  /// 请求相机权限
  static Future<bool> requestCamera() async {
    var status = await Permission.camera.status;
    if (status.isGranted) {
      return true;
    }
    
    status = await Permission.camera.request();
    if (status.isGranted) {
      return true;
    }
    
    Get.snackbar(
      '提示',
      '需要相机权限才能使用此功能',
      snackPosition: SnackPosition.BOTTOM,
    );
    return false;
  }

  /// 请求相册权限
  static Future<bool> requestPhotos() async {
    var status = await Permission.photos.status;
    if (status.isGranted) {
      return true;
    }
    
    status = await Permission.photos.request();
    if (status.isGranted) {
      return true;
    }
    
    Get.snackbar(
      '提示',
      '需要相册权限才能使用此功能',
      snackPosition: SnackPosition.BOTTOM,
    );
    return false;
  }

  /// 请求麦克风权限
  static Future<bool> requestMicrophone() async {
    var status = await Permission.microphone.status;
    if (status.isGranted) {
      return true;
    }
    
    status = await Permission.microphone.request();
    if (status.isGranted) {
      return true;
    }
    
    Get.snackbar(
      '提示',
      '需要麦克风权限才能使用此功能',
      snackPosition: SnackPosition.BOTTOM,
    );
    return false;
  }

  /// 请求位置权限
  static Future<bool> requestLocation() async {
    var status = await Permission.location.status;
    if (status.isGranted) {
      return true;
    }
    
    status = await Permission.location.request();
    if (status.isGranted) {
      return true;
    }
    
    Get.snackbar(
      '提示',
      '需要位置权限才能使用此功能',
      snackPosition: SnackPosition.BOTTOM,
    );
    return false;
  }

  /// 请求通知权限
  static Future<bool> requestNotification() async {
    var status = await Permission.notification.status;
    if (status.isGranted) {
      return true;
    }
    
    status = await Permission.notification.request();
    if (status.isGranted) {
      return true;
    }
    
    Get.snackbar(
      '提示',
      '需要通知权限才能使用此功能',
      snackPosition: SnackPosition.BOTTOM,
    );
    return false;
  }

  /// 检查权限状态
  static Future<bool> checkPermission(Permission permission) async {
    var status = await permission.status;
    return status.isGranted;
  }

  /// 打开应用设置页面
  static Future<bool> openAppSettings() async {
    return await openAppSettings();
  }
} 