import 'package:calendar_flutter/data/repositories/calendar_repository.dart';
import 'package:calendar_flutter/domain/entities/calendar.dart';
import 'package:calendar_flutter/domain/entities/schedule_event.dart';
import 'package:calendar_flutter/domain/repositories/calendar_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final scheduleEventListProvider = AsyncNotifierProvider.family<
    ScheduleEventListNotifier, List<ScheduleEvent>, Calendar>(
  ScheduleEventListNotifier.new,
  name: 'ScheduleEventListProvider',
);

class ScheduleEventListNotifier
    extends FamilyAsyncNotifier<List<ScheduleEvent>, Calendar> {
  late CalendarRepository _calendarRepository;

  @override
  Future<List<ScheduleEvent>> build(Calendar arg) async {
    _calendarRepository = ref.watch(calendarRepositoryProvider);
    return await _calendarRepository.getScheduleEvents(
          startMonth: '2025-03-12',
          endMonth: '2025-03-13',
          scheduleIds: [1],
        ) ??
        [];
  }
}
