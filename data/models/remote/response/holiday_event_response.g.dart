// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'holiday_event_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HolidayEventModelImpl _$$HolidayEventModelImplFromJson(
        Map<String, dynamic> json) =>
    _$HolidayEventModelImpl(
      year: (json['year'] as num).toInt(),
      month: (json['month'] as num).toInt(),
      date: json['date'] as String,
      title: json['title'] as String,
    );

Map<String, dynamic> _$$HolidayEventModelImplToJson(
        _$HolidayEventModelImpl instance) =>
    <String, dynamic>{
      'year': instance.year,
      'month': instance.month,
      'date': instance.date,
      'title': instance.title,
    };
