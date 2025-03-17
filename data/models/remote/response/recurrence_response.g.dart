// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recurrence_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RecurrenceResponseImpl _$$RecurrenceResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$RecurrenceResponseImpl(
      cycleType: (json['cycleType'] as num).toInt(),
      endType: (json['endType'] as num).toInt(),
      repeatCount: (json['repeatCount'] as num?)?.toInt(),
      recurrenceEndDate: json['recurrenceEndDate'] as String?,
      mon: json['mon'] as bool?,
      tue: json['tue'] as bool?,
      wed: json['wed'] as bool?,
      thu: json['thu'] as bool?,
      fri: json['fri'] as bool?,
      sat: json['sat'] as bool?,
      sun: json['sun'] as bool?,
      startDate: json['startDate'] as String,
      endDate: json['endDate'] as String,
    );

Map<String, dynamic> _$$RecurrenceResponseImplToJson(
        _$RecurrenceResponseImpl instance) =>
    <String, dynamic>{
      'cycleType': instance.cycleType,
      'endType': instance.endType,
      'repeatCount': instance.repeatCount,
      'recurrenceEndDate': instance.recurrenceEndDate,
      'mon': instance.mon,
      'tue': instance.tue,
      'wed': instance.wed,
      'thu': instance.thu,
      'fri': instance.fri,
      'sat': instance.sat,
      'sun': instance.sun,
      'startDate': instance.startDate,
      'endDate': instance.endDate,
    };
