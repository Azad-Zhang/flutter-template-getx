import 'dart:io';

import '/app/network/exceptions/api_exception.dart';

// 资源未找到的错误 404
class NotFoundException extends ApiException {
  NotFoundException(String message, String status)
      : super(httpCode: HttpStatus.notFound, status: status, message: message);
}
