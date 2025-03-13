import '/app/network/exceptions/base_exception.dart';

//超时错误
class TimeoutException extends BaseException {
  TimeoutException(String message) : super(message: message);
}
