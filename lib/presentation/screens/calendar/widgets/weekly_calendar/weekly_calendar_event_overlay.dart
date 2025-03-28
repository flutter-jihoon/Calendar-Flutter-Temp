import 'package:calendar_flutter/domain/entities/schedule_event.dart';
import 'package:calendar_flutter/presentation/screens/calendar/widgets/weekly_calendar/calendar_event_tile.dart';
import 'package:calendar_flutter/presentation/screens/calendar/widgets/weekly_calendar/event_list_dialog.dart';
import 'package:flutter/material.dart';

class WeeklyCalendarEventOverlay extends StatefulWidget {
  final List<ScheduleEvent> eventGroup;
  final DateTime firstDayOfWeek; // 캘린더 시작 날짜 (첫 번째 요일)

  const WeeklyCalendarEventOverlay({
    required this.eventGroup,
    required this.firstDayOfWeek, // 첫 번째 요일을 받음
    super.key,
  });

  @override
  State<WeeklyCalendarEventOverlay> createState() =>
      _WeeklyCalendarEventOverlayState();
}

class _WeeklyCalendarEventOverlayState
    extends State<WeeklyCalendarEventOverlay> {
  @override
  Widget build(BuildContext context) {
    final double timeColumnWidth = MediaQuery.sizeOf(context).width * 0.105;
    final double width = MediaQuery.sizeOf(context).width * 0.895 / 7;
    // --- 캘린더 시작 날짜 및 범위 설정
    final startDate = widget.firstDayOfWeek; // 첫 번째 요일로 시작 날짜 설정
    final endDate = startDate.add(Duration(days: 6)); // 시작일부터 7일 후

    // --- 캘린더 범위 내의 일정만 필터링
    final filteredEvents = widget.eventGroup.where((event) {
      return event.originalInstanceStartDate
              .isAfter(startDate.subtract(Duration(days: 1))) &&
          event.originalInstanceEndDate
              .isBefore(endDate.add(Duration(days: 1)));
    }).toList();

    // --- 첫 일정의 시작 시간 (첫 번째 일정 기준)
    final firstStartDate = filteredEvents.isNotEmpty
        ? filteredEvents.first.originalInstanceStartDate
        : startDate;

    // 왼쪽 위치 계산: 캘린더 시작 날짜와 비교
    final int weekday = (firstStartDate.weekday - startDate.weekday + 7) % 7;
    final double left = timeColumnWidth + weekday * width;

    // --- 정렬
    filteredEvents.sort((a, b) {
      final startCmp =
          a.originalInstanceStartDate.compareTo(b.originalInstanceStartDate);
      if (startCmp != 0) return startCmp;
      final endCmp =
          a.originalInstanceEndDate.compareTo(b.originalInstanceEndDate);
      return endCmp != 0 ? endCmp : a.createdAt.compareTo(b.createdAt);
    });

    // --- 열 배치
    final List<List<ScheduleEvent>> columns = [[], [], []];
    final List<ScheduleEvent> overflow = [];

    for (final event in filteredEvents) {
      bool placed = false;
      for (final col in columns) {
        if (col.isEmpty || !_isOverlapping(col.last, event)) {
          col.add(event);
          placed = true;
          break;
        }
      }
      if (!placed) overflow.add(event);
    }

    // --- UI
    return Positioned(
      left: left,
      top: 0,
      child: SizedBox(
        width: width,
        height: 24 * 70, // 하루 24시간 * 70px
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --- 각 열마다 일정 타일 배치
            for (int i = 0; i < columns.length; i++)
              Expanded(
                child: Stack(
                  children: columns[i].map((event) {
                    final double top =
                        _calculateTop(event.originalInstanceStartDate);
                    final double height = _calculateHeight(event);

                    // 각 일정 타일에 대해 너비를 설정
                    return Positioned(
                      top: top,
                      child: SizedBox(
                        width: width / columns.length, // 열에 맞춰서 너비 설정
                        child: CalendarEventTile(
                          title: event.title,
                          colorType: event.colorType,
                          height: height,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),

            // --- +N 오버플로 위젯
            if (overflow.isNotEmpty)
              Expanded(
                child: Builder(
                  builder: (context) {
                    final start = overflow
                        .map((e) => e.originalInstanceStartDate)
                        .reduce((a, b) => a.isBefore(b) ? a : b);
                    final end = overflow
                        .map((e) => e.originalInstanceEndDate)
                        .reduce((a, b) => a.isAfter(b) ? a : b);
                    final top = _calculateTop(start);
                    final height = end.difference(start).inMinutes * (70 / 60);

                    return Stack(
                      children: [
                        Positioned(
                          top: top,
                          child: GestureDetector(
                            onTap: () => showDialog(
                              context: context,
                              builder: (context) => EventListDialog(
                                events: widget.eventGroup,
                              ),
                            ),
                            child: CalendarEventTile(
                              title: '+${overflow.length}',
                              colorType: overflow.first.colorType,
                              height: height,
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }

  bool _isOverlapping(ScheduleEvent a, ScheduleEvent b) {
    return a.originalInstanceStartDate.isBefore(b.originalInstanceEndDate) &&
        a.originalInstanceEndDate.isAfter(b.originalInstanceStartDate);
  }

  double _calculateTop(DateTime time) {
    return (time.hour * 60 + time.minute) * (70 / 60);
  }

  double _calculateHeight(ScheduleEvent event) {
    return event.originalInstanceEndDate
            .difference(event.originalInstanceStartDate)
            .inMinutes *
        (70 / 60);
  }
}
