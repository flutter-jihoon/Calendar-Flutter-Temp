// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timespread_api_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TimespreadApiResponseImpl _$$TimespreadApiResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$TimespreadApiResponseImpl(
      result: json['result'],
      errorMessage: json['errorMessage'] as String,
      errorCode: (json['errorCode'] as num).toInt(),
    );

Map<String, dynamic> _$$TimespreadApiResponseImplToJson(
        _$TimespreadApiResponseImpl instance) =>
    <String, dynamic>{
      'result': instance.result,
      'errorMessage': instance.errorMessage,
      'errorCode': instance.errorCode,
    };
