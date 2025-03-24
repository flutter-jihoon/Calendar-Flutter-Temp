import 'dart:async';

import 'package:calendar_flutter/core/enums/rest_api_enums.dart';
import 'package:calendar_flutter/data/datasources/remote/timespread_datasource.dart';
import 'package:calendar_flutter/data/models/remote/response/schedule_response.dart';
import 'package:calendar_flutter/domain/entities/calendar.dart';
import 'package:calendar_flutter/domain/entities/schedule_event.dart';
import 'package:calendar_flutter/domain/repositories/calendar_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final calendarRepositoryProvider = Provider<CalendarRepository>(
  (ref) => CalendarRepositoryImpl(ref.watch(timespreadDatasourceProvider)),
  name: 'CalendarRepositoryProvider',
);

class CalendarRepositoryImpl implements CalendarRepository {
  TimespreadDatasource timespreadDatasource;

  CalendarRepositoryImpl(this.timespreadDatasource);

  @override
  Future<List<Calendar>?> getCalendars() async {
    final List<ScheduleResponse>? result =
        await timespreadDatasource.fetchSchedules();
    return result
        ?.map((e) => Calendar(id: e.scheduleId, title: e.title))
        .toList();
  }

  @override
  Future<bool?> addCalendar({required Calendar calendar}) async {
    final List<ScheduleResponse>? result =
        await timespreadDatasource.createSchedule(
      title: calendar.title,
      scheduleType: ScheduleType.calendar.value,
    );
    return result != null;
  }

  @override
  FutureOr<List<ScheduleEvent>?> getScheduleEvents({
    required String startMonth,
    required String endMonth,
    required List<int> scheduleIds,
  }) {
    return [
      ScheduleEvent(
        scheduleId: 1,
        eventId: 1,
        createdAt: DateTime.parse('2025-03-12 16:30:00'),
        isRecurring: true,
        isAllDay: true,
        originalInstanceStartDate: DateTime.parse('2025-03-12 16:30:00'),
        originalInstanceEndDate: DateTime.parse('2025-03-13 17:30:00'),
        title: '테스트 이벤트 1',
        location: '테스트 장소',
        colorType: 1,
        isScreenLockMode: true,
        notificationSettingType: 1,
      ),
      ScheduleEvent(
        scheduleId: 1,
        eventId: 2,
        createdAt: DateTime.parse('2025-03-12 16:30:00'),
        isRecurring: true,
        isAllDay: true,
        originalInstanceStartDate: DateTime.parse('2025-03-15 16:30:00'),
        originalInstanceEndDate: DateTime.parse('2025-03-15 17:30:00'),
        title: '테스트 이벤트 2',
        location: '테스트 장소',
        colorType: 1,
        isScreenLockMode: true,
        notificationSettingType: 1,
      )
    ];
  }
}
