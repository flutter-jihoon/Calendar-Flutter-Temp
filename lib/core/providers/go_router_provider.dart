import 'package:calendar_flutter/core/utils/route_log_util.dart';
import 'package:calendar_flutter/presentation/screens/calendar/calendar_screen.dart';
import 'package:calendar_flutter/presentation/screens/repeat_end_setting/repeat_end_setting_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:calendar_flutter/core/constants/route_path.dart';
import 'package:calendar_flutter/presentation/screens/add_event/add_event_screen.dart';
import 'package:calendar_flutter/presentation/screens/notification_setting/notification_setting_screen.dart';
import 'package:calendar_flutter/presentation/screens/repeat_setting/repeat_setting_screen.dart';
import 'package:calendar_flutter/presentation/screens/calendar_manage/calendar_manage_screen.dart';
import 'package:calendar_flutter/presentation/screens/calendar_select/calendar_select_screen.dart';
import 'package:calendar_flutter/presentation/screens/calendar_setting/calendar_setting_screen.dart';

final goRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: RoutePath.calendarSelectScreenRoute,
    observers: [RouteLogger()],
    routes: [
      GoRoute(
        path: RoutePath.calendarSelectScreenRoute,
        name: RoutePath.calendarSelectScreenRoute,
        builder: (_, __) => CalendarSelectScreen(),
      ),
      GoRoute(
        path: RoutePath.calendarScreenRoute,
        name: RoutePath.calendarScreenRoute,
        builder: (_, __) => const CalendarScreen(),
        routes: [
          GoRoute(
            path: RoutePath.addScheduleScreenRoute,
            name: RoutePath.addScheduleScreenRoute,
            builder: (_, __) => const AddEventScreen(),
            routes: [
              GoRoute(
                path: RoutePath.repeatSettingScreenRoute,
                name: RoutePath.repeatSettingScreenRoute,
                builder: (_, __) => const RepeatSettingScreen(),
                routes: [
                  GoRoute(
                    path: RoutePath.repeatEndSettingScreenRoute,
                    name: RoutePath.repeatEndSettingScreenRoute,
                    builder: (_, __) => const RepeatEndSettingScreen(),
                  ),
                ],
              ),
              GoRoute(
                path: RoutePath.notificationSettingScreenRoute,
                name: RoutePath.notificationSettingScreenRoute,
                builder: (_, __) => const NotificationSettingScreen(),
              ),
            ],
          ),
          GoRoute(
            path: RoutePath.calendarManageScreenRoute,
            name: RoutePath.calendarManageScreenRoute,
            builder: (_, __) => const CalendarManageScreen(),
          ),
          GoRoute(
            path: RoutePath.calendarSettingScreenRoute,
            name: RoutePath.calendarSettingScreenRoute,
            builder: (_, __) => const CalendarSettingScreen(),
          ),
        ],
      ),
    ],
  );
}, name: 'GoRouterProvider');
