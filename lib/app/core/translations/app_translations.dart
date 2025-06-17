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

          // 登录
          T.login: '登录',
          T.loginWithAccount: '账号密码登录',
          T.loginPrompt: '请使用已注册的账号密码',
          T.pleaseInputUsername: '请输入用户名',
          T.pleaseInputPassword: '请输入6~12位密码',
          T.username: '用户名',
          T.password: '密码',
          T.rememberPassword: '记住密码',
          T.forgetPassword: '忘记密码？',
          T.otherLogin: '其他登录方式',
          T.passwordError: '密码错误',
          T.toRegister: '使用账号密码注册',

          // 注册 
          T.register: '账号密码注册',
          T.registerPrompt: '未注册的账号注册后将自动登录',
          T.pleaseInputConfirmPassword: '请输入确认密码',
          T.toLogin: '使用账号密码登录',

          // 协议
          T.protocol: '协议',
          T.protocolContent: '协议内容',
          T.protocolAgree: '同意',
          T.protocolDisagree: '不同意',

          // 协议前缀
          T.agreementPrefix: '我已阅读并同意',
          T.userAgreement: '《用户协议》',
          T.and: '和',
          T.privacyPolicy: '《隐私政策》',
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

          // Login
          T.login: 'Login',
          T.loginWithAccount: 'Login with Account',
          T.loginPrompt: 'Please use the registered account password',
          T.pleaseInputUsername: 'Please input username',
          T.pleaseInputPassword: 'Please input 6~12 password',
          T.username: 'Username',
          T.password: 'Password',
          T.rememberPassword: 'Remember Password',
          T.forgetPassword: 'Forget Password?',
          T.toRegister: 'Register with Account',

          // Register
          T.register: 'Register',
          T.registerPrompt: 'Please input register information',
          T.pleaseInputConfirmPassword: 'Please input confirm password',
          T.toLogin: 'Login with Account',
          // Protocol
          T.protocol: 'Protocol',
          T.protocolContent: 'Protocol Content',
          T.protocolAgree: 'Agree',
          T.protocolDisagree: 'Disagree',

          // Agreement
          T.agreementPrefix: 'I have read and agree to',
          T.userAgreement: '《User Agreement》',
          T.and: 'and',
          T.privacyPolicy: '《Privacy Policy》',
        },
      };
} 