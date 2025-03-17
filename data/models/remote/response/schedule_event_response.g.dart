// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule_event_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ScheduleEventResponseImpl _$$ScheduleEventResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$ScheduleEventResponseImpl(
      scheduleId: (json['scheduleId'] as num).toInt(),
      scheduleType: (json['scheduleType'] as num).toInt(),
      scheduleTitle: json['scheduleTitle'] as String,
      eventId: (json['eventId'] as num).toInt(),
      isRecurring: json['isRecurring'] as bool,
      isAllDay: json['isAllDay'] as bool,
      createdAt: json['createdAt'] as String,
      recurrenceInstances: (json['recurrenceInstances'] as List<dynamic>?)
              ?.map((e) => RecurrenceInstanceResponse.fromJson(
                  e as Map<String, dynamic>))
              .toList() ??
          const [],
      recurrence: json['recurrence'] == null
          ? null
          : RecurrenceResponse.fromJson(
              json['recurrence'] as Map<String, dynamic>),
      originalInstanceStartDate: json['originalInstanceStartDate'] as String,
      originalInstanceEndDate: json['originalInstanceEndDate'] as String,
      title: json['title'] as String,
      location: json['location'] as String,
      colorType: (json['colorType'] as num).toInt(),
      isScreenLockMode: json['isScreenLockMode'] as bool,
      notificationSettingType: (json['notificationSettingType'] as num).toInt(),
      memo: (json['memo'] as List<dynamic>?)
              ?.map((e) => MemoResponse.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$ScheduleEventResponseImplToJson(
        _$ScheduleEventResponseImpl instance) =>
    <String, dynamic>{
      'scheduleId': instance.scheduleId,
      'scheduleType': instance.scheduleType,
      'scheduleTitle': instance.scheduleTitle,
      'eventId': instance.eventId,
      'isRecurring': instance.isRecurring,
      'isAllDay': instance.isAllDay,
      'createdAt': instance.createdAt,
      'recurrenceInstances': instance.recurrenceInstances,
      'recurrence': instance.recurrence,
      'originalInstanceStartDate': instance.originalInstanceStartDate,
      'originalInstanceEndDate': instance.originalInstanceEndDate,
      'title': instance.title,
      'location': instance.location,
      'colorType': instance.colorType,
      'isScreenLockMode': instance.isScreenLockMode,
      'notificationSettingType': instance.notificationSettingType,
      'memo': instance.memo,
    };
