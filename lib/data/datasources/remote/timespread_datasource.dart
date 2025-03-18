import 'dart:async';

import 'package:calendar_flutter/core/client/rest_api_client.dart';
import 'package:calendar_flutter/data/models/remote/response/holiday_event_response.dart';
import 'package:calendar_flutter/data/models/remote/response/rearrange_response.dart';
import 'package:calendar_flutter/data/models/remote/response/recurrence_response.dart';
import 'package:calendar_flutter/data/models/remote/response/schedule_event_response.dart';
import 'package:calendar_flutter/data/models/remote/response/schedule_response.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final timespreadDatasourceProvider = Provider((ref) {
  return TimespreadDatasourceImpl(ref.watch(timespreadClientProvider));
  // return MockTimespreadDatasourceImpl();
}, name: 'TimespreadDatasourceProvider');

class TimespreadDatasourceImpl implements TimespreadDatasource {
  final Dio timespreadClient;

  TimespreadDatasourceImpl(this.timespreadClient);

  @override
  Future<List<ScheduleResponse>?> createSchedule(
      {required String title, required int scheduleType}) {
    // TODO: implement createSchedule
    throw UnimplementedError();
  }

  @override
  Future<bool?> createScheduleEvent({
    required bool isRecurring,
    required bool isAllDay,
    required String originalInstanceStartDate,
    required String originalInstanceEndDate,
    required String title,
    required String location,
    required int colorType,
    required bool isScreenLockMode,
    required int notificationSettingType,
    required String memo,
    RecurrenceResponse? recurrence,
  }) {
    // TODO: implement createScheduleEvent
    throw UnimplementedError();
  }

  @override
  Future<bool?> deleteSchedule({required int scheduleId}) {
    // TODO: implement deleteSchedule
    throw UnimplementedError();
  }

  @override
  Future<bool?> deleteScheduleEvent(int scheduleId, int eventId) {
    // TODO: implement deleteScheduleEvent
    throw UnimplementedError();
  }

  @override
  Future<List<HolidayEventResponse>?> fetchHolidayEvents(
      String startMonth, String endMonth) {
    // TODO: implement fetchHolidayEvents
    throw UnimplementedError();
  }

  @override
  Future<List<ScheduleEventResponse>?> fetchScheduleEvents(
      {required String startMonth,
      required String endMonth,
      required String scheduleIds}) {
    // TODO: implement fetchScheduleEvents
    throw UnimplementedError();
  }

  @override
  Future<List<ScheduleResponse>?> fetchSchedules() async {
    return await Future.delayed(Duration.zero, () {
      return List.generate(
        5,
        (index) => ScheduleResponse(
          title: '테스트 캘린더 ${index + 1}',
          scheduleId: index + 1,
          scheduleType: 1,
          lexoRank: index.toString(),
        ),
      );
    });
  }

  @override
  Future<RearrangeResponse?> rearrangeCalendar(
      {required int calendarId, required int previousCalendarId}) {
    // TODO: implement rearrangeCalendar
    throw UnimplementedError();
  }

  @override
  Future<bool?> updateScheduleEvent({
    required bool isRecurring,
    required bool isAllDay,
    required String originalInstanceStartDate,
    required String originalInstanceEndDate,
    required String title,
    required String location,
    required int colorType,
    required bool isScreenLockMode,
    required int notificationSettingType,
    required String memo,
    RecurrenceResponse? recurrence,
  }) {
    // TODO: implement updateScheduleEvent
    throw UnimplementedError();
  }

  @override
  Future<bool?> updateScheduleSettings(String title) {
    // TODO: implement updateScheduleSettings
    throw UnimplementedError();
  }
}

abstract interface class TimespreadDatasource {
  FutureOr<List<ScheduleResponse>?> fetchSchedules();
  FutureOr<List<ScheduleResponse>?> createSchedule({
    required String title,
    required int scheduleType,
  });
  FutureOr<bool?> deleteSchedule({required int scheduleId});
  FutureOr<RearrangeResponse?> rearrangeCalendar({
    required int calendarId,
    required int previousCalendarId,
  });
  FutureOr<bool?> updateScheduleSettings(String title);
  FutureOr<List<ScheduleEventResponse>?> fetchScheduleEvents({
    required String startMonth,
    required String endMonth,
    required String scheduleIds,
  });
  FutureOr<bool?> createScheduleEvent({
    required bool isRecurring,
    required bool isAllDay,
    required String originalInstanceStartDate,
    required String originalInstanceEndDate,
    required String title,
    required String location,
    required int colorType,
    required bool isScreenLockMode,
    required int notificationSettingType,
    required String memo,
    RecurrenceResponse? recurrence,
  });
  FutureOr<bool?> updateScheduleEvent({
    required bool isRecurring,
    required bool isAllDay,
    required String originalInstanceStartDate,
    required String originalInstanceEndDate,
    required String title,
    required String location,
    required int colorType,
    required bool isScreenLockMode,
    required int notificationSettingType,
    required String memo,
    RecurrenceResponse? recurrence,
  });
  FutureOr<bool?> deleteScheduleEvent(int scheduleId, int eventId);
  FutureOr<List<HolidayEventResponse>?> fetchHolidayEvents(
    String startMonth,
    String endMonth,
  );
}
