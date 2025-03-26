import 'package:calendar_flutter/core/enums/day_of_the_week.dart';
import 'package:calendar_flutter/core/utils/color_util.dart';
import 'package:calendar_flutter/core/utils/date_time_util.dart';
import 'package:calendar_flutter/core/utils/schedule_event_util.dart';
import 'package:calendar_flutter/core/utils/text_style_util.dart';
import 'package:calendar_flutter/domain/entities/calendar.dart';
import 'package:calendar_flutter/domain/entities/schedule_event.dart';
import 'package:calendar_flutter/presentation/screens/calendar/widgets/weekly_calendar/current_time_divider_overlay.dart';
import 'package:calendar_flutter/presentation/screens/calendar/widgets/weekly_calendar/weekly_calendar_event_overlay.dart';
import 'package:calendar_flutter/presentation/screens/calendar/widgets/weekly_calendar/weekly_calendar_select_overlay.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class WeeklyCalendarBody extends ConsumerStatefulWidget {
  final Calendar? currentCalendar;
  final DateTime firstDayOfTheWeek;
  final DateTime? startTime;
  final DateTime? endTime;
  final Function(DateTime? startTime, DateTime? endTime) onSelectionChanged;

  const WeeklyCalendarBody({
    required this.currentCalendar,
    required this.firstDayOfTheWeek,
    required this.startTime,
    required this.endTime,
    required this.onSelectionChanged,
    super.key,
  });

  @override
  ConsumerState<WeeklyCalendarBody> createState() => _WeeklyCalendarBodyState();
}

class _WeeklyCalendarBodyState extends ConsumerState<WeeklyCalendarBody> {
  PersistentBottomSheetController? _bottomSheetController;
  DateTime? _startTime;

  @override
  void dispose() {
    _bottomSheetController?.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double timeColumnWidth = MediaQuery.sizeOf(context).width * 0.105;
    final List<ScheduleEvent> events = _testEvents;
    final List<List<ScheduleEvent>> eventGroups = events.groupEvents();

    return Stack(
      children: [
        Table(
          border: TableBorder.symmetric(
            inside: BorderSide(color: AppPalette.divider, width: 1),
          ),
          columnWidths: {0: FixedColumnWidth(timeColumnWidth)},
          children: buildTimelineRows(timeColumnWidth),
        ),
        Positioned.fill(
          child: Stack(
            children: [
              ...eventGroups.map(
                (eventGroup) => WeeklyCalendarEventOverlay(
                  eventGroup: eventGroup,
                  firstDayOfWeek: widget.firstDayOfTheWeek,
                ),
              ),
              WeeklyCalendarSelectOverlay(
                startTime: _startTime,
                firstDayOfWeek: widget.firstDayOfTheWeek,
                onSelectionChanged: widget.onSelectionChanged,
              ),
            ],
          ),
        ),
        if (widget.firstDayOfTheWeek
            .isSameDay(DateTime.now().firstDayOfTheWeek))
          CurrentTimeDividerOverlay(),
      ],
    );
  }

  List<TableRow> buildTimelineRows(double timeColumnWidth) {
    return List.generate(24, (hour) {
      return TableRow(
        decoration: BoxDecoration(color: AppPalette.grey100),
        children: List.generate(DayOfTheWeek.values.length + 1, (index) {
          if (index == 0) {
            return Container(
              height: 70,
              padding: const EdgeInsets.only(top: 2, right: 2),
              child: Align(
                alignment: Alignment.topRight,
                child: Text(
                  hour.toString(),
                  style: AppTextStyles.style14Medium(),
                ),
              ),
            );
          }
          return SizedBox(height: 70);
        }),
      );
    });
  }

  static final List<ScheduleEvent> _testEvents = [
    ScheduleEvent(
      scheduleId: 4,
      eventId: 4,
      createdAt: DateTime(2025, 3, 1, 15),
      isRecurring: false,
      isAllDay: false,
      originalInstanceStartDate: DateTime(2025, 3, 23, 13),
      originalInstanceEndDate: DateTime(2025, 3, 23, 15),
      title: '테스트 일정',
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
      isAllDay: false,
      originalInstanceStartDate: DateTime(2025, 3, 23, 14),
      originalInstanceEndDate: DateTime(2025, 3, 23, 15),
      title: '테스트 일정',
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
      isAllDay: false,
      originalInstanceStartDate: DateTime(2025, 3, 23, 13),
      originalInstanceEndDate: DateTime(2025, 3, 23, 14),
      title: '테스트 일정',
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
      isAllDay: false,
      originalInstanceStartDate: DateTime(2025, 3, 23, 13),
      originalInstanceEndDate: DateTime(2025, 3, 23, 14),
      title: '테스트 일정',
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
      isAllDay: false,
      originalInstanceStartDate: DateTime(2025, 3, 23, 14),
      originalInstanceEndDate: DateTime(2025, 3, 23, 15),
      title: '테스트 일정',
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
      isAllDay: false,
      originalInstanceStartDate: DateTime(2025, 3, 26, 13),
      originalInstanceEndDate: DateTime(2025, 3, 26, 15),
      title: '테스트 일정',
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
      isAllDay: false,
      originalInstanceStartDate: DateTime(2025, 3, 26, 14),
      originalInstanceEndDate: DateTime(2025, 3, 26, 15),
      title: '테스트 일정',
      location: '',
      colorType: 7,
      isScreenLockMode: false,
      notificationSettingType: 1,
    ),
    ScheduleEvent(
      scheduleId: 4,
      eventId: 4,
      createdAt: DateTime(2025, 3, 1, 15),
      isRecurring: false,
      isAllDay: false,
      originalInstanceStartDate: DateTime(2025, 3, 26, 13),
      originalInstanceEndDate: DateTime(2025, 3, 26, 14),
      title: '테스트 일정',
      location: '',
      colorType: 8,
      isScreenLockMode: false,
      notificationSettingType: 1,
    ),
    ScheduleEvent(
      scheduleId: 4,
      eventId: 4,
      createdAt: DateTime(2025, 3, 1, 15),
      isRecurring: false,
      isAllDay: false,
      originalInstanceStartDate: DateTime(2025, 3, 26, 13),
      originalInstanceEndDate: DateTime(2025, 3, 26, 14),
      title: '테스트 일정',
      location: '',
      colorType: 9,
      isScreenLockMode: false,
      notificationSettingType: 1,
    ),
    ScheduleEvent(
      scheduleId: 4,
      eventId: 4,
      createdAt: DateTime(2025, 3, 1, 15),
      isRecurring: false,
      isAllDay: false,
      originalInstanceStartDate: DateTime(2025, 3, 26, 14),
      originalInstanceEndDate: DateTime(2025, 3, 26, 15),
      title: '테스트 일정',
      location: '',
      colorType: 10,
      isScreenLockMode: false,
      notificationSettingType: 1,
    ),
  ];
}
