/// 账号相关仓储接口
/// 
/// 统一定义账号相关的所有操作方法
abstract class AccountRepository {
  /// 用户登录
  Future login(String username, String password);

  /// 获取用户列表
  Future getUserList();

  /// 创建用户
  Future createUser(Map<String, dynamic> userData);

  /// 获取当前用户信息
  Future getUserInfo();

  /// 上传用户头像
  Future uploadAvatar(dynamic avatarFile);
}