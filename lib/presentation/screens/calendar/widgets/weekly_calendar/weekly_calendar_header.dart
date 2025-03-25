import 'package:calendar_flutter/core/enums/day_of_the_week.dart';
import 'package:calendar_flutter/core/utils/date_time_util.dart';
import 'package:calendar_flutter/presentation/screens/calendar/widgets/weekly_calendar/event_list_dialog.dart';
import 'package:flutter/material.dart';
import 'package:calendar_flutter/domain/entities/schedule_event.dart';
import 'package:calendar_flutter/core/utils/color_util.dart';
import 'package:calendar_flutter/core/utils/text_style_util.dart';
import 'package:calendar_flutter/presentation/screens/calendar/widgets/weekly_calendar/calendar_all_day_event_tile.dart';

class WeeklyCalendarHeader extends StatefulWidget {
  final DateTime firstDayOfTheWeek;

  const WeeklyCalendarHeader({
    required this.firstDayOfTheWeek,
    super.key,
  });

  @override
  State<WeeklyCalendarHeader> createState() => _WeeklyCalendarHeaderState();
}

class _WeeklyCalendarHeaderState extends State<WeeklyCalendarHeader> {
  @override
  Widget build(BuildContext context) {
    final double timeColumnWidth = MediaQuery.sizeOf(context).width * 0.105;
    final double width =
        (MediaQuery.sizeOf(context).width - timeColumnWidth) / 7;

    // --- 종일 일정 필터링 (isAllDay == true)
    final allDayEvents = _testEvents.where((event) => event.isAllDay).toList();

    // --- 캘린더 시작 날짜 및 범위 설정
    final startDate = widget.firstDayOfTheWeek; // 첫 번째 요일로 시작 날짜 설정
    final endDate = startDate.add(Duration(days: 6)); // 시작일부터 7일 후

    // --- 캘린더 범위 내의 일정만 필터링
    final filteredEvents = allDayEvents.where((event) {
      return event.originalInstanceStartDate
              .isAfter(startDate.subtract(Duration(days: 1))) &&
          event.originalInstanceEndDate
              .isBefore(endDate.add(Duration(days: 1)));
    }).toList();

    // --- 종일 일정 정렬: 기간 길이에 따라 정렬 (긴 일정 -> 생성 순서)
    filteredEvents.sort((a, b) {
      final durationA = a.originalInstanceEndDate
          .difference(a.originalInstanceStartDate)
          .inDays;
      final durationB = b.originalInstanceEndDate
          .difference(b.originalInstanceStartDate)
          .inDays;
      if (durationA != durationB) return durationB.compareTo(durationA);
      return a.createdAt.compareTo(b.createdAt);
    });

    // --- 행 배치
    const int maxRows = 2;
    final List<List<ScheduleEvent>> rows = List.generate(maxRows, (_) => []);
    final List<List<ScheduleEvent>> overflowRow =
        List.generate(DayOfTheWeek.values.length, (_) => []);

    for (final event in filteredEvents) {
      bool placed = false;
      for (final row in rows) {
        if (row.isEmpty) {
          row.add(event);
          placed = true;
          break;
        }
        bool isOverlapping = false;
        for (final rowEvent in row) {
          isOverlapping = _isOverlapping(rowEvent, event);
          if (isOverlapping) break;
        }
        if (!isOverlapping) {
          row.add(event);
          placed = true;
          break;
        }
      }
      if (!placed) {
        final int weekday = event.originalInstanceStartDate.weekday % 7;
        overflowRow[weekday].add(event);
      }
    }

    return Column(
      children: [
        Table(
          border: TableBorder(),
          columnWidths: {0: FixedColumnWidth(timeColumnWidth)},
          children: [_buildDayOfTheWeekRow()],
        ),
        if (rows.any((row) => row.isNotEmpty))
          Container(
            height: 22.0 * rows.where((row) => row.isNotEmpty).length +
                (overflowRow.any((e) => e.isNotEmpty) ? 22.0 : 0.0) +
                4.0,
            decoration: BoxDecoration(
              color: AppPalette.grey100,
              border: Border.symmetric(
                horizontal: BorderSide(color: AppPalette.divider, width: 1),
              ),
            ),
            child: Stack(
              children: [
                // 종일 일정 표시
                for (int i = 0; i < rows.length; i++)
                  for (final event in rows[i])
                    Positioned(
                      left: timeColumnWidth +
                          width * (event.originalInstanceStartDate.weekday % 7),
                      top: 22.0 * i + 1.0,
                      width: width *
                          (event.originalInstanceEndDate.weekday -
                              event.originalInstanceStartDate.weekday +
                              1),
                      height: 22.0,
                      child: CalendarAllDayEventTile(
                        title: event.title,
                        colorType: event.colorType,
                      ),
                    ),

                // 오버플로우 표시 (각 요일 별로 표시) => '+${초과개수}' 표시
                if (overflowRow.any((e) => e.isNotEmpty))
                  for (int i = 0; i < DayOfTheWeek.values.length; i++)
                    if (overflowRow[i].isNotEmpty)
                      Positioned(
                        left: timeColumnWidth + width * i,
                        top: 22.0 * rows.length + 1.0,
                        width: width,
                        height: 22.0,
                        child: GestureDetector(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                final DateTime today = widget.firstDayOfTheWeek
                                    .add(Duration(days: i));

                                return EventListDialog(
                                    events: filteredEvents.where((event) {
                                  return !event.originalInstanceStartDate
                                          .isAfter(today) &&
                                      !event.originalInstanceEndDate
                                          .isBefore(today);
                                }).toList());
                              },
                            );
                          },
                          child: Text(
                            '+${overflowRow[i].length}',
                            style: AppTextStyles.style14Bold(),
                          ),
                        ),
                      ),
              ],
            ),
          ),
      ],
    );
  }

  TableRow _buildDayOfTheWeekRow() {
    return TableRow(
      decoration: BoxDecoration(color: AppPalette.bg01),
      children: List.generate(DayOfTheWeek.values.length + 1, (index) {
        if (index == 0) return TableCell(child: SizedBox.shrink());
        final DateTime date =
            widget.firstDayOfTheWeek.add(Duration(days: index - 1));
        final bool isToday = date.isToday;
        return TableCell(
          verticalAlignment: TableCellVerticalAlignment.middle,
          child: Container(
            padding: const EdgeInsets.only(top: 13.5, bottom: 10),
            color: AppPalette.bg01,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  DayOfTheWeek.values[date.weekday % 7].value,
                  style: AppTextStyles.style14Medium(),
                ),
                SizedBox(height: 10),
                Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    color:
                        isToday ? AppPalette.primary : AppPalette.transparent,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      date.day.toString(),
                      style: AppTextStyles.style16Bold(
                        color:
                            isToday ? AppPalette.grey100 : AppPalette.grey700,
                      ).copyWith(letterSpacing: -1),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }

  bool _isOverlapping(ScheduleEvent a, ScheduleEvent b) {
    return a.originalInstanceStartDate.isBefore(b.originalInstanceEndDate) &&
        a.originalInstanceEndDate.isAfter(b.originalInstanceStartDate);
  }

  final List<ScheduleEvent> _testEvents = [
    ScheduleEvent(
      scheduleId: 4,
      eventId: 4,
      createdAt: DateTime(2025, 3, 1, 15),
      isRecurring: false,
      isAllDay: true,
      originalInstanceStartDate: DateTime(2025, 3, 23, 0),
      originalInstanceEndDate: DateTime(2025, 3, 23, 23),
      title: '23 일정',
      location: '',
      colorType: 1,
      isScreenLockMode: false,
      notificationSettingType: 1,
    ),
    ScheduleEvent(
      scheduleId: 4,
      eventId: 4,
      createdAt: DateTime(2025, 3, 1, 15),
      isRecurring: false,
      isAllDay: true,
      originalInstanceStartDate: DateTime(2025, 3, 24, 0),
      originalInstanceEndDate: DateTime(2025, 3, 24, 23),
      title: '24 일정',
      location: '',
      colorType: 2,
      isScreenLockMode: false,
      notificationSettingType: 1,
    ),
    ScheduleEvent(
      scheduleId: 4,
      eventId: 4,
      createdAt: DateTime(2025, 3, 1, 15),
      isRecurring: false,
      isAllDay: true,
      originalInstanceStartDate: DateTime(2025, 3, 25, 0),
      originalInstanceEndDate: DateTime(2025, 3, 26, 23),
      title: '긴 일정',
      location: '',
      colorType: 3,
      isScreenLockMode: false,
      notificationSettingType: 1,
    ),
    ScheduleEvent(
      scheduleId: 4,
      eventId: 4,
      createdAt: DateTime(2025, 3, 1, 15),
      isRecurring: false,
      isAllDay: true,
      originalInstanceStartDate: DateTime(2025, 3, 26, 0),
      originalInstanceEndDate: DateTime(2025, 3, 26, 23),
      title: '26 일정',
      location: '',
      colorType: 4,
      isScreenLockMode: false,
      notificationSettingType: 1,
    ),
    ScheduleEvent(
      scheduleId: 4,
      eventId: 4,
      createdAt: DateTime(2025, 3, 1, 15),
      isRecurring: false,
      isAllDay: true,
      originalInstanceStartDate: DateTime(2025, 3, 26, 0),
      originalInstanceEndDate: DateTime(2025, 3, 26, 23),
      title: '26 일정',
      location: '',
      colorType: 5,
      isScreenLockMode: false,
      notificationSettingType: 1,
    ),
    ScheduleEvent(
      scheduleId: 4,
      eventId: 4,
      createdAt: DateTime(2025, 3, 1, 15),
      isRecurring: false,
      isAllDay: true,
      originalInstanceStartDate: DateTime(2025, 3, 26, 0),
      originalInstanceEndDate: DateTime(2025, 3, 26, 23),
      title: '26 일정',
      location: '',
      colorType: 6,
      isScreenLockMode: false,
      notificationSettingType: 1,
    ),
    ScheduleEvent(
      scheduleId: 4,
      eventId: 4,
      createdAt: DateTime(2025, 3, 1, 15),
      isRecurring: false,
      isAllDay: true,
      originalInstanceStartDate: DateTime(2025, 3, 25, 0),
      originalInstanceEndDate: DateTime(2025, 3, 25, 23),
      title: '27 일정',
      location: '',
      colorType: 6,
      isScreenLockMode: false,
      notificationSettingType: 1,
    ),
    ScheduleEvent(
      scheduleId: 4,
      eventId: 4,
      createdAt: DateTime(2025, 3, 1, 15),
      isRecurring: false,
      isAllDay: true,
      originalInstanceStartDate: DateTime(2025, 3, 25, 0),
      originalInstanceEndDate: DateTime(2025, 3, 25, 23),
      title: '27 일정',
      location: '',
      colorType: 6,
      isScreenLockMode: false,
      notificationSettingType: 1,
    ),
  ];
}
