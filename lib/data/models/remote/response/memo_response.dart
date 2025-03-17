import 'package:freezed_annotation/freezed_annotation.dart';

part 'memo_response.freezed.dart';
part 'memo_response.g.dart';

@freezed
class MemoResponse with _$MemoResponse {
  const factory MemoResponse({
    required int memoId,
    required String content,
  }) = _MemoResponse;

  factory MemoResponse.fromJson(Map<String, dynamic> json) =>
      _$MemoResponseFromJson(json);
}
