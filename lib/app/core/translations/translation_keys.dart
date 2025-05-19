/// 翻译键值类
/// 
/// 定义了应用中所有需要翻译的文本键值
/// 使用静态常量管理所有翻译键，便于统一管理和维护
/// 按功能模块分类组织翻译键
abstract class T {
  /// 通用文本翻译键
  /// 
  /// 包含应用名称、状态提示、操作按钮等通用文本
  static const String appName = 'appName';        /// 应用名称
  static const String loading = 'loading';        /// 加载提示
  static const String success = 'success';        /// 成功提示
  static const String error = 'error';           /// 错误提示
  static const String confirm = 'confirm';        /// 确认按钮
  static const String cancel = 'cancel';         /// 取消按钮
  
  /// 首页相关翻译键
  /// 
  /// 包含首页特有的文本内容
  static const String home = 'home';             /// 首页标题
  static const String currentEnvironment = 'currentEnvironment';  /// 当前环境
  static const String apiAddress = 'apiAddress';  /// API地址
  static const String enableLogging = 'enableLogging';  /// 日志开关
  static const String memoryString = 'memoryString';    /// 内存字符串
  static const String setMemoryString = 'setMemoryString';  /// 设置内存字符串

  /// 权限相关翻译键
  /// 
  /// 包含权限相关的文本内容
  static const String permissionRequest = 'permissionRequest';
  static const String permissionRequestContent = 'permissionRequestContent';
  static const String goToSettings = 'goToSettings';
  
  /// 权限名称
  static const String camera = 'camera';
  static const String photos = 'photos';
  static const String microphone = 'microphone';
  static const String location = 'location';
  static const String notification = 'notification';
} 