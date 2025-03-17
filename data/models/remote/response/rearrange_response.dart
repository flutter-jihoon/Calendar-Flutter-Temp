import 'package:freezed_annotation/freezed_annotation.dart';

part 'rearrange_response.freezed.dart';
part 'rearrange_response.g.dart';

@freezed
class RearrangeResponse with _$RearrangeResponse {
  const factory RearrangeResponse({
    required int id,
    required String title,
    required String rank,
  }) = _RearrangeResponse;

  factory RearrangeResponse.fromJson(Map<String, dynamic> json) =>
      _$RearrangeResponseFromJson(json);
}
