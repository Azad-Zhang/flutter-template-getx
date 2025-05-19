import 'package:permission_handler/permission_handler.dart';
import 'package:get/get.dart';
import 'package:flutter_template_getx/app/core/translations/translation_keys.dart';
import 'package:flutter_template_getx/app/core/utils/toast_util.dart';
import 'package:flutter_template_getx/app/core/utils/dialog_util.dart';
import 'package:flutter/material.dart';

class PermissionUtil {
  /// 显示权限设置对话框
  static Future<void> _showPermissionDialog(BuildContext context, String permissionName) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('权限申请'),
          content: Text('需要$permissionName权限才能使用此功能，是否前往设置页面开启权限？'),
          actions: <Widget>[
            TextButton(
              child: Text('取消'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('去设置'),
              onPressed: () async {
                Navigator.of(context).pop();
                await _openSettings();
              },
            ),
          ],
        );
      },
    );
  }

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
    
    if (status.isDenied || status.isPermanentlyDenied) {
      bool? result = await DialogUtil.showPermissionDialog(Get.context!, '相机');
      if (result == true) {
        await _openSettings();
      }
    }
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
    
    if (status.isDenied || status.isPermanentlyDenied) {
      bool? result = await DialogUtil.showPermissionDialog(Get.context!, '相册');
      if (result == true) {
        await _openSettings();
      }
    }
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
    
    if (status.isDenied || status.isPermanentlyDenied) {
      bool? result = await DialogUtil.showPermissionDialog(Get.context!, '麦克风');
      if (result == true) {
        await _openSettings();
      }
    }
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
    
    if (status.isDenied || status.isPermanentlyDenied) {
      bool? result = await DialogUtil.showPermissionDialog(Get.context!, '位置');
      if (result == true) {
        await _openSettings();
      }
    }
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
    
    if (status.isDenied || status.isPermanentlyDenied) {
      bool? result = await DialogUtil.showPermissionDialog(Get.context!, '通知');
      if (result == true) {
        await _openSettings();
      }
    }
    return false;
  }

  /// 检查权限状态
  static Future<bool> checkPermission(Permission permission) async {
    var status = await permission.status;
    return status.isGranted;
  }

  /// 打开应用设置页面
  static Future<bool> _openSettings() async {
    return await openAppSettings();
  }
} 