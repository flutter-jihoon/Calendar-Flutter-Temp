// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $CalendarTableTable extends CalendarTable
    with TableInfo<$CalendarTableTable, CalendarTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CalendarTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _scheduleTypeMeta =
      const VerificationMeta('scheduleType');
  @override
  late final GeneratedColumn<int> scheduleType = GeneratedColumn<int>(
      'schedule_type', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _lexoRankMeta =
      const VerificationMeta('lexoRank');
  @override
  late final GeneratedColumn<String> lexoRank = GeneratedColumn<String>(
      'lexo_rank', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
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
  List<GeneratedColumn> get $columns =>
      [id, scheduleType, lexoRank, title, themeIndex, fontColor, timeFormat];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'calendar_table';
  @override
  VerificationContext validateIntegrity(Insertable<CalendarTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('schedule_type')) {
      context.handle(
          _scheduleTypeMeta,
          scheduleType.isAcceptableOrUnknown(
              data['schedule_type']!, _scheduleTypeMeta));
    } else if (isInserting) {
      context.missing(_scheduleTypeMeta);
    }
    if (data.containsKey('lexo_rank')) {
      context.handle(_lexoRankMeta,
          lexoRank.isAcceptableOrUnknown(data['lexo_rank']!, _lexoRankMeta));
    } else if (isInserting) {
      context.missing(_lexoRankMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
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
  Set<GeneratedColumn> get $primaryKey => {id, scheduleType};
  @override
  CalendarTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CalendarTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      scheduleType: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}schedule_type'])!,
      lexoRank: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}lexo_rank'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      themeIndex: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}theme_index'])!,
      fontColor: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}font_color'])!,
      timeFormat: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}time_format'])!,
    );
  }

  @override
  $CalendarTableTable createAlias(String alias) {
    return $CalendarTableTable(attachedDatabase, alias);
  }
}

class CalendarTableData extends DataClass
    implements Insertable<CalendarTableData> {
  final int id;
  final int scheduleType;
  final String lexoRank;
  final String title;
  final int themeIndex;
  final String fontColor;
  final int timeFormat;
  const CalendarTableData(
      {required this.id,
      required this.scheduleType,
      required this.lexoRank,
      required this.title,
      required this.themeIndex,
      required this.fontColor,
      required this.timeFormat});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['schedule_type'] = Variable<int>(scheduleType);
    map['lexo_rank'] = Variable<String>(lexoRank);
    map['title'] = Variable<String>(title);
    map['theme_index'] = Variable<int>(themeIndex);
    map['font_color'] = Variable<String>(fontColor);
    map['time_format'] = Variable<int>(timeFormat);
    return map;
  }

  CalendarTableCompanion toCompanion(bool nullToAbsent) {
    return CalendarTableCompanion(
      id: Value(id),
      scheduleType: Value(scheduleType),
      lexoRank: Value(lexoRank),
      title: Value(title),
      themeIndex: Value(themeIndex),
      fontColor: Value(fontColor),
      timeFormat: Value(timeFormat),
    );
  }

  factory CalendarTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CalendarTableData(
      id: serializer.fromJson<int>(json['id']),
      scheduleType: serializer.fromJson<int>(json['scheduleType']),
      lexoRank: serializer.fromJson<String>(json['lexoRank']),
      title: serializer.fromJson<String>(json['title']),
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
      'scheduleType': serializer.toJson<int>(scheduleType),
      'lexoRank': serializer.toJson<String>(lexoRank),
      'title': serializer.toJson<String>(title),
      'themeIndex': serializer.toJson<int>(themeIndex),
      'fontColor': serializer.toJson<String>(fontColor),
      'timeFormat': serializer.toJson<int>(timeFormat),
    };
  }

  CalendarTableData copyWith(
          {int? id,
          int? scheduleType,
          String? lexoRank,
          String? title,
          int? themeIndex,
          String? fontColor,
          int? timeFormat}) =>
      CalendarTableData(
        id: id ?? this.id,
        scheduleType: scheduleType ?? this.scheduleType,
        lexoRank: lexoRank ?? this.lexoRank,
        title: title ?? this.title,
        themeIndex: themeIndex ?? this.themeIndex,
        fontColor: fontColor ?? this.fontColor,
        timeFormat: timeFormat ?? this.timeFormat,
      );
  CalendarTableData copyWithCompanion(CalendarTableCompanion data) {
    return CalendarTableData(
      id: data.id.present ? data.id.value : this.id,
      scheduleType: data.scheduleType.present
          ? data.scheduleType.value
          : this.scheduleType,
      lexoRank: data.lexoRank.present ? data.lexoRank.value : this.lexoRank,
      title: data.title.present ? data.title.value : this.title,
      themeIndex:
          data.themeIndex.present ? data.themeIndex.value : this.themeIndex,
      fontColor: data.fontColor.present ? data.fontColor.value : this.fontColor,
      timeFormat:
          data.timeFormat.present ? data.timeFormat.value : this.timeFormat,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CalendarTableData(')
          ..write('id: $id, ')
          ..write('scheduleType: $scheduleType, ')
          ..write('lexoRank: $lexoRank, ')
          ..write('title: $title, ')
          ..write('themeIndex: $themeIndex, ')
          ..write('fontColor: $fontColor, ')
          ..write('timeFormat: $timeFormat')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, scheduleType, lexoRank, title, themeIndex, fontColor, timeFormat);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CalendarTableData &&
          other.id == this.id &&
          other.scheduleType == this.scheduleType &&
          other.lexoRank == this.lexoRank &&
          other.title == this.title &&
          other.themeIndex == this.themeIndex &&
          other.fontColor == this.fontColor &&
          other.timeFormat == this.timeFormat);
}

