
import 'package:dio/dio.dart';
import 'package:flutter_template_getx/app/core/service/storage_service.dart';
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
    // var bearer = await storage.getData(AppValues.idToken);
    // Logger().d("Complete Token: ${bearer.toString()}");

    // Logger().d("message:${bearer}");
    
    var customHeaders;
    // if (bearer != null) {
    //   customHeaders = {
    //     // 'content-type': 'application/json',
    //     'Authorization': 'Bearer ${bearer}',
    //     'Accept': '*/*',
    //   };
      
    // } else {
    //   customHeaders = {
    //     // 'content-type': 'application/json',
    //     // 'Authorization': 'Bearer ${bearer}',
    //     'Accept': '*/*',
    //   };
    // }

    return customHeaders;
  }
}