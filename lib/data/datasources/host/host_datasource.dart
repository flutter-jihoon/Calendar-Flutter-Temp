import 'dart:async';

import 'package:calendar_flutter/core/utils/log_util.dart';
import 'package:calendar_flutter/data/models/host/host_api_response.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final hostDatasourceProvider = Provider<HostDatasource>(
  (ref) => HostDatasourceImpl(),
  name: 'HostDatasourceProvider',
);

final flutterApiEventStreamProvider =
    StreamProvider.family.autoDispose<MethodCall, String>((ref, methodName) {
  final hostDatasource = ref.watch(hostDatasourceProvider);
  return hostDatasource.flutterApiEventStream
      .where((event) => event.method == methodName);
}, name: 'FlutterApiEventStreamProvider');

abstract class HostDatasource {
  Future<HostApiResponse?> invokeMethodWithTimeout(
    String method, [
    dynamic arguments,
  ]);
  Stream<MethodCall> get flutterApiEventStream;
}

class HostDatasourceImpl implements HostDatasource {
  static const String _channelName = 'NudgeCh_Calendar';
  static const Duration _requestTimeout = Duration(seconds: 5);
  static const MethodChannel _methodChannel = MethodChannel(_channelName);

  final StreamController<MethodCall> _controller =
      StreamController<MethodCall>();

  HostDatasourceImpl() {
    _methodChannel.setMethodCallHandler((call) async {
      logger.i('Flutter API 요청: $call');
      _controller.add(call);
    });
  }

  @override
  Stream<MethodCall> get flutterApiEventStream => _controller.stream;

  @override
  Future<HostApiResponse?> invokeMethodWithTimeout(
    String method, [
    dynamic arguments,
  ]) async {
    try {
      logger.i('Host API 요청: $method, $arguments');
      final Map<String, dynamic>? responseJson = await _methodChannel
          .invokeMapMethod<String, dynamic>(method, arguments)
          .timeout(_requestTimeout, onTimeout: () {
        throw TimeoutException(
          'Host API 요청 중 타임아웃이 발생했습니다: $method, $arguments',
        );
      });
      if (responseJson == null) {
        throw PlatformException(
          code: 'NullResponseException',
          message: 'Host API 응답이 null입니다: $method, $arguments',
        );
      }
      return HostApiResponse.fromJson(responseJson);
    } on TimeoutException catch (e) {
      logger.e(e);
      return null;
    } on PlatformException catch (e) {
      logger.e(e);
      return null;
    }
  }
}
