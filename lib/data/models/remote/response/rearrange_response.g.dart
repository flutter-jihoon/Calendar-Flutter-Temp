// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rearrange_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RearrangeResponseImpl _$$RearrangeResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$RearrangeResponseImpl(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      rank: json['rank'] as String,
    );

Map<String, dynamic> _$$RearrangeResponseImplToJson(
        _$RearrangeResponseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'rank': instance.rank,
    };
