import 'package:dio/dio.dart';
import 'package:flutter_template_getx/app/core/base/repository/base_repository.dart';
import 'package:flutter_template_getx/app/core/values/app_values.dart';
import 'package:flutter_template_getx/app/modules/user/models/user_info.dart';
import 'package:flutter_template_getx/app/network/dio_provider.dart';
import '../api.dart';
import 'account_repository.dart';

/// 账号相关仓储实现类
///
/// 实现账号相关的所有接口方法
class AccountRepositoryImpl extends BaseRepository
    implements AccountRepository {
  /// 用户登录
  @override
  Future<bool> login(
      {required String username, required String password}) async {
    var uri = DioProvider.baseUrl + Api.loginApi;
    var response = await callApiWithErrorParser(
      dioClient.post(
        uri,
        data: {
          'username': username,
          'password': password,
        },
      ),
    );

    if (response.statusCode == 200) {
      // 存储 token
      storage.setString(AppValues.accessToken, response.data['data']['access']);
      storage.setString(AppValues.refreshToken, response.data['data']['refresh']);

      return true;
    }

    return false;
  }

  /// 获取用户列表
  @override
  Future<Response> getUserList() {
    var uri = DioProvider.baseUrl + Api.userListApi;
    return callApiWithErrorParser(
      dioClient.get(uri),
    );
  }

  /// 创建用户
  @override
  Future<UserInfo> createUser(
      {required String password, required String email}) async {
    var uri = DioProvider.baseUrl + Api.createUserApi;
    var response = await callApiWithErrorParser(
      dioClient.post(
        uri,
        data: {
          'username': email,
          'password': password,
          'email': email,
        },
      ),
    );
    return UserInfo.fromJson(response.data);
  }

  /// 获取当前用户信息
  @override
  Future<UserInfo> getUserInfo() async {
    var uri = DioProvider.baseUrl + Api.infoApi;
    var response = await callApiWithErrorParser(
      dioClient.get(uri),
    );
    return UserInfo.fromJson(response.data['data']);
  }

  /// 上传用户头像
  @override
  Future<Response> uploadAvatar(dynamic avatarFile) {
    var uri = DioProvider.baseUrl + Api.avatarApi;
    return callApiWithErrorParser(
      dioClient.post(
        uri,
        data: avatarFile,
      ),
    );
  }
}
