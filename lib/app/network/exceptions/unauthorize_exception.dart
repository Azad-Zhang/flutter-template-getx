import 'dart:io';

import '/app/network/exceptions/base_api_exception.dart';

//未经授权的错误 401
class UnauthorizedException extends BaseApiException {
  UnauthorizedException(String message)
      : super(
            httpCode: HttpStatus.unauthorized,
            message: message,
            status: "unauthorized");
}
