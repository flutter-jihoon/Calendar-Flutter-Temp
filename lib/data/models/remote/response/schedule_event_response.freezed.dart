// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'schedule_event_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ScheduleEventResponse _$ScheduleEventResponseFromJson(
    Map<String, dynamic> json) {
  return _ScheduleEventResponse.fromJson(json);
}

/// @nodoc
mixin _$ScheduleEventResponse {
  int get scheduleId => throw _privateConstructorUsedError;
  int get scheduleType => throw _privateConstructorUsedError;
  String get scheduleTitle => throw _privateConstructorUsedError;
  int get eventId => throw _privateConstructorUsedError;
  bool get isRecurring => throw _privateConstructorUsedError;
  bool get isAllDay => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  List<RecurrenceInstanceResponse> get recurrenceInstances =>
      throw _privateConstructorUsedError;
  RecurrenceResponse? get recurrence => throw _privateConstructorUsedError;
  String get originalInstanceStartDate => throw _privateConstructorUsedError;
  String get originalInstanceEndDate => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get location => throw _privateConstructorUsedError;
  int get colorType => throw _privateConstructorUsedError;
  bool get isScreenLockMode => throw _privateConstructorUsedError;
  int get notificationSettingType => throw _privateConstructorUsedError;
  List<MemoResponse> get memo => throw _privateConstructorUsedError;

  /// Serializes this ScheduleEventResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ScheduleEventResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ScheduleEventResponseCopyWith<ScheduleEventResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScheduleEventResponseCopyWith<$Res> {
  factory $ScheduleEventResponseCopyWith(ScheduleEventResponse value,
          $Res Function(ScheduleEventResponse) then) =
      _$ScheduleEventResponseCopyWithImpl<$Res, ScheduleEventResponse>;
  @useResult
  $Res call(
      {int scheduleId,
      int scheduleType,
      String scheduleTitle,
      int eventId,
      bool isRecurring,
      bool isAllDay,
      String createdAt,
      List<RecurrenceInstanceResponse> recurrenceInstances,
      RecurrenceResponse? recurrence,
      String originalInstanceStartDate,
      String originalInstanceEndDate,
      String title,
      String location,
      int colorType,
      bool isScreenLockMode,
      int notificationSettingType,
      List<MemoResponse> memo});

  $RecurrenceResponseCopyWith<$Res>? get recurrence;
}

