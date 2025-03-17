import 'package:calendar_flutter/core/utils/log_util.dart';
import 'package:dio/dio.dart';

class LogInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    logger.i('요청을 보냈습니다: ${options.uri}');
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) {
    logger.i(
      '응답을 받았습니다: [${response.statusCode}] ${response.requestOptions.uri}',
    );
    return super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    logger.e(
      '에러가 발생했습니다: [${err.response?.statusCode}] ${err.requestOptions.uri}',
    );
    return super.onError(err, handler);
  }
}
