import 'package:calendar_flutter/core/utils/log_util.dart';
import 'package:flutter/material.dart';

class RouteLogger extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    logger.t('[PUSH] ${previousRoute?.settings.name} → ${route.settings.name}');
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    logger.t('[POP] ${route.settings.name} → ${previousRoute?.settings.name}');
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    logger.t(
      '[REMOVE] '
      '${previousRoute?.settings.name} → ${route.settings.name}',
    );
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    logger.t(
      '[REPLACE] '
      '${oldRoute?.settings.name} → ${newRoute?.settings.name}',
    );
  }
}