/// @nodoc
class _$ScheduleEventResponseCopyWithImpl<$Res,
        $Val extends ScheduleEventResponse>
    implements $ScheduleEventResponseCopyWith<$Res> {
  _$ScheduleEventResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ScheduleEventResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? scheduleId = null,
    Object? scheduleType = null,
    Object? scheduleTitle = null,
    Object? eventId = null,
    Object? isRecurring = null,
    Object? isAllDay = null,
    Object? createdAt = null,
    Object? recurrenceInstances = null,
    Object? recurrence = freezed,
    Object? originalInstanceStartDate = null,
    Object? originalInstanceEndDate = null,
    Object? title = null,
    Object? location = null,
    Object? colorType = null,
    Object? isScreenLockMode = null,
    Object? notificationSettingType = null,
    Object? memo = null,
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
      scheduleTitle: null == scheduleTitle
          ? _value.scheduleTitle
          : scheduleTitle // ignore: cast_nullable_to_non_nullable
              as String,
      eventId: null == eventId
          ? _value.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as int,
      isRecurring: null == isRecurring
          ? _value.isRecurring
          : isRecurring // ignore: cast_nullable_to_non_nullable
              as bool,
      isAllDay: null == isAllDay
          ? _value.isAllDay
          : isAllDay // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      recurrenceInstances: null == recurrenceInstances
          ? _value.recurrenceInstances
          : recurrenceInstances // ignore: cast_nullable_to_non_nullable
              as List<RecurrenceInstanceResponse>,
      recurrence: freezed == recurrence
          ? _value.recurrence
          : recurrence // ignore: cast_nullable_to_non_nullable
              as RecurrenceResponse?,
      originalInstanceStartDate: null == originalInstanceStartDate
          ? _value.originalInstanceStartDate
          : originalInstanceStartDate // ignore: cast_nullable_to_non_nullable
              as String,
      originalInstanceEndDate: null == originalInstanceEndDate
          ? _value.originalInstanceEndDate
          : originalInstanceEndDate // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      colorType: null == colorType
          ? _value.colorType
          : colorType // ignore: cast_nullable_to_non_nullable
              as int,
      isScreenLockMode: null == isScreenLockMode
          ? _value.isScreenLockMode
          : isScreenLockMode // ignore: cast_nullable_to_non_nullable
              as bool,
      notificationSettingType: null == notificationSettingType
          ? _value.notificationSettingType
          : notificationSettingType // ignore: cast_nullable_to_non_nullable
              as int,
      memo: null == memo
          ? _value.memo
          : memo // ignore: cast_nullable_to_non_nullable
              as List<MemoResponse>,
    ) as $Val);
  }

  /// Create a copy of ScheduleEventResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RecurrenceResponseCopyWith<$Res>? get recurrence {
    if (_value.recurrence == null) {
      return null;
    }

    return $RecurrenceResponseCopyWith<$Res>(_value.recurrence!, (value) {
      return _then(_value.copyWith(recurrence: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ScheduleEventResponseImplCopyWith<$Res>
    implements $ScheduleEventResponseCopyWith<$Res> {
  factory _$$ScheduleEventResponseImplCopyWith(
          _$ScheduleEventResponseImpl value,
          $Res Function(_$ScheduleEventResponseImpl) then) =
      __$$ScheduleEventResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int scheduleId,
      int scheduleType,
      String scheduleTitle,
      int eventId,
      bool isRecurring,
      bool isAllDay,
      String createdAt,
      List<RecurrenceInstanceResponse> recurrenceInstances,
      RecurrenceResponse? recurrence,
      String originalInstanceStartDate,
      String originalInstanceEndDate,
      String title,
      String location,
      int colorType,
      bool isScreenLockMode,
      int notificationSettingType,
      List<MemoResponse> memo});

  @override
  $RecurrenceResponseCopyWith<$Res>? get recurrence;
}

/// @nodoc
class __$$ScheduleEventResponseImplCopyWithImpl<$Res>
    extends _$ScheduleEventResponseCopyWithImpl<$Res,
        _$ScheduleEventResponseImpl>
    implements _$$ScheduleEventResponseImplCopyWith<$Res> {
  __$$ScheduleEventResponseImplCopyWithImpl(_$ScheduleEventResponseImpl _value,
      $Res Function(_$ScheduleEventResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of ScheduleEventResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? scheduleId = null,
    Object? scheduleType = null,
    Object? scheduleTitle = null,
    Object? eventId = null,
    Object? isRecurring = null,
    Object? isAllDay = null,
    Object? createdAt = null,
    Object? recurrenceInstances = null,
    Object? recurrence = freezed,
    Object? originalInstanceStartDate = null,
    Object? originalInstanceEndDate = null,
    Object? title = null,
    Object? location = null,
    Object? colorType = null,
    Object? isScreenLockMode = null,
    Object? notificationSettingType = null,
    Object? memo = null,
  }) {
    return _then(_$ScheduleEventResponseImpl(
      scheduleId: null == scheduleId
          ? _value.scheduleId
          : scheduleId // ignore: cast_nullable_to_non_nullable
              as int,
      scheduleType: null == scheduleType
          ? _value.scheduleType
          : scheduleType // ignore: cast_nullable_to_non_nullable
              as int,
      scheduleTitle: null == scheduleTitle
          ? _value.scheduleTitle
          : scheduleTitle // ignore: cast_nullable_to_non_nullable
              as String,
      eventId: null == eventId
          ? _value.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as int,
      isRecurring: null == isRecurring
          ? _value.isRecurring
          : isRecurring // ignore: cast_nullable_to_non_nullable
              as bool,
      isAllDay: null == isAllDay
          ? _value.isAllDay
          : isAllDay // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      recurrenceInstances: null == recurrenceInstances
          ? _value._recurrenceInstances
          : recurrenceInstances // ignore: cast_nullable_to_non_nullable
              as List<RecurrenceInstanceResponse>,
      recurrence: freezed == recurrence
          ? _value.recurrence
          : recurrence // ignore: cast_nullable_to_non_nullable
              as RecurrenceResponse?,
      originalInstanceStartDate: null == originalInstanceStartDate
          ? _value.originalInstanceStartDate
          : originalInstanceStartDate // ignore: cast_nullable_to_non_nullable
              as String,
      originalInstanceEndDate: null == originalInstanceEndDate
          ? _value.originalInstanceEndDate
          : originalInstanceEndDate // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      colorType: null == colorType
          ? _value.colorType
          : colorType // ignore: cast_nullable_to_non_nullable
              as int,
      isScreenLockMode: null == isScreenLockMode
          ? _value.isScreenLockMode
          : isScreenLockMode // ignore: cast_nullable_to_non_nullable
              as bool,
      notificationSettingType: null == notificationSettingType
          ? _value.notificationSettingType
          : notificationSettingType // ignore: cast_nullable_to_non_nullable
              as int,
      memo: null == memo
          ? _value._memo
          : memo // ignore: cast_nullable_to_non_nullable
              as List<MemoResponse>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ScheduleEventResponseImpl implements _ScheduleEventResponse {
  const _$ScheduleEventResponseImpl(
      {required this.scheduleId,
      required this.scheduleType,
      required this.scheduleTitle,
      required this.eventId,
      required this.isRecurring,
      required this.isAllDay,
      required this.createdAt,
      final List<RecurrenceInstanceResponse> recurrenceInstances = const [],
      this.recurrence,
      required this.originalInstanceStartDate,
      required this.originalInstanceEndDate,
      required this.title,
      required this.location,
      required this.colorType,
      required this.isScreenLockMode,
      required this.notificationSettingType,
      final List<MemoResponse> memo = const []})
      : _recurrenceInstances = recurrenceInstances,
        _memo = memo;

  factory _$ScheduleEventResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ScheduleEventResponseImplFromJson(json);

  @override
  final int scheduleId;
  @override
  final int scheduleType;
  @override
  final String scheduleTitle;
  @override
  final int eventId;
  @override
  final bool isRecurring;
  @override
  final bool isAllDay;
  @override
  final String createdAt;
  final List<RecurrenceInstanceResponse> _recurrenceInstances;
  @override
  @JsonKey()
  List<RecurrenceInstanceResponse> get recurrenceInstances {
    if (_recurrenceInstances is EqualUnmodifiableListView)
      return _recurrenceInstances;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_recurrenceInstances);
  }

  @override
  final RecurrenceResponse? recurrence;
  @override
  final String originalInstanceStartDate;
  @override
  final String originalInstanceEndDate;
  @override
  final String title;
  @override
  final String location;
  @override
  final int colorType;
  @override
  final bool isScreenLockMode;
  @override
  final int notificationSettingType;
  final List<MemoResponse> _memo;
  @override
  @JsonKey()
  List<MemoResponse> get memo {
    if (_memo is EqualUnmodifiableListView) return _memo;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_memo);
  }

  @override
  String toString() {
    return 'ScheduleEventResponse(scheduleId: $scheduleId, scheduleType: $scheduleType, scheduleTitle: $scheduleTitle, eventId: $eventId, isRecurring: $isRecurring, isAllDay: $isAllDay, createdAt: $createdAt, recurrenceInstances: $recurrenceInstances, recurrence: $recurrence, originalInstanceStartDate: $originalInstanceStartDate, originalInstanceEndDate: $originalInstanceEndDate, title: $title, location: $location, colorType: $colorType, isScreenLockMode: $isScreenLockMode, notificationSettingType: $notificationSettingType, memo: $memo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScheduleEventResponseImpl &&
            (identical(other.scheduleId, scheduleId) ||
                other.scheduleId == scheduleId) &&
            (identical(other.scheduleType, scheduleType) ||
                other.scheduleType == scheduleType) &&
            (identical(other.scheduleTitle, scheduleTitle) ||
                other.scheduleTitle == scheduleTitle) &&
            (identical(other.eventId, eventId) || other.eventId == eventId) &&
            (identical(other.isRecurring, isRecurring) ||
                other.isRecurring == isRecurring) &&
            (identical(other.isAllDay, isAllDay) ||
                other.isAllDay == isAllDay) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            const DeepCollectionEquality()
                .equals(other._recurrenceInstances, _recurrenceInstances) &&
            (identical(other.recurrence, recurrence) ||
                other.recurrence == recurrence) &&
            (identical(other.originalInstanceStartDate,
                    originalInstanceStartDate) ||
                other.originalInstanceStartDate == originalInstanceStartDate) &&
            (identical(
                    other.originalInstanceEndDate, originalInstanceEndDate) ||
                other.originalInstanceEndDate == originalInstanceEndDate) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.colorType, colorType) ||
                other.colorType == colorType) &&
            (identical(other.isScreenLockMode, isScreenLockMode) ||
                other.isScreenLockMode == isScreenLockMode) &&
            (identical(
                    other.notificationSettingType, notificationSettingType) ||
                other.notificationSettingType == notificationSettingType) &&
            const DeepCollectionEquality().equals(other._memo, _memo));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      scheduleId,
      scheduleType,
      scheduleTitle,
      eventId,
      isRecurring,
      isAllDay,
      createdAt,
      const DeepCollectionEquality().hash(_recurrenceInstances),
      recurrence,
      originalInstanceStartDate,
      originalInstanceEndDate,
      title,
      location,
      colorType,
      isScreenLockMode,
      notificationSettingType,
      const DeepCollectionEquality().hash(_memo));

  /// Create a copy of ScheduleEventResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ScheduleEventResponseImplCopyWith<_$ScheduleEventResponseImpl>
      get copyWith => __$$ScheduleEventResponseImplCopyWithImpl<
          _$ScheduleEventResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ScheduleEventResponseImplToJson(
      this,
    );
  }
}

