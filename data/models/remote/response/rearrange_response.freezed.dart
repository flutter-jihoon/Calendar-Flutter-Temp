// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rearrange_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RearrangeResponse _$RearrangeResponseFromJson(Map<String, dynamic> json) {
  return _RearrangeResponse.fromJson(json);
}

/// @nodoc
mixin _$RearrangeResponse {
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get rank => throw _privateConstructorUsedError;

  /// Serializes this RearrangeResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RearrangeResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RearrangeResponseCopyWith<RearrangeResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RearrangeResponseCopyWith<$Res> {
  factory $RearrangeResponseCopyWith(
          RearrangeResponse value, $Res Function(RearrangeResponse) then) =
      _$RearrangeResponseCopyWithImpl<$Res, RearrangeResponse>;
  @useResult
  $Res call({int id, String title, String rank});
}

/// @nodoc
class _$RearrangeResponseCopyWithImpl<$Res, $Val extends RearrangeResponse>
    implements $RearrangeResponseCopyWith<$Res> {
  _$RearrangeResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RearrangeResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? rank = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      rank: null == rank
          ? _value.rank
          : rank // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RearrangeResponseImplCopyWith<$Res>
    implements $RearrangeResponseCopyWith<$Res> {
  factory _$$RearrangeResponseImplCopyWith(_$RearrangeResponseImpl value,
          $Res Function(_$RearrangeResponseImpl) then) =
      __$$RearrangeResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String title, String rank});
}

/// @nodoc
class __$$RearrangeResponseImplCopyWithImpl<$Res>
    extends _$RearrangeResponseCopyWithImpl<$Res, _$RearrangeResponseImpl>
    implements _$$RearrangeResponseImplCopyWith<$Res> {
  __$$RearrangeResponseImplCopyWithImpl(_$RearrangeResponseImpl _value,
      $Res Function(_$RearrangeResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of RearrangeResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? rank = null,
  }) {
    return _then(_$RearrangeResponseImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      rank: null == rank
          ? _value.rank
          : rank // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RearrangeResponseImpl implements _RearrangeResponse {
  const _$RearrangeResponseImpl(
      {required this.id, required this.title, required this.rank});

  factory _$RearrangeResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$RearrangeResponseImplFromJson(json);

  @override
  final int id;
  @override
  final String title;
  @override
  final String rank;

  @override
  String toString() {
    return 'RearrangeResponse(id: $id, title: $title, rank: $rank)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RearrangeResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.rank, rank) || other.rank == rank));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, rank);

  /// Create a copy of RearrangeResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RearrangeResponseImplCopyWith<_$RearrangeResponseImpl> get copyWith =>
      __$$RearrangeResponseImplCopyWithImpl<_$RearrangeResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RearrangeResponseImplToJson(
      this,
    );
  }
}

abstract class _RearrangeResponse implements RearrangeResponse {
  const factory _RearrangeResponse(
      {required final int id,
      required final String title,
      required final String rank}) = _$RearrangeResponseImpl;

  factory _RearrangeResponse.fromJson(Map<String, dynamic> json) =
      _$RearrangeResponseImpl.fromJson;

  @override
  int get id;
  @override
  String get title;
  @override
  String get rank;

  /// Create a copy of RearrangeResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RearrangeResponseImplCopyWith<_$RearrangeResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
