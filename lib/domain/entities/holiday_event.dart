import 'package:freezed_annotation/freezed_annotation.dart';

part 'holiday_event.freezed.dart';

@freezed
class HolidayEvent with _$HolidayEvent {
  const factory HolidayEvent({
    required DateTime date,
    required String title,
  }) = _HolidayEvent;
}
