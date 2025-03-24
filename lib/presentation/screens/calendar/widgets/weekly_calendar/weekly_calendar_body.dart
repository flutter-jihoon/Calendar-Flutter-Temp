import 'package:calendar_flutter/core/enums/day_of_the_week.dart';
import 'package:calendar_flutter/core/utils/color_util.dart';
import 'package:calendar_flutter/core/utils/date_time_util.dart';
import 'package:calendar_flutter/core/utils/log_util.dart';
import 'package:calendar_flutter/core/utils/schedule_event_util.dart';
import 'package:calendar_flutter/core/utils/text_style_util.dart';
import 'package:calendar_flutter/domain/entities/calendar.dart';
import 'package:calendar_flutter/domain/entities/schedule_event.dart';
import 'package:calendar_flutter/presentation/screens/calendar/widgets/add_event_bottom_sheet.dart';
import 'package:calendar_flutter/presentation/screens/calendar/widgets/weekly_calendar/current_time_divider_overlay.dart';
import 'package:calendar_flutter/presentation/screens/calendar/widgets/weekly_calendar/weekly_calendar_event_overlay.dart';
import 'package:calendar_flutter/presentation/screens/calendar/widgets/weekly_calendar/weekly_calendar_select_overlay.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class WeeklyCalendarBody extends ConsumerStatefulWidget {
  final Calendar? currentCalendar;
  final DateTime firstDayOfTheWeek;

  const WeeklyCalendarBody({
    required this.currentCalendar,
    required this.firstDayOfTheWeek,
    super.key,
  });

  @override
  ConsumerState<WeeklyCalendarBody> createState() => _WeeklyCalendarBodyState();
}

class _WeeklyCalendarBodyState extends ConsumerState<WeeklyCalendarBody> {
  DayOfTheWeek? _selectedDayOfWeek;
  int? _selectedStartHour;
  int? _selectedEndHour;

  PersistentBottomSheetController? _bottomSheetController;
  // final (int? startTime, int? endTime) _selectedTimeRange = (null, null);

  @override
  void initState() {
    super.initState();
  }

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
        ...eventGroups.map(
          (eventGroup) => WeeklyCalendarEventOverlay(
            eventGroup: eventGroup,
            firstDayOfWeek: widget.firstDayOfTheWeek,
          ),
        ),
        WeeklyCalendarSelectOverlay(
          selectedDayOfWeek: _selectedDayOfWeek,
          selectedStartHour: _selectedStartHour,
          selectedEndHour: _selectedEndHour,
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
          return Stack(
            children: [
              GestureDetector(
                onTap: () {
                  logger.i('탭 가능');
                  setState(() {
                    _selectedDayOfWeek = DayOfTheWeek.values[index - 1];
                    _selectedStartHour = hour;
                    _selectedEndHour = hour + 1; // Default duration is 1 hour
                  });
                  _bottomSheetController = showBottomSheet(
                    context: context,
                    builder: (context) => AddEventBottomSheet(
                        // TODO: 시작, 끝 날짜 파라미터 추가
                        ),
                  );
                },
                child: Container(
                  width: MediaQuery.sizeOf(context).width, // 적절한 크기 설정
                  height: 70, // 적절한 높이 설정
                  color: Colors.transparent, // 터치 이벤트만 받도록 설정
                ),
              ),
              DragTarget<ScheduleEvent>(
                onAcceptWithDetails: (details) {
                  logger.i(
                    '"${details.data.title}" 일정을 '
                    '${details.data.originalInstanceStartDate}에서 '
                    '${DayOfTheWeek.values[index - 1].value}요일의 $hour시로 이동',
                  );
                },
                builder: (_, __, ___) => Container(height: 70),
              ),
            ],
          );
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
