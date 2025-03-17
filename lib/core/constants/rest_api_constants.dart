import 'package:calendar_flutter/core/enums/server_type.dart';

abstract final class RestApiConstants {
  static const String _protocol = 'https';
  static const String _timespreadDomain = 'timespread.co.kr';

  static String getTimespreadUrl(ServerType serverType) {
    return switch (serverType) {
      ServerType.test => '$_protocol://test-gateway.$_timespreadDomain',
      ServerType.qa => '$_protocol://qa-gateway.$_timespreadDomain',
      ServerType.production => '$_protocol://gateway.$_timespreadDomain',
    };
  }
}
