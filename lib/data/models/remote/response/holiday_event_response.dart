import 'package:freezed_annotation/freezed_annotation.dart';

part 'holiday_event_response.freezed.dart';
part 'holiday_event_response.g.dart';

@freezed
class HolidayEventResponse with _$HolidayEventResponse {
  const factory HolidayEventResponse({
    required int year,
    required int month,
    required String date,
    required String title,
  }) = _HolidayEventModel;

  factory HolidayEventResponse.fromJson(Map<String, dynamic> json) =>
      _$HolidayEventResponseFromJson(json);
}
