import 'package:freezed_annotation/freezed_annotation.dart';

part 'recurrence_response.freezed.dart';
part 'recurrence_response.g.dart';

@freezed
class RecurrenceResponse with _$RecurrenceResponse {
  const factory RecurrenceResponse({
    required int cycleType,
    required int endType,
    int? repeatCount,
    String? recurrenceEndDate,
    bool? mon,
    bool? tue,
    bool? wed,
    bool? thu,
    bool? fri,
    bool? sat,
    bool? sun,
    required String startDate,
    required String endDate,
  }) = _RecurrenceResponse;

  factory RecurrenceResponse.fromJson(Map<String, dynamic> json) =>
      _$RecurrenceResponseFromJson(json);
}
