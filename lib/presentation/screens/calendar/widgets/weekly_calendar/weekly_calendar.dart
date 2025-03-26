import 'package:calendar_flutter/core/utils/date_time_util.dart';
import 'package:calendar_flutter/core/utils/log_util.dart';
import 'package:calendar_flutter/domain/entities/calendar.dart';
import 'package:calendar_flutter/presentation/screens/calendar/widgets/weekly_calendar/weekly_calendar_body.dart';
import 'package:calendar_flutter/presentation/screens/calendar/widgets/weekly_calendar/weekly_calendar_header.dart';
import 'package:flutter/material.dart';

class WeeklyCalendar extends StatefulWidget {
  final PageController pageController;
  final ScrollController scrollController;
  final DateTime firstDate;
  final DateTime lastDate;
  final int initialPage;
  final Calendar? currentCalendar;
  final void Function(int)? onPageChanged;

  const WeeklyCalendar({
    required this.pageController,
    required this.scrollController,
    required this.firstDate,
    required this.lastDate,
    required this.initialPage,
    required this.currentCalendar,
    required this.onPageChanged,
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
    logger.i('selectedTimeRange: $_selectedTimeRange');

    return PageView.builder(
      controller: widget.pageController,
      itemCount: widget.lastDate.difference(widget.firstDate).inDays ~/ 7,
      onPageChanged: widget.onPageChanged,
      itemBuilder: (context, index) {
        final weekOffset = index - widget.initialPage;
        final DateTime firstDayOfTheWeek = DateTime.now()
            .firstDayOfTheWeek
            .add(Duration(days: weekOffset * 7));
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
      },
    );
  }
}
