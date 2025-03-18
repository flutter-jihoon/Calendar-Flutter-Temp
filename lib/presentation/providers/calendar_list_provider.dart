import 'dart:async';

import 'package:calendar_flutter/data/repositories/calendar_repository.dart';
import 'package:calendar_flutter/domain/entities/calendar.dart';
import 'package:calendar_flutter/domain/repositories/calendar_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final currentCalendarProvider = StateProvider<Calendar?>(
  (ref) {
    final AsyncValue<List<Calendar>> calendarListState =
        ref.watch(calendarListProvider);
    return calendarListState.when(
      data: (calendarList) => calendarList.firstOrNull,
      loading: () => null,
      error: (error, stackTrace) => null,
    );
  },
  name: 'CurrentCalendarProvider',
);

final calendarListProvider =
    AsyncNotifierProvider<CalendarListNotifier, List<Calendar>>(
  CalendarListNotifier.new,
  name: 'CalendarListProvider',
);

class CalendarListNotifier extends AsyncNotifier<List<Calendar>> {
  late CalendarRepository _calendarRepository;

  @override
  Future<List<Calendar>> build() async {
    _calendarRepository = ref.watch(calendarRepositoryProvider);
    final List<Calendar>? result = await _calendarRepository.getCalendars();
    if (result == null) throw Exception('캘린더가 없습니다.');
    return result;
  }

  Future<bool> addCalendar(Calendar calendar) async {
    final List<Calendar>? currentTimeTables = state.value;
    if (currentTimeTables == null) return false;
    final bool? result = await _calendarRepository.addCalendar(
      calendar: calendar,
    );
    if (result != true) return false;
    state = AsyncData([...currentTimeTables, calendar]);
    return true;
  }

  void rearrangeCalendar(int oldIndex, int newIndex) {
    final List<Calendar>? currentTimeTables = state.value;
    if (currentTimeTables == null) return;
    final List<Calendar> newCalendars = List<Calendar>.from(currentTimeTables);
    final Calendar removedCalendar = newCalendars.removeAt(oldIndex);
    newCalendars.insert(newIndex, removedCalendar);
    state = AsyncData(newCalendars);
  }

  void renameCalendar(Calendar calendar, String newName) {
    final List<Calendar>? currentTimeTables = state.value;
    if (currentTimeTables == null) return;
    final List<Calendar> newCalendars = currentTimeTables.map((e) {
      if (e == calendar) {
        return e.copyWith(title: newName);
      }
      return e;
    }).toList();
    state = AsyncData(newCalendars);
  }

  void removeCalenar(Calendar calendar) {
    final List<Calendar>? currentTimeTables = state.value;
    if (currentTimeTables == null) return;
    final List<Calendar> newCalendars =
        currentTimeTables.where((element) => element != calendar).toList();
    state = AsyncData(newCalendars);
  }
}
