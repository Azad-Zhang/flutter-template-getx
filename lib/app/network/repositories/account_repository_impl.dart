import 'package:dio/dio.dart';
import 'package:flutter_template_getx/app/core/base/repository/base_repository.dart';
import 'package:flutter_template_getx/app/network/dio_provider.dart';
import '../api.dart';
import 'account_repository.dart';

/// 账号相关仓储实现类
/// 
/// 实现账号相关的所有接口方法
class AccountRepositoryImpl extends BaseRepository implements AccountRepository {
  /// 用户登录
  @override
  Future<Response> login(String username, String password) {
    var uri = DioProvider.baseUrl + Api.loginApi;
    return callApiWithErrorParser(
      dioClient.post(
        uri,
        data: {
          'username': username,
          'password': password,
        },
      ),
    );
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
  Future<Response> createUser(Map<String, dynamic> userData) {
    var uri = DioProvider.baseUrl + Api.createUserApi;
    return callApiWithErrorParser(
      dioClient.post(
        uri,
        data: userData,
      ),
    );
  }

  /// 获取当前用户信息
  @override
  Future<Response> getUserInfo() {
    var uri = DioProvider.baseUrl + Api.infoApi;
    return callApiWithErrorParser(
      dioClient.get(uri),
    );
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
