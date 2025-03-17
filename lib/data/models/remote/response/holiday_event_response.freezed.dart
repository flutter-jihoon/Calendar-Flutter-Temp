// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'holiday_event_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

HolidayEventResponse _$HolidayEventResponseFromJson(Map<String, dynamic> json) {
  return _HolidayEventModel.fromJson(json);
}

/// @nodoc
mixin _$HolidayEventResponse {
  int get year => throw _privateConstructorUsedError;
  int get month => throw _privateConstructorUsedError;
  String get date => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;

  /// Serializes this HolidayEventResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of HolidayEventResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HolidayEventResponseCopyWith<HolidayEventResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HolidayEventResponseCopyWith<$Res> {
  factory $HolidayEventResponseCopyWith(HolidayEventResponse value,
          $Res Function(HolidayEventResponse) then) =
      _$HolidayEventResponseCopyWithImpl<$Res, HolidayEventResponse>;
  @useResult
  $Res call({int year, int month, String date, String title});
}

/// @nodoc
class _$HolidayEventResponseCopyWithImpl<$Res,
        $Val extends HolidayEventResponse>
    implements $HolidayEventResponseCopyWith<$Res> {
  _$HolidayEventResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HolidayEventResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? year = null,
    Object? month = null,
    Object? date = null,
    Object? title = null,
  }) {
    return _then(_value.copyWith(
      year: null == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int,
      month: null == month
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as int,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HolidayEventModelImplCopyWith<$Res>
    implements $HolidayEventResponseCopyWith<$Res> {
  factory _$$HolidayEventModelImplCopyWith(_$HolidayEventModelImpl value,
          $Res Function(_$HolidayEventModelImpl) then) =
      __$$HolidayEventModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int year, int month, String date, String title});
}

/// @nodoc
class __$$HolidayEventModelImplCopyWithImpl<$Res>
    extends _$HolidayEventResponseCopyWithImpl<$Res, _$HolidayEventModelImpl>
    implements _$$HolidayEventModelImplCopyWith<$Res> {
  __$$HolidayEventModelImplCopyWithImpl(_$HolidayEventModelImpl _value,
      $Res Function(_$HolidayEventModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of HolidayEventResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? year = null,
    Object? month = null,
    Object? date = null,
    Object? title = null,
  }) {
    return _then(_$HolidayEventModelImpl(
      year: null == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int,
      month: null == month
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as int,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HolidayEventModelImpl implements _HolidayEventModel {
  const _$HolidayEventModelImpl(
      {required this.year,
      required this.month,
      required this.date,
      required this.title});

  factory _$HolidayEventModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$HolidayEventModelImplFromJson(json);

  @override
  final int year;
  @override
  final int month;
  @override
  final String date;
  @override
  final String title;

  @override
  String toString() {
    return 'HolidayEventResponse(year: $year, month: $month, date: $date, title: $title)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HolidayEventModelImpl &&
            (identical(other.year, year) || other.year == year) &&
            (identical(other.month, month) || other.month == month) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.title, title) || other.title == title));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, year, month, date, title);

  /// Create a copy of HolidayEventResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HolidayEventModelImplCopyWith<_$HolidayEventModelImpl> get copyWith =>
      __$$HolidayEventModelImplCopyWithImpl<_$HolidayEventModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HolidayEventModelImplToJson(
      this,
    );
  }
}

abstract class _HolidayEventModel implements HolidayEventResponse {
  const factory _HolidayEventModel(
      {required final int year,
      required final int month,
      required final String date,
      required final String title}) = _$HolidayEventModelImpl;

  factory _HolidayEventModel.fromJson(Map<String, dynamic> json) =
      _$HolidayEventModelImpl.fromJson;

  @override
  int get year;
  @override
  int get month;
  @override
  String get date;
  @override
  String get title;

  /// Create a copy of HolidayEventResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HolidayEventModelImplCopyWith<_$HolidayEventModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
