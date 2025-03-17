import 'package:calendar_flutter/core/database/database.dart';
import 'package:calendar_flutter/domain/entities/calendar.dart';
import 'package:drift/drift.dart';

part 'local_datasource.g.dart';

abstract interface class CalendarSettingDatasource {
  Future<List<CalendarSettingTableData>> getCalendarSetting(Calendar calendar);
}

@DriftAccessor(tables: [CalendarSettingTable])
class CalendarSettingDatasourceImpl extends DatabaseAccessor<AppDatabase>
    with _$CalendarSettingDatasourceImplMixin
    implements CalendarSettingDatasource {
  CalendarSettingDatasourceImpl(super.db);

  @override
  Future<List<CalendarSettingTableData>> getCalendarSetting(Calendar calendar) {
    return (select(calendarSettingTable)
          ..where((t) => t.id.equals(calendar.id)))
        .get();
  }
}
