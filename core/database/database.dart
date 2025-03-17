import 'package:calendar_flutter/core/constants/database_constants.dart';
import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:path_provider/path_provider.dart';

part 'database.g.dart';

class CalendarSettingTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get themeIndex => integer()();
  TextColumn get fontColor => text()();
  IntColumn get timeFormat => integer()();
}

@DriftDatabase(tables: [CalendarSettingTable])
class AppDatabase extends _$AppDatabase {
  AppDatabase([QueryExecutor? executor]) : super(executor ?? _openConnection());

  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection() {
    return driftDatabase(
      name: DatabaseConstants.databaseName,
      native: const DriftNativeOptions(
        databaseDirectory: getApplicationSupportDirectory,
      ),
    );
  }
}
