import 'package:calendar_flutter/data/models/remote/response/memo_response.dart';
import 'package:calendar_flutter/data/models/remote/response/recurrence_instance_response.dart';
import 'package:calendar_flutter/data/models/remote/response/recurrence_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'schedule_event_response.freezed.dart';
part 'schedule_event_response.g.dart';

@freezed
class ScheduleEventResponse with _$ScheduleEventResponse {
  const factory ScheduleEventResponse({
    required int scheduleId,
    required int scheduleType,
    required String scheduleTitle,
    required int eventId,
    required bool isRecurring,
    required bool isAllDay,
    required String createdAt,
    @Default([]) List<RecurrenceInstanceResponse> recurrenceInstances,
    RecurrenceResponse? recurrence,
    required String originalInstanceStartDate,
    required String originalInstanceEndDate,
    required String title,
    required String location,
    required int colorType,
    required bool isScreenLockMode,
    required int notificationSettingType,
    @Default([]) List<MemoResponse> memo,
  }) = _ScheduleEventResponse;

  factory ScheduleEventResponse.fromJson(Map<String, dynamic> json) =>
      _$ScheduleEventResponseFromJson(json);
}
