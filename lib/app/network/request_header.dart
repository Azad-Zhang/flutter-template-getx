import 'package:dio/dio.dart';
import 'package:flutter_template_getx/app/core/service/storage_service.dart';
import 'package:flutter_template_getx/app/core/values/app_values.dart';
import 'package:logger/logger.dart';

class RequestHeaderInterceptor extends InterceptorsWrapper {
  final storage = SecureStorageService.instance;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    getCustomHeaders().then((customHeaders) {
      options.headers.addAll(customHeaders);
      super.onRequest(options, handler);
    });
  }

  Future<Map<String, String>> getCustomHeaders() async {
    var accessToken = storage.getString(AppValues.accessToken);
    var refreshToken = storage.getString(AppValues.refreshToken);
    Logger().d("Complete Token: ${accessToken}");

    Logger().d("message:${refreshToken}");

    var customHeaders;
    if (accessToken != null) {
      customHeaders = {
        'content-type': 'application/json',
        'Authorization': 'Bearer ${accessToken}',
        'Accept': '*/*',
      };
    } else {
      customHeaders = {
        'content-type': 'application/json',
        // 'Authorization': 'Bearer ${accessToken}',
        'Accept': '*/*',
      };
    }

    return customHeaders;
  }
}
