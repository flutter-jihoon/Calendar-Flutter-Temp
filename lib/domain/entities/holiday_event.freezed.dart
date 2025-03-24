// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'holiday_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$HolidayEvent {
  DateTime get date => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;

  /// Create a copy of HolidayEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HolidayEventCopyWith<HolidayEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HolidayEventCopyWith<$Res> {
  factory $HolidayEventCopyWith(
          HolidayEvent value, $Res Function(HolidayEvent) then) =
      _$HolidayEventCopyWithImpl<$Res, HolidayEvent>;
  @useResult
  $Res call({DateTime date, String title});
}

/// @nodoc
class _$HolidayEventCopyWithImpl<$Res, $Val extends HolidayEvent>
    implements $HolidayEventCopyWith<$Res> {
  _$HolidayEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HolidayEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? title = null,
  }) {
    return _then(_value.copyWith(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HolidayEventImplCopyWith<$Res>
    implements $HolidayEventCopyWith<$Res> {
  factory _$$HolidayEventImplCopyWith(
          _$HolidayEventImpl value, $Res Function(_$HolidayEventImpl) then) =
      __$$HolidayEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime date, String title});
}

/// @nodoc
class __$$HolidayEventImplCopyWithImpl<$Res>
    extends _$HolidayEventCopyWithImpl<$Res, _$HolidayEventImpl>
    implements _$$HolidayEventImplCopyWith<$Res> {
  __$$HolidayEventImplCopyWithImpl(
      _$HolidayEventImpl _value, $Res Function(_$HolidayEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of HolidayEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? title = null,
  }) {
    return _then(_$HolidayEventImpl(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$HolidayEventImpl implements _HolidayEvent {
  const _$HolidayEventImpl({required this.date, required this.title});

  @override
  final DateTime date;
  @override
  final String title;

  @override
  String toString() {
    return 'HolidayEvent(date: $date, title: $title)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HolidayEventImpl &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.title, title) || other.title == title));
  }

  @override
  int get hashCode => Object.hash(runtimeType, date, title);

  /// Create a copy of HolidayEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HolidayEventImplCopyWith<_$HolidayEventImpl> get copyWith =>
      __$$HolidayEventImplCopyWithImpl<_$HolidayEventImpl>(this, _$identity);
}

abstract class _HolidayEvent implements HolidayEvent {
  const factory _HolidayEvent(
      {required final DateTime date,
      required final String title}) = _$HolidayEventImpl;

  @override
  DateTime get date;
  @override
  String get title;

  /// Create a copy of HolidayEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HolidayEventImplCopyWith<_$HolidayEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
