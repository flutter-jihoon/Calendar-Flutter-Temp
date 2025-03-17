// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'memo_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MemoResponse _$MemoResponseFromJson(Map<String, dynamic> json) {
  return _MemoResponse.fromJson(json);
}

/// @nodoc
mixin _$MemoResponse {
  int get memoId => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;

  /// Serializes this MemoResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MemoResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MemoResponseCopyWith<MemoResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MemoResponseCopyWith<$Res> {
  factory $MemoResponseCopyWith(
          MemoResponse value, $Res Function(MemoResponse) then) =
      _$MemoResponseCopyWithImpl<$Res, MemoResponse>;
  @useResult
  $Res call({int memoId, String content});
}

/// @nodoc
class _$MemoResponseCopyWithImpl<$Res, $Val extends MemoResponse>
    implements $MemoResponseCopyWith<$Res> {
  _$MemoResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MemoResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? memoId = null,
    Object? content = null,
  }) {
    return _then(_value.copyWith(
      memoId: null == memoId
          ? _value.memoId
          : memoId // ignore: cast_nullable_to_non_nullable
              as int,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MemoResponseImplCopyWith<$Res>
    implements $MemoResponseCopyWith<$Res> {
  factory _$$MemoResponseImplCopyWith(
          _$MemoResponseImpl value, $Res Function(_$MemoResponseImpl) then) =
      __$$MemoResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int memoId, String content});
}

/// @nodoc
class __$$MemoResponseImplCopyWithImpl<$Res>
    extends _$MemoResponseCopyWithImpl<$Res, _$MemoResponseImpl>
    implements _$$MemoResponseImplCopyWith<$Res> {
  __$$MemoResponseImplCopyWithImpl(
      _$MemoResponseImpl _value, $Res Function(_$MemoResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of MemoResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? memoId = null,
    Object? content = null,
  }) {
    return _then(_$MemoResponseImpl(
      memoId: null == memoId
          ? _value.memoId
          : memoId // ignore: cast_nullable_to_non_nullable
              as int,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MemoResponseImpl implements _MemoResponse {
  const _$MemoResponseImpl({required this.memoId, required this.content});

  factory _$MemoResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$MemoResponseImplFromJson(json);

  @override
  final int memoId;
  @override
  final String content;

  @override
  String toString() {
    return 'MemoResponse(memoId: $memoId, content: $content)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MemoResponseImpl &&
            (identical(other.memoId, memoId) || other.memoId == memoId) &&
            (identical(other.content, content) || other.content == content));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, memoId, content);

  /// Create a copy of MemoResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MemoResponseImplCopyWith<_$MemoResponseImpl> get copyWith =>
      __$$MemoResponseImplCopyWithImpl<_$MemoResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MemoResponseImplToJson(
      this,
    );
  }
}

abstract class _MemoResponse implements MemoResponse {
  const factory _MemoResponse(
      {required final int memoId,
      required final String content}) = _$MemoResponseImpl;

  factory _MemoResponse.fromJson(Map<String, dynamic> json) =
      _$MemoResponseImpl.fromJson;

  @override
  int get memoId;
  @override
  String get content;

  /// Create a copy of MemoResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MemoResponseImplCopyWith<_$MemoResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
