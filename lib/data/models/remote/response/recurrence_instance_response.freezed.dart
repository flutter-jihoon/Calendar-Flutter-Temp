// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recurrence_instance_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RecurrenceInstanceResponse _$RecurrenceInstanceResponseFromJson(
    Map<String, dynamic> json) {
  return _RecurrenceInstanceResponse.fromJson(json);
}

/// @nodoc
mixin _$RecurrenceInstanceResponse {
  String get startDate => throw _privateConstructorUsedError;
  String get endDate => throw _privateConstructorUsedError;

  /// Serializes this RecurrenceInstanceResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RecurrenceInstanceResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RecurrenceInstanceResponseCopyWith<RecurrenceInstanceResponse>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecurrenceInstanceResponseCopyWith<$Res> {
  factory $RecurrenceInstanceResponseCopyWith(RecurrenceInstanceResponse value,
          $Res Function(RecurrenceInstanceResponse) then) =
      _$RecurrenceInstanceResponseCopyWithImpl<$Res,
          RecurrenceInstanceResponse>;
  @useResult
  $Res call({String startDate, String endDate});
}

/// @nodoc
class _$RecurrenceInstanceResponseCopyWithImpl<$Res,
        $Val extends RecurrenceInstanceResponse>
    implements $RecurrenceInstanceResponseCopyWith<$Res> {
  _$RecurrenceInstanceResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RecurrenceInstanceResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startDate = null,
    Object? endDate = null,
  }) {
    return _then(_value.copyWith(
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as String,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RecurrenceInstanceResponseImplCopyWith<$Res>
    implements $RecurrenceInstanceResponseCopyWith<$Res> {
  factory _$$RecurrenceInstanceResponseImplCopyWith(
          _$RecurrenceInstanceResponseImpl value,
          $Res Function(_$RecurrenceInstanceResponseImpl) then) =
      __$$RecurrenceInstanceResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String startDate, String endDate});
}

/// @nodoc
class __$$RecurrenceInstanceResponseImplCopyWithImpl<$Res>
    extends _$RecurrenceInstanceResponseCopyWithImpl<$Res,
        _$RecurrenceInstanceResponseImpl>
    implements _$$RecurrenceInstanceResponseImplCopyWith<$Res> {
  __$$RecurrenceInstanceResponseImplCopyWithImpl(
      _$RecurrenceInstanceResponseImpl _value,
      $Res Function(_$RecurrenceInstanceResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of RecurrenceInstanceResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startDate = null,
    Object? endDate = null,
  }) {
    return _then(_$RecurrenceInstanceResponseImpl(
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as String,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RecurrenceInstanceResponseImpl implements _RecurrenceInstanceResponse {
  const _$RecurrenceInstanceResponseImpl(
      {required this.startDate, required this.endDate});

  factory _$RecurrenceInstanceResponseImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$RecurrenceInstanceResponseImplFromJson(json);

  @override
  final String startDate;
  @override
  final String endDate;

  @override
  String toString() {
    return 'RecurrenceInstanceResponse(startDate: $startDate, endDate: $endDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecurrenceInstanceResponseImpl &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, startDate, endDate);

  /// Create a copy of RecurrenceInstanceResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RecurrenceInstanceResponseImplCopyWith<_$RecurrenceInstanceResponseImpl>
      get copyWith => __$$RecurrenceInstanceResponseImplCopyWithImpl<
          _$RecurrenceInstanceResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RecurrenceInstanceResponseImplToJson(
      this,
    );
  }
}

abstract class _RecurrenceInstanceResponse
    implements RecurrenceInstanceResponse {
  const factory _RecurrenceInstanceResponse(
      {required final String startDate,
      required final String endDate}) = _$RecurrenceInstanceResponseImpl;

  factory _RecurrenceInstanceResponse.fromJson(Map<String, dynamic> json) =
      _$RecurrenceInstanceResponseImpl.fromJson;

  @override
  String get startDate;
  @override
  String get endDate;

  /// Create a copy of RecurrenceInstanceResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RecurrenceInstanceResponseImplCopyWith<_$RecurrenceInstanceResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
