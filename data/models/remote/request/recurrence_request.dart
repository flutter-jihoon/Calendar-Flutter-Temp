import 'package:freezed_annotation/freezed_annotation.dart';

part 'recurrence_request.freezed.dart';

@freezed
class RecurrenceRequest with _$RecurrenceRequest {
  const factory RecurrenceRequest({
    required int cycleType,
    required int endType,
    required int repeatCount,
    required String recurrenceEndDate,
    bool? mon,
    bool? tue,
    bool? wed,
    bool? thu,
    bool? fri,
    bool? sat,
    bool? sun,
  }) = _RecurrenceRequest;

  factory RecurrenceRequest.fromJson(Map<String, dynamic> json) =>
      _$RecurrenceRequestFromJson(json);
}
