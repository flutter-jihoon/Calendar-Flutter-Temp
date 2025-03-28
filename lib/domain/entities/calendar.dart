import 'package:freezed_annotation/freezed_annotation.dart';

part 'calendar.freezed.dart';

@freezed
class Calendar with _$Calendar {
  const factory Calendar({
    required int id,
    required String title,
  }) = _Calendar;
}
