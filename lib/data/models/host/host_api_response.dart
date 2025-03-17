import 'package:freezed_annotation/freezed_annotation.dart';

part 'host_api_response.freezed.dart';
part 'host_api_response.g.dart';

@freezed
class HostApiResponse with _$HostApiResponse {
  const factory HostApiResponse({
    required dynamic result,
    required String errorMessage,
    required int errorCode,
  }) = _HostApiResponse;

  factory HostApiResponse.fromJson(Map<String, dynamic> json) =>
      _$HostApiResponseFromJson(json);
}
