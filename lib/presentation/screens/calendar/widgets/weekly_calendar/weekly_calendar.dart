import 'package:calendar_flutter/core/utils/date_time_util.dart';
import 'package:calendar_flutter/domain/entities/calendar.dart';
import 'package:calendar_flutter/presentation/screens/calendar/widgets/weekly_calendar/weekly_calendar_body.dart';
import 'package:calendar_flutter/presentation/screens/calendar/widgets/weekly_calendar/weekly_calendar_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WeeklyCalendar extends ConsumerStatefulWidget {
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
  ConsumerState<WeeklyCalendar> createState() => _WeeklyCalendarState();
}

class _WeeklyCalendarState extends ConsumerState<WeeklyCalendar> {
  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: widget.pageController,
      itemCount: widget.lastDate.difference(widget.firstDate).inDays ~/ 7,
      onPageChanged: widget.onPageChanged,
      itemBuilder: (context, index) {
        final weekOffset = index - widget.initialPage;
        final DateTime firstDayOfWeek =
            DateTime.now().firstDayOfWeek.add(Duration(days: weekOffset * 7));
        return Column(
          children: [
            WeeklyCalendarHeader(firstDayOfWeek: firstDayOfWeek),
            Expanded(
              child: SingleChildScrollView(
                controller: widget.scrollController,
                child: WeeklyCalendarBody(
                  currentCalendar: widget.currentCalendar,
                  currentWeek: DateTimeRange(
                    start: firstDayOfWeek,
                    end: firstDayOfWeek.add(Duration(days: 6)),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