abstract class _ScheduleEventResponse implements ScheduleEventResponse {
  const factory _ScheduleEventResponse(
      {required final int scheduleId,
      required final int scheduleType,
      required final String scheduleTitle,
      required final int eventId,
      required final bool isRecurring,
      required final bool isAllDay,
      required final String createdAt,
      final List<RecurrenceInstanceResponse> recurrenceInstances,
      final RecurrenceResponse? recurrence,
      required final String originalInstanceStartDate,
      required final String originalInstanceEndDate,
      required final String title,
      required final String location,
      required final int colorType,
      required final bool isScreenLockMode,
      required final int notificationSettingType,
      final List<MemoResponse> memo}) = _$ScheduleEventResponseImpl;

  factory _ScheduleEventResponse.fromJson(Map<String, dynamic> json) =
      _$ScheduleEventResponseImpl.fromJson;

  @override
  int get scheduleId;
  @override
  int get scheduleType;
  @override
  String get scheduleTitle;
  @override
  int get eventId;
  @override
  bool get isRecurring;
  @override
  bool get isAllDay;
  @override
  String get createdAt;
  @override
  List<RecurrenceInstanceResponse> get recurrenceInstances;
  @override
  RecurrenceResponse? get recurrence;
  @override
  String get originalInstanceStartDate;
  @override
  String get originalInstanceEndDate;
  @override
  String get title;
  @override
  String get location;
  @override
  int get colorType;
  @override
  bool get isScreenLockMode;
  @override
  int get notificationSettingType;
  @override
  List<MemoResponse> get memo;

  /// Create a copy of ScheduleEventResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ScheduleEventResponseImplCopyWith<_$ScheduleEventResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
