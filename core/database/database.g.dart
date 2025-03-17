// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $CalendarSettingTableTable extends CalendarSettingTable
    with TableInfo<$CalendarSettingTableTable, CalendarSettingTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CalendarSettingTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _themeIndexMeta =
      const VerificationMeta('themeIndex');
  @override
  late final GeneratedColumn<int> themeIndex = GeneratedColumn<int>(
      'theme_index', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _fontColorMeta =
      const VerificationMeta('fontColor');
  @override
  late final GeneratedColumn<String> fontColor = GeneratedColumn<String>(
      'font_color', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _timeFormatMeta =
      const VerificationMeta('timeFormat');
  @override
  late final GeneratedColumn<int> timeFormat = GeneratedColumn<int>(
      'time_format', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, themeIndex, fontColor, timeFormat];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'calendar_setting_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<CalendarSettingTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('theme_index')) {
      context.handle(
          _themeIndexMeta,
          themeIndex.isAcceptableOrUnknown(
              data['theme_index']!, _themeIndexMeta));
    } else if (isInserting) {
      context.missing(_themeIndexMeta);
    }
    if (data.containsKey('font_color')) {
      context.handle(_fontColorMeta,
          fontColor.isAcceptableOrUnknown(data['font_color']!, _fontColorMeta));
    } else if (isInserting) {
      context.missing(_fontColorMeta);
    }
    if (data.containsKey('time_format')) {
      context.handle(
          _timeFormatMeta,
          timeFormat.isAcceptableOrUnknown(
              data['time_format']!, _timeFormatMeta));
    } else if (isInserting) {
      context.missing(_timeFormatMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CalendarSettingTableData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CalendarSettingTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      themeIndex: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}theme_index'])!,
      fontColor: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}font_color'])!,
      timeFormat: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}time_format'])!,
    );
  }

  @override
  $CalendarSettingTableTable createAlias(String alias) {
    return $CalendarSettingTableTable(attachedDatabase, alias);
  }
}

class CalendarSettingTableData extends DataClass
    implements Insertable<CalendarSettingTableData> {
  final int id;
  final int themeIndex;
  final String fontColor;
  final int timeFormat;
  const CalendarSettingTableData(
      {required this.id,
      required this.themeIndex,
      required this.fontColor,
      required this.timeFormat});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['theme_index'] = Variable<int>(themeIndex);
    map['font_color'] = Variable<String>(fontColor);
    map['time_format'] = Variable<int>(timeFormat);
    return map;
  }

  CalendarSettingTableCompanion toCompanion(bool nullToAbsent) {
    return CalendarSettingTableCompanion(
      id: Value(id),
      themeIndex: Value(themeIndex),
      fontColor: Value(fontColor),
      timeFormat: Value(timeFormat),
    );
  }

  factory CalendarSettingTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CalendarSettingTableData(
      id: serializer.fromJson<int>(json['id']),
      themeIndex: serializer.fromJson<int>(json['themeIndex']),
      fontColor: serializer.fromJson<String>(json['fontColor']),
      timeFormat: serializer.fromJson<int>(json['timeFormat']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'themeIndex': serializer.toJson<int>(themeIndex),
      'fontColor': serializer.toJson<String>(fontColor),
      'timeFormat': serializer.toJson<int>(timeFormat),
    };
  }

  CalendarSettingTableData copyWith(
          {int? id, int? themeIndex, String? fontColor, int? timeFormat}) =>
      CalendarSettingTableData(
        id: id ?? this.id,
        themeIndex: themeIndex ?? this.themeIndex,
        fontColor: fontColor ?? this.fontColor,
        timeFormat: timeFormat ?? this.timeFormat,
      );
  CalendarSettingTableData copyWithCompanion(
      CalendarSettingTableCompanion data) {
    return CalendarSettingTableData(
      id: data.id.present ? data.id.value : this.id,
      themeIndex:
          data.themeIndex.present ? data.themeIndex.value : this.themeIndex,
      fontColor: data.fontColor.present ? data.fontColor.value : this.fontColor,
      timeFormat:
          data.timeFormat.present ? data.timeFormat.value : this.timeFormat,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CalendarSettingTableData(')
          ..write('id: $id, ')
          ..write('themeIndex: $themeIndex, ')
          ..write('fontColor: $fontColor, ')
          ..write('timeFormat: $timeFormat')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, themeIndex, fontColor, timeFormat);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CalendarSettingTableData &&
          other.id == this.id &&
          other.themeIndex == this.themeIndex &&
          other.fontColor == this.fontColor &&
          other.timeFormat == this.timeFormat);
}

