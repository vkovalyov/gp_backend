import 'package:dio/dio.dart';

class BaseDio {
  static const _receiveTimeout = 15000;
  static const _connectTimeout = 15000;
  static const _sendTimeout = 15000;

  Dio get() {
    var dio = Dio(BaseOptions(
      receiveTimeout: _receiveTimeout,
      connectTimeout: _connectTimeout,
      sendTimeout: _sendTimeout,
      responseType: ResponseType.json,
    ));

    return dio;
  }
}
