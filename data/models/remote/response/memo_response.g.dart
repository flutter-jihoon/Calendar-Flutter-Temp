// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'memo_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MemoResponseImpl _$$MemoResponseImplFromJson(Map<String, dynamic> json) =>
    _$MemoResponseImpl(
      memoId: (json['memoId'] as num).toInt(),
      content: json['content'] as String,
    );

Map<String, dynamic> _$$MemoResponseImplToJson(_$MemoResponseImpl instance) =>
    <String, dynamic>{
      'memoId': instance.memoId,
      'content': instance.content,
    };
