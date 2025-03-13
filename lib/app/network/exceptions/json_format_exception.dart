import '/app/network/exceptions/base_exception.dart';

// 表示 JSON 格式异常
class JsonFormatException extends BaseException {
  JsonFormatException(String message) : super(message: message);
}
