import 'package:calendar_flutter/core/enums/day_of_the_week.dart';
import 'package:calendar_flutter/core/utils/color_util.dart';
import 'package:calendar_flutter/core/utils/date_time_util.dart';
import 'package:calendar_flutter/core/utils/log_util.dart';
import 'package:calendar_flutter/core/utils/schedule_event_util.dart';
import 'package:calendar_flutter/core/utils/text_style_util.dart';
import 'package:calendar_flutter/core/widgets/minimizable_bottom_sheet.dart';
import 'package:calendar_flutter/domain/entities/calendar.dart';
import 'package:calendar_flutter/domain/entities/schedule_event.dart';
import 'package:calendar_flutter/presentation/providers/selected_time_range_provider.dart';
import 'package:calendar_flutter/presentation/screens/calendar/widgets/add_event_bottom_sheet.dart';
import 'package:calendar_flutter/presentation/screens/calendar/widgets/weekly_calendar/current_time_divider_overlay.dart';
import 'package:calendar_flutter/presentation/screens/calendar/widgets/weekly_calendar/weekly_calendar_event_overlay.dart';
import 'package:calendar_flutter/presentation/screens/calendar/widgets/weekly_calendar/weekly_calendar_select_overlay.dart';
import 'package:expanded_bottom_sheet/ScrollableBottomSheet.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class WeeklyCalendarBody extends ConsumerStatefulWidget {
  final Calendar? currentCalendar;
  final DateTimeRange currentWeek;

  const WeeklyCalendarBody({
    required this.currentCalendar,
    required this.currentWeek,
    super.key,
  });

  @override
  ConsumerState<WeeklyCalendarBody> createState() => _WeeklyCalendarBodyState();
}

class _WeeklyCalendarBodyState extends ConsumerState<WeeklyCalendarBody> {
  PersistentBottomSheetController? _bottomSheetController;

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
    final Duration? duration = ref.watch(selectedTimeRangeProvider)?.duration;

    ref.listen(selectedTimeRangeProvider, (prev, next) {
      if (next != null) {
        logger.i('바텀시트 띄워야됨');
        final controller = showMinimizableBottomSheet(
          context: context,
          builder: (context) => AddEventBottomSheet(
            startTime: next.start,
            endTime: next.end,
          ),
          sheetAnimationStyle: prev == null ? null : AnimationStyle.noAnimation,
        );
        final Future<void> minimized = controller.closed;
        minimized.then((value) {
          ref.read(selectedTimeRangeProvider.notifier).state = null;
        });
      }
    });

    return Stack(
      children: [
        Table(
          border: TableBorder.symmetric(
            inside: BorderSide(color: AppPalette.divider, width: 1),
          ),
          columnWidths: {0: FixedColumnWidth(timeColumnWidth)},
          children: buildTimelineRows(
            timeColumnWidth,
            duration ?? Duration(hours: 1),
          ),
        ),
        Positioned.fill(
          child: Stack(
            children: [
              ...eventGroups.map(
                (eventGroup) => WeeklyCalendarEventOverlay(
                  eventGroup: eventGroup,
                  firstDayOfWeek: widget.currentWeek.start,
                ),
              ),
              WeeklyCalendarSelectOverlay(
                onSelectionChanged: (startTime, endTime) {
                  if (startTime == null || endTime == null) return;
                  ref.read(selectedTimeRangeProvider.notifier).state =
                      DateTimeRange(
                    start: startTime,
                    end: endTime,
                  );
                },
                firstDayOfWeek: widget.currentWeek.start,
              ),
              if (widget.currentWeek.start
                  .isSameDay(DateTime.now().firstDayOfWeek))
                CurrentTimeDividerOverlay(),
            ],
          ),
        ),
      ],
    );
  }

  List<TableRow> buildTimelineRows(double timeColumnWidth, Duration duration) {
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
          return SizedBox(
            height: 70,
            child: Column(
              children: [
                Expanded(
                  child: GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () {
                      final DateTime day = widget.currentWeek.start
                          .add(Duration(days: index - 1));
                      final DateTime newStartTime =
                          DateTime(day.year, day.month, day.day, hour);
                      ref.read(selectedTimeRangeProvider.notifier).state =
                          DateTimeRange(
                        start: newStartTime,
                        end: newStartTime.add(duration),
                      );
                    },
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      final DateTime day = widget.currentWeek.start
                          .add(Duration(days: index - 1));
                      final DateTime newStartTime =
                          DateTime(day.year, day.month, day.day, hour, 30);
                      ref.read(selectedTimeRangeProvider.notifier).state =
                          DateTimeRange(
                        start: newStartTime,
                        end: newStartTime.add(duration),
                      );
                    },
                  ),
                ),
              ],
            ),
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
