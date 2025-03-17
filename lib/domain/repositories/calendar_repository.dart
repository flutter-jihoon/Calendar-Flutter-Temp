import 'dart:async';

import 'package:calendar_flutter/domain/entities/calendar.dart';
import 'package:calendar_flutter/domain/entities/schedule_event.dart';

abstract interface class CalendarRepository {
  FutureOr<List<Calendar>?> getCalendars();
  FutureOr<bool?> addCalendar({required Calendar calendar});
  FutureOr<List<ScheduleEvent>?> getScheduleEvents({
    required String startMonth,
    required String endMonth,
    required List<int> scheduleIds,
  });
}
