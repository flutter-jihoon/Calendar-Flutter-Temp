import 'package:freezed_annotation/freezed_annotation.dart';

part 'recurrence_instance_response.freezed.dart';
part 'recurrence_instance_response.g.dart';

@freezed
class RecurrenceInstanceResponse with _$RecurrenceInstanceResponse {
  const factory RecurrenceInstanceResponse({
    required String startDate,
    required String endDate,
  }) = _RecurrenceInstanceResponse;

  factory RecurrenceInstanceResponse.fromJson(Map<String, dynamic> json) =>
      _$RecurrenceInstanceResponseFromJson(json);
}
