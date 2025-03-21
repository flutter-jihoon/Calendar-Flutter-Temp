// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'host_api_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

HostApiResponse _$HostApiResponseFromJson(Map<String, dynamic> json) {
  return _HostApiResponse.fromJson(json);
}

/// @nodoc
mixin _$HostApiResponse {
  dynamic get result => throw _privateConstructorUsedError;
  String get errorMessage => throw _privateConstructorUsedError;
  int get errorCode => throw _privateConstructorUsedError;

  /// Serializes this HostApiResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of HostApiResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HostApiResponseCopyWith<HostApiResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HostApiResponseCopyWith<$Res> {
  factory $HostApiResponseCopyWith(
          HostApiResponse value, $Res Function(HostApiResponse) then) =
      _$HostApiResponseCopyWithImpl<$Res, HostApiResponse>;
  @useResult
  $Res call({dynamic result, String errorMessage, int errorCode});
}

/// @nodoc
class _$HostApiResponseCopyWithImpl<$Res, $Val extends HostApiResponse>
    implements $HostApiResponseCopyWith<$Res> {
  _$HostApiResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HostApiResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? result = freezed,
    Object? errorMessage = null,
    Object? errorCode = null,
  }) {
    return _then(_value.copyWith(
      result: freezed == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as dynamic,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      errorCode: null == errorCode
          ? _value.errorCode
          : errorCode // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HostApiResponseImplCopyWith<$Res>
    implements $HostApiResponseCopyWith<$Res> {
  factory _$$HostApiResponseImplCopyWith(_$HostApiResponseImpl value,
          $Res Function(_$HostApiResponseImpl) then) =
      __$$HostApiResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({dynamic result, String errorMessage, int errorCode});
}

/// @nodoc
class __$$HostApiResponseImplCopyWithImpl<$Res>
    extends _$HostApiResponseCopyWithImpl<$Res, _$HostApiResponseImpl>
    implements _$$HostApiResponseImplCopyWith<$Res> {
  __$$HostApiResponseImplCopyWithImpl(
      _$HostApiResponseImpl _value, $Res Function(_$HostApiResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of HostApiResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? result = freezed,
    Object? errorMessage = null,
    Object? errorCode = null,
  }) {
    return _then(_$HostApiResponseImpl(
      result: freezed == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as dynamic,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      errorCode: null == errorCode
          ? _value.errorCode
          : errorCode // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HostApiResponseImpl implements _HostApiResponse {
  const _$HostApiResponseImpl(
      {required this.result,
      required this.errorMessage,
      required this.errorCode});

  factory _$HostApiResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$HostApiResponseImplFromJson(json);

  @override
  final dynamic result;
  @override
  final String errorMessage;
  @override
  final int errorCode;

  @override
  String toString() {
    return 'HostApiResponse(result: $result, errorMessage: $errorMessage, errorCode: $errorCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HostApiResponseImpl &&
            const DeepCollectionEquality().equals(other.result, result) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.errorCode, errorCode) ||
                other.errorCode == errorCode));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(result), errorMessage, errorCode);

  /// Create a copy of HostApiResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HostApiResponseImplCopyWith<_$HostApiResponseImpl> get copyWith =>
      __$$HostApiResponseImplCopyWithImpl<_$HostApiResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HostApiResponseImplToJson(
      this,
    );
  }
}

abstract class _HostApiResponse implements HostApiResponse {
  const factory _HostApiResponse(
      {required final dynamic result,
      required final String errorMessage,
      required final int errorCode}) = _$HostApiResponseImpl;

  factory _HostApiResponse.fromJson(Map<String, dynamic> json) =
      _$HostApiResponseImpl.fromJson;

  @override
  dynamic get result;
  @override
  String get errorMessage;
  @override
  int get errorCode;

  /// Create a copy of HostApiResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HostApiResponseImplCopyWith<_$HostApiResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
