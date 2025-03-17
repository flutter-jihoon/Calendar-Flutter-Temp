// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'host_api_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HostApiResponseImpl _$$HostApiResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$HostApiResponseImpl(
      result: json['result'],
      errorMessage: json['errorMessage'] as String,
      errorCode: (json['errorCode'] as num).toInt(),
    );

Map<String, dynamic> _$$HostApiResponseImplToJson(
        _$HostApiResponseImpl instance) =>
    <String, dynamic>{
      'result': instance.result,
      'errorMessage': instance.errorMessage,
      'errorCode': instance.errorCode,
    };