class CalendarSettingTableCompanion
    extends UpdateCompanion<CalendarSettingTableData> {
  final Value<int> id;
  final Value<int> themeIndex;
  final Value<String> fontColor;
  final Value<int> timeFormat;
  const CalendarSettingTableCompanion({
    this.id = const Value.absent(),
    this.themeIndex = const Value.absent(),
    this.fontColor = const Value.absent(),
    this.timeFormat = const Value.absent(),
  });
  CalendarSettingTableCompanion.insert({
    this.id = const Value.absent(),
    required int themeIndex,
    required String fontColor,
    required int timeFormat,
  })  : themeIndex = Value(themeIndex),
        fontColor = Value(fontColor),
        timeFormat = Value(timeFormat);
  static Insertable<CalendarSettingTableData> custom({
    Expression<int>? id,
    Expression<int>? themeIndex,
    Expression<String>? fontColor,
    Expression<int>? timeFormat,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (themeIndex != null) 'theme_index': themeIndex,
      if (fontColor != null) 'font_color': fontColor,
      if (timeFormat != null) 'time_format': timeFormat,
    });
  }

  CalendarSettingTableCompanion copyWith(
      {Value<int>? id,
      Value<int>? themeIndex,
      Value<String>? fontColor,
      Value<int>? timeFormat}) {
    return CalendarSettingTableCompanion(
      id: id ?? this.id,
      themeIndex: themeIndex ?? this.themeIndex,
      fontColor: fontColor ?? this.fontColor,
      timeFormat: timeFormat ?? this.timeFormat,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (themeIndex.present) {
      map['theme_index'] = Variable<int>(themeIndex.value);
    }
    if (fontColor.present) {
      map['font_color'] = Variable<String>(fontColor.value);
    }
    if (timeFormat.present) {
      map['time_format'] = Variable<int>(timeFormat.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CalendarSettingTableCompanion(')
          ..write('id: $id, ')
          ..write('themeIndex: $themeIndex, ')
          ..write('fontColor: $fontColor, ')
          ..write('timeFormat: $timeFormat')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $CalendarSettingTableTable calendarSettingTable =
      $CalendarSettingTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [calendarSettingTable];
}

typedef $$CalendarSettingTableTableCreateCompanionBuilder
    = CalendarSettingTableCompanion Function({
  Value<int> id,
  required int themeIndex,
  required String fontColor,
  required int timeFormat,
});
typedef $$CalendarSettingTableTableUpdateCompanionBuilder
    = CalendarSettingTableCompanion Function({
  Value<int> id,
  Value<int> themeIndex,
  Value<String> fontColor,
  Value<int> timeFormat,
});

class $$CalendarSettingTableTableFilterComposer
    extends Composer<_$AppDatabase, $CalendarSettingTableTable> {
  $$CalendarSettingTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get themeIndex => $composableBuilder(
      column: $table.themeIndex, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get fontColor => $composableBuilder(
      column: $table.fontColor, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get timeFormat => $composableBuilder(
      column: $table.timeFormat, builder: (column) => ColumnFilters(column));
}

class $$CalendarSettingTableTableOrderingComposer
    extends Composer<_$AppDatabase, $CalendarSettingTableTable> {
  $$CalendarSettingTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get themeIndex => $composableBuilder(
      column: $table.themeIndex, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get fontColor => $composableBuilder(
      column: $table.fontColor, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get timeFormat => $composableBuilder(
      column: $table.timeFormat, builder: (column) => ColumnOrderings(column));
}

class $$CalendarSettingTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $CalendarSettingTableTable> {
  $$CalendarSettingTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get themeIndex => $composableBuilder(
      column: $table.themeIndex, builder: (column) => column);

  GeneratedColumn<String> get fontColor =>
      $composableBuilder(column: $table.fontColor, builder: (column) => column);

  GeneratedColumn<int> get timeFormat => $composableBuilder(
      column: $table.timeFormat, builder: (column) => column);
}

class $$CalendarSettingTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $CalendarSettingTableTable,
    CalendarSettingTableData,
    $$CalendarSettingTableTableFilterComposer,
    $$CalendarSettingTableTableOrderingComposer,
    $$CalendarSettingTableTableAnnotationComposer,
    $$CalendarSettingTableTableCreateCompanionBuilder,
    $$CalendarSettingTableTableUpdateCompanionBuilder,
    (
      CalendarSettingTableData,
      BaseReferences<_$AppDatabase, $CalendarSettingTableTable,
          CalendarSettingTableData>
    ),
    CalendarSettingTableData,
    PrefetchHooks Function()> {
  $$CalendarSettingTableTableTableManager(
      _$AppDatabase db, $CalendarSettingTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CalendarSettingTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CalendarSettingTableTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CalendarSettingTableTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> themeIndex = const Value.absent(),
            Value<String> fontColor = const Value.absent(),
            Value<int> timeFormat = const Value.absent(),
          }) =>
              CalendarSettingTableCompanion(
            id: id,
            themeIndex: themeIndex,
            fontColor: fontColor,
            timeFormat: timeFormat,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int themeIndex,
            required String fontColor,
            required int timeFormat,
          }) =>
              CalendarSettingTableCompanion.insert(
            id: id,
            themeIndex: themeIndex,
            fontColor: fontColor,
            timeFormat: timeFormat,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$CalendarSettingTableTableProcessedTableManager
    = ProcessedTableManager<
        _$AppDatabase,
        $CalendarSettingTableTable,
        CalendarSettingTableData,
        $$CalendarSettingTableTableFilterComposer,
        $$CalendarSettingTableTableOrderingComposer,
        $$CalendarSettingTableTableAnnotationComposer,
        $$CalendarSettingTableTableCreateCompanionBuilder,
        $$CalendarSettingTableTableUpdateCompanionBuilder,
        (
          CalendarSettingTableData,
          BaseReferences<_$AppDatabase, $CalendarSettingTableTable,
              CalendarSettingTableData>
        ),
        CalendarSettingTableData,
        PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$CalendarSettingTableTableTableManager get calendarSettingTable =>
      $$CalendarSettingTableTableTableManager(_db, _db.calendarSettingTable);
}
