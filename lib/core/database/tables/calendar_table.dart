import 'package:drift/drift.dart';

class CalendarTable extends Table {
  late final id = integer().autoIncrement()();
  late final scheduleType = integer()();
  late final lexoRank = text()();
  late final title = text()();
  late final themeIndex = integer()();
  late final fontColor = text()();
  late final timeFormat = integer()();

  @override
  Set<Column<Object>> get primaryKey => {id, scheduleType};
}
