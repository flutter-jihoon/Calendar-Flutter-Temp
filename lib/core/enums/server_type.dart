import 'package:calendar_flutter/core/utils/log_util.dart';

enum ServerType {
  test('test'),
  qa('qa'),
  production('production');

  final String value;
  const ServerType(this.value);

  static ServerType fromJson(Map<String, dynamic> json) {
    final String serverType = json['serverType'];
    return ServerType.values.firstWhere(
      (e) => e.value == serverType,
      orElse: () {
        logger.e('정의되지 않은 서버 타입: $serverType');
        throw Exception('정의되지 않은 서버 타입: $serverType');
      },
    );
  }
}
