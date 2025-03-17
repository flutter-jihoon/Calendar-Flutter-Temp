// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'schedule_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ScheduleResponse {
  int get scheduleId => throw _privateConstructorUsedError;
  int get scheduleType => throw _privateConstructorUsedError;
  String get lexoRank => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;

  /// Create a copy of ScheduleResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ScheduleResponseCopyWith<ScheduleResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScheduleResponseCopyWith<$Res> {
  factory $ScheduleResponseCopyWith(
          ScheduleResponse value, $Res Function(ScheduleResponse) then) =
      _$ScheduleResponseCopyWithImpl<$Res, ScheduleResponse>;
  @useResult
  $Res call({int scheduleId, int scheduleType, String lexoRank, String title});
}

/// @nodoc
class _$ScheduleResponseCopyWithImpl<$Res, $Val extends ScheduleResponse>
    implements $ScheduleResponseCopyWith<$Res> {
  _$ScheduleResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ScheduleResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? scheduleId = null,
    Object? scheduleType = null,
    Object? lexoRank = null,
    Object? title = null,
  }) {
    return _then(_value.copyWith(
      scheduleId: null == scheduleId
          ? _value.scheduleId
          : scheduleId // ignore: cast_nullable_to_non_nullable
              as int,
      scheduleType: null == scheduleType
          ? _value.scheduleType
          : scheduleType // ignore: cast_nullable_to_non_nullable
              as int,
      lexoRank: null == lexoRank
          ? _value.lexoRank
          : lexoRank // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ScheduleResponseImplCopyWith<$Res>
    implements $ScheduleResponseCopyWith<$Res> {
  factory _$$ScheduleResponseImplCopyWith(_$ScheduleResponseImpl value,
          $Res Function(_$ScheduleResponseImpl) then) =
      __$$ScheduleResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int scheduleId, int scheduleType, String lexoRank, String title});
}

/// @nodoc
class __$$ScheduleResponseImplCopyWithImpl<$Res>
    extends _$ScheduleResponseCopyWithImpl<$Res, _$ScheduleResponseImpl>
    implements _$$ScheduleResponseImplCopyWith<$Res> {
  __$$ScheduleResponseImplCopyWithImpl(_$ScheduleResponseImpl _value,
      $Res Function(_$ScheduleResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of ScheduleResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? scheduleId = null,
    Object? scheduleType = null,
    Object? lexoRank = null,
    Object? title = null,
  }) {
    return _then(_$ScheduleResponseImpl(
      scheduleId: null == scheduleId
          ? _value.scheduleId
          : scheduleId // ignore: cast_nullable_to_non_nullable
              as int,
      scheduleType: null == scheduleType
          ? _value.scheduleType
          : scheduleType // ignore: cast_nullable_to_non_nullable
              as int,
      lexoRank: null == lexoRank
          ? _value.lexoRank
          : lexoRank // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ScheduleResponseImpl implements _ScheduleResponse {
  const _$ScheduleResponseImpl(
      {required this.scheduleId,
      required this.scheduleType,
      required this.lexoRank,
      required this.title});

  @override
  final int scheduleId;
  @override
  final int scheduleType;
  @override
  final String lexoRank;
  @override
  final String title;

  @override
  String toString() {
    return 'ScheduleResponse(scheduleId: $scheduleId, scheduleType: $scheduleType, lexoRank: $lexoRank, title: $title)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScheduleResponseImpl &&
            (identical(other.scheduleId, scheduleId) ||
                other.scheduleId == scheduleId) &&
            (identical(other.scheduleType, scheduleType) ||
                other.scheduleType == scheduleType) &&
            (identical(other.lexoRank, lexoRank) ||
                other.lexoRank == lexoRank) &&
            (identical(other.title, title) || other.title == title));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, scheduleId, scheduleType, lexoRank, title);

  /// Create a copy of ScheduleResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ScheduleResponseImplCopyWith<_$ScheduleResponseImpl> get copyWith =>
      __$$ScheduleResponseImplCopyWithImpl<_$ScheduleResponseImpl>(
          this, _$identity);
}

abstract class _ScheduleResponse implements ScheduleResponse {
  const factory _ScheduleResponse(
      {required final int scheduleId,
      required final int scheduleType,
      required final String lexoRank,
      required final String title}) = _$ScheduleResponseImpl;

  @override
  int get scheduleId;
  @override
  int get scheduleType;
  @override
  String get lexoRank;
  @override
  String get title;

  /// Create a copy of ScheduleResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ScheduleResponseImplCopyWith<_$ScheduleResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
