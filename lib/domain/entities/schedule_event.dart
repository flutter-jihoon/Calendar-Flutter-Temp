import 'package:freezed_annotation/freezed_annotation.dart';

part 'schedule_event.freezed.dart';

@freezed
class ScheduleEvent with _$ScheduleEvent {
  const factory ScheduleEvent({
    required int scheduleId,
    required int eventId,
    required bool isRecurring,
    required bool isAllDay,
    required String originalInstanceStartDate,
    required String originalInstanceEndDate,
    required String title,
    required String location,
    required int colorType,
    required bool isScreenLockMode,
    required int notificationSettingType,
    List<String>? memo,
  }) = _ScheduleEvent;
}
