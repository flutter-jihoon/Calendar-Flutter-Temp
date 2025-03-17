import 'package:freezed_annotation/freezed_annotation.dart';

part 'schedule_response.freezed.dart';

@freezed
class ScheduleResponse with _$ScheduleResponse {
  const factory ScheduleResponse({
    required int scheduleId,
    required int scheduleType,
    required String lexoRank,
    required String title,
  }) = _ScheduleResponse;
}
