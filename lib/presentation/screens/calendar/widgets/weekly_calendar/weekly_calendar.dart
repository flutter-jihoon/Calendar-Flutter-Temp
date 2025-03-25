import 'package:calendar_flutter/core/utils/date_time_util.dart';
import 'package:calendar_flutter/core/utils/log_util.dart';
import 'package:calendar_flutter/domain/entities/calendar.dart';
import 'package:calendar_flutter/presentation/screens/calendar/widgets/weekly_calendar/weekly_calendar_body.dart';
import 'package:calendar_flutter/presentation/screens/calendar/widgets/weekly_calendar/weekly_calendar_header.dart';
import 'package:flutter/material.dart';

class WeeklyCalendar extends StatefulWidget {
  final ScrollController scrollController;
  final Calendar? currentCalendar;
  final int weekOffset;

  const WeeklyCalendar({
    required this.scrollController,
    required this.currentCalendar,
    required this.weekOffset,
    super.key,
  });

  @override
  State<WeeklyCalendar> createState() => _WeeklyCalendarState();
}

class _WeeklyCalendarState extends State<WeeklyCalendar> {
  ({DateTime? startTime, DateTime? endTime}) _selectedTimeRange =
      (startTime: null, endTime: null);

  @override
  Widget build(BuildContext context) {
    final DateTime firstDayOfTheWeek = DateTime.now()
        .firstDayOfTheWeek
        .add(Duration(days: widget.weekOffset * 7));

    logger.i('selectedTimeRange: $_selectedTimeRange');
    return Column(
      children: [
        WeeklyCalendarHeader(firstDayOfTheWeek: firstDayOfTheWeek),
        Expanded(
          child: SingleChildScrollView(
            controller: widget.scrollController,
            child: WeeklyCalendarBody(
              startTime: _selectedTimeRange.startTime,
              endTime: _selectedTimeRange.endTime,
              currentCalendar: widget.currentCalendar,
              firstDayOfTheWeek: firstDayOfTheWeek,
              onSelectionChanged: (DateTime? startTime, DateTime? endTime) {
                setState(
                  () => _selectedTimeRange = (
                    startTime: startTime,
                    endTime: endTime,
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