class CalendarTableCompanion extends UpdateCompanion<CalendarTableData> {
  final Value<int> id;
  final Value<int> scheduleType;
  final Value<String> lexoRank;
  final Value<String> title;
  final Value<int> themeIndex;
  final Value<String> fontColor;
  final Value<int> timeFormat;
  final Value<int> rowid;
  const CalendarTableCompanion({
    this.id = const Value.absent(),
    this.scheduleType = const Value.absent(),
    this.lexoRank = const Value.absent(),
    this.title = const Value.absent(),
    this.themeIndex = const Value.absent(),
    this.fontColor = const Value.absent(),
    this.timeFormat = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CalendarTableCompanion.insert({
    required int id,
    required int scheduleType,
    required String lexoRank,
    required String title,
    required int themeIndex,
    required String fontColor,
    required int timeFormat,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        scheduleType = Value(scheduleType),
        lexoRank = Value(lexoRank),
        title = Value(title),
        themeIndex = Value(themeIndex),
        fontColor = Value(fontColor),
        timeFormat = Value(timeFormat);
  static Insertable<CalendarTableData> custom({
    Expression<int>? id,
    Expression<int>? scheduleType,
    Expression<String>? lexoRank,
    Expression<String>? title,
    Expression<int>? themeIndex,
    Expression<String>? fontColor,
    Expression<int>? timeFormat,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (scheduleType != null) 'schedule_type': scheduleType,
      if (lexoRank != null) 'lexo_rank': lexoRank,
      if (title != null) 'title': title,
      if (themeIndex != null) 'theme_index': themeIndex,
      if (fontColor != null) 'font_color': fontColor,
      if (timeFormat != null) 'time_format': timeFormat,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CalendarTableCompanion copyWith(
      {Value<int>? id,
      Value<int>? scheduleType,
      Value<String>? lexoRank,
      Value<String>? title,
      Value<int>? themeIndex,
      Value<String>? fontColor,
      Value<int>? timeFormat,
      Value<int>? rowid}) {
    return CalendarTableCompanion(
      id: id ?? this.id,
      scheduleType: scheduleType ?? this.scheduleType,
      lexoRank: lexoRank ?? this.lexoRank,
      title: title ?? this.title,
      themeIndex: themeIndex ?? this.themeIndex,
      fontColor: fontColor ?? this.fontColor,
      timeFormat: timeFormat ?? this.timeFormat,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (scheduleType.present) {
      map['schedule_type'] = Variable<int>(scheduleType.value);
    }
    if (lexoRank.present) {
      map['lexo_rank'] = Variable<String>(lexoRank.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
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
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CalendarTableCompanion(')
          ..write('id: $id, ')
          ..write('scheduleType: $scheduleType, ')
          ..write('lexoRank: $lexoRank, ')
          ..write('title: $title, ')
          ..write('themeIndex: $themeIndex, ')
          ..write('fontColor: $fontColor, ')
          ..write('timeFormat: $timeFormat, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $CalendarTableTable calendarTable = $CalendarTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [calendarTable];
}

typedef $$CalendarTableTableCreateCompanionBuilder = CalendarTableCompanion
    Function({
  required int id,
  required int scheduleType,
  required String lexoRank,
  required String title,
  required int themeIndex,
  required String fontColor,
  required int timeFormat,
  Value<int> rowid,
});
typedef $$CalendarTableTableUpdateCompanionBuilder = CalendarTableCompanion
    Function({
  Value<int> id,
  Value<int> scheduleType,
  Value<String> lexoRank,
  Value<String> title,
  Value<int> themeIndex,
  Value<String> fontColor,
  Value<int> timeFormat,
  Value<int> rowid,
});

class $$CalendarTableTableFilterComposer
    extends Composer<_$AppDatabase, $CalendarTableTable> {
  $$CalendarTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get scheduleType => $composableBuilder(
      column: $table.scheduleType, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get lexoRank => $composableBuilder(
      column: $table.lexoRank, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get themeIndex => $composableBuilder(
      column: $table.themeIndex, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get fontColor => $composableBuilder(
      column: $table.fontColor, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get timeFormat => $composableBuilder(
      column: $table.timeFormat, builder: (column) => ColumnFilters(column));
}

class $$CalendarTableTableOrderingComposer
    extends Composer<_$AppDatabase, $CalendarTableTable> {
  $$CalendarTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get scheduleType => $composableBuilder(
      column: $table.scheduleType,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get lexoRank => $composableBuilder(
      column: $table.lexoRank, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get themeIndex => $composableBuilder(
      column: $table.themeIndex, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get fontColor => $composableBuilder(
      column: $table.fontColor, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get timeFormat => $composableBuilder(
      column: $table.timeFormat, builder: (column) => ColumnOrderings(column));
}

class $$CalendarTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $CalendarTableTable> {
  $$CalendarTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get scheduleType => $composableBuilder(
      column: $table.scheduleType, builder: (column) => column);

  GeneratedColumn<String> get lexoRank =>
      $composableBuilder(column: $table.lexoRank, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<int> get themeIndex => $composableBuilder(
      column: $table.themeIndex, builder: (column) => column);

  GeneratedColumn<String> get fontColor =>
      $composableBuilder(column: $table.fontColor, builder: (column) => column);

  GeneratedColumn<int> get timeFormat => $composableBuilder(
      column: $table.timeFormat, builder: (column) => column);
}

class $$CalendarTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $CalendarTableTable,
    CalendarTableData,
    $$CalendarTableTableFilterComposer,
    $$CalendarTableTableOrderingComposer,
    $$CalendarTableTableAnnotationComposer,
    $$CalendarTableTableCreateCompanionBuilder,
    $$CalendarTableTableUpdateCompanionBuilder,
    (
      CalendarTableData,
      BaseReferences<_$AppDatabase, $CalendarTableTable, CalendarTableData>
    ),
    CalendarTableData,
    PrefetchHooks Function()> {
  $$CalendarTableTableTableManager(_$AppDatabase db, $CalendarTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CalendarTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CalendarTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CalendarTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> scheduleType = const Value.absent(),
            Value<String> lexoRank = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<int> themeIndex = const Value.absent(),
            Value<String> fontColor = const Value.absent(),
            Value<int> timeFormat = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              CalendarTableCompanion(
            id: id,
            scheduleType: scheduleType,
            lexoRank: lexoRank,
            title: title,
            themeIndex: themeIndex,
            fontColor: fontColor,
            timeFormat: timeFormat,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required int id,
            required int scheduleType,
            required String lexoRank,
            required String title,
            required int themeIndex,
            required String fontColor,
            required int timeFormat,
            Value<int> rowid = const Value.absent(),
          }) =>
              CalendarTableCompanion.insert(
            id: id,
            scheduleType: scheduleType,
            lexoRank: lexoRank,
            title: title,
            themeIndex: themeIndex,
            fontColor: fontColor,
            timeFormat: timeFormat,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$CalendarTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $CalendarTableTable,
    CalendarTableData,
    $$CalendarTableTableFilterComposer,
    $$CalendarTableTableOrderingComposer,
    $$CalendarTableTableAnnotationComposer,
    $$CalendarTableTableCreateCompanionBuilder,
    $$CalendarTableTableUpdateCompanionBuilder,
    (
      CalendarTableData,
      BaseReferences<_$AppDatabase, $CalendarTableTable, CalendarTableData>
    ),
    CalendarTableData,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$CalendarTableTableTableManager get calendarTable =>
      $$CalendarTableTableTableManager(_db, _db.calendarTable);
}
