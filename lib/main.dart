import 'package:calendar_flutter/calendar_app.dart';
import 'package:calendar_flutter/core/enums/server_type.dart';
import 'package:calendar_flutter/core/providers/current_user_provider.dart';
import 'package:calendar_flutter/core/providers/server_type_provider.dart';
import 'package:calendar_flutter/core/utils/log_util.dart';
import 'package:calendar_flutter/core/utils/provider_log_util.dart';
import 'package:calendar_flutter/domain/entities/current_user.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final Uri initialRoute = getInitialRoute();
  final Map<String, String> queryParameters = initialRoute.queryParameters;
  final CurrentUser currentUser = CurrentUser.fromJson(queryParameters);
  final ServerType serverType = ServerType.fromJson(queryParameters);

  logger.i(currentUser);

  runApp(
    ProviderScope(
      observers: [ProviderLogger()],
      overrides: [
        currentUserProvider.overrideWithValue(currentUser),
        serverTypeProvider.overrideWithValue(serverType),
      ],
      child: CalendarApp(),
    ),
  );
}

Uri getInitialRoute() {
  if (kReleaseMode) {
    return Uri.parse(
      WidgetsBinding.instance.platformDispatcher.defaultRouteName,
    );
  }
  return Uri.parse('/?accessToken=accessToken&serverType=test');
}
