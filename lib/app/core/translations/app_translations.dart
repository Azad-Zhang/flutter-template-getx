import 'package:get/get.dart';
import 'translation_keys.dart';

/// 应用翻译类
/// 
/// 继承自 GetX 的 Translations 类，用于实现应用的多语言支持
/// 支持中文（简体）和英文两种语言
/// 使用常量键值管理所有翻译文本
class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        /// 中文（简体）翻译
        /// 
        /// 包含以下类别的翻译：
        /// - 通用文本（应用名称、加载提示、操作按钮等）
        /// - 首页相关文本
        'zh_CN': {
          // 通用
          T.appName: 'Flutter模板',
          T.loading: '加载中...',
          T.success: '成功',
          T.error: '错误',
          T.confirm: '确认',
          T.cancel: '取消',
          
          // 首页
          T.home: '首页',
          T.currentEnvironment: '当前运行环境',
          T.apiAddress: 'API地址',
          T.enableLogging: '是否开启日志',
          T.memoryString: '内存字符串',
          T.setMemoryString: '设置内存字符串',

          // 权限
          T.permissionRequest: '权限申请',
          T.permissionRequestContent: '需要%s权限才能使用此功能，是否前往设置页面开启权限？',
          T.goToSettings: '去设置',

          // 权限名称
          T.camera: '相机',
          T.photos: '相册',
          T.microphone: '麦克风',
          T.location: '位置',
          T.notification: '通知',
        },

        /// 英文翻译
        /// 
        /// 包含以下类别的翻译：
        /// - 通用文本（应用名称、加载提示、操作按钮等）
        /// - 首页相关文本
        'en_US': {
          // Common
          T.appName: 'Flutter Template',
          T.loading: 'Loading...',
          T.success: 'Success',
          T.error: 'Error',
          T.confirm: 'Confirm',
          T.cancel: 'Cancel',
          
          // Home
          T.home: 'Home',
          T.currentEnvironment: 'Current Environment',
          T.apiAddress: 'API Address',
          T.enableLogging: 'Enable Logging',
          T.memoryString: 'Memory String',
          T.setMemoryString: 'Set Memory String',

          // Permissions
          T.permissionRequest: 'Permission Request',
          T.permissionRequestContent: 'Need %s permission to use this feature. Would you like to go to settings to enable it?',
          T.goToSettings: 'Settings',

          // Permission Names
          T.camera: 'Camera',
          T.photos: 'Photos',
          T.microphone: 'Microphone',
          T.location: 'Location',
          T.notification: 'Notification',
        },
      };
} 