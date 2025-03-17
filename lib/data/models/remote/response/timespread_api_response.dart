import 'package:freezed_annotation/freezed_annotation.dart';

part 'timespread_api_response.freezed.dart';
part 'timespread_api_response.g.dart';

@freezed
class TimespreadApiResponse with _$TimespreadApiResponse {
  const factory TimespreadApiResponse({
    required dynamic result,
    required String errorMessage,
    required int errorCode,
  }) = _TimespreadApiResponse;

  factory TimespreadApiResponse.fromJson(Map<String, dynamic> json) =>
      _$TimespreadApiResponseFromJson(json);
}
