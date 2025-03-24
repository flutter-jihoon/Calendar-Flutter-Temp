import 'package:freezed_annotation/freezed_annotation.dart';

part 'timetable.freezed.dart';

@freezed
class Timetable with _$Timetable {
  const factory Timetable({
    required int id,
    required String title,
  }) = _Timetable;
}
