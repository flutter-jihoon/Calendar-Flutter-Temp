import 'package:calendar_flutter/core/enums/calendar_setting_enums.dart';
import 'package:calendar_flutter/core/utils/color_util.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CalendarSetting {
  final CalendarTheme theme;
  final CalendarFontSize fontSize;
  final CalendarFirstDayOfWeek firstDayOfWeek;
  final CalendarTimeFormat calendarTimeFormat;
  final bool showCurrentTime;

  const CalendarSetting({
    this.theme = CalendarTheme.basic,
    this.fontSize = CalendarFontSize.medium,
    this.firstDayOfWeek = CalendarFirstDayOfWeek.sunday,
    this.calendarTimeFormat = CalendarTimeFormat.amPm,
    this.showCurrentTime = true,
  });
}

final calendarSettingProvider =
    AsyncNotifierProvider<CalendarSettingNotifier, CalendarSetting>(
  CalendarSettingNotifier.new,
  name: 'CalendarSettingProvider',
);

abstract interface class CalendarSettingRepository {
  Future<CalendarSetting?> getCalendarSetting();
  Future<void> updateCalendarSetting(CalendarSetting calendarSetting);
}

class CalendarSettingRepositoryImpl implements CalendarSettingRepository {
  @override
  Future<CalendarSetting?> getCalendarSetting() async {
    return CalendarSetting();
  }

  @override
  Future<void> updateCalendarSetting(CalendarSetting calendarSetting) async {}
}

final calendarSettingRepositoryProvider = Provider<CalendarSettingRepository>(
  (ref) => CalendarSettingRepositoryImpl(),
  name: 'CalendarSettingRepositoryProvider',
);

class CalendarSettingNotifier extends AsyncNotifier<CalendarSetting> {
  late CalendarSettingRepository _calendarSettingRepository;

  @override
  Future<CalendarSetting> build() async {
    _calendarSettingRepository = ref.watch(calendarSettingRepositoryProvider);
    final CalendarSetting? savedSetting =
        await _calendarSettingRepository.getCalendarSetting();
    return savedSetting ?? CalendarSetting();
  }
}
