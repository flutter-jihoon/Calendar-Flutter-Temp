// import 'package:calendar_flutter/presentation/providers/event_list_provider.dart';
// import 'package:calendar_flutter/core/providers/datetime_provider.dart';
// import 'package:calendar_flutter/domain/entities/schedule_event.dart';
import 'package:calendar_flutter/core/enums/day_of_the_week.dart';
import 'package:calendar_flutter/core/utils/color_util.dart';
import 'package:calendar_flutter/core/utils/text_style_util.dart';
import 'package:calendar_flutter/core/widgets/calendar_app_button.dart';
import 'package:calendar_flutter/core/widgets/calendar_app_icons.dart';
import 'package:calendar_flutter/domain/entities/calendar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class WeeklyCalendar extends ConsumerStatefulWidget {
  final Calendar currentCalendar;
  const WeeklyCalendar({required this.currentCalendar, super.key});

  @override
  ConsumerState<WeeklyCalendar> createState() => _WeeklyCalendarState();
}

class _WeeklyCalendarState extends ConsumerState<WeeklyCalendar> {
  late PageController _controller;
  DayOfTheWeek? _selectedDayOfWeek;
  int? _eventStartHour;
  int? _eventEndHour;

  @override
  void initState() {
    super.initState();
    _controller = PageController();
    _eventStartHour = 0; // Default start hour for new events
    _eventEndHour =
        1; // Default end hour for new events (1 hour long by default)
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double timeColumnWidth =
        MediaQuery.sizeOf(context).width * 0.105; // 38 / 360 = 0.10555...

    return PageView.builder(
      controller: _controller,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return SingleChildScrollView(
          child: Table(
            border: TableBorder(),
            columnWidths: {
              0: FixedColumnWidth(timeColumnWidth),
            },
            children: [
              _buildDayOfTheWeekRow(),
              _buildAllDayEventRow(),
              ...buildTimelineRows(timeColumnWidth),
            ],
          ),
        );
      },
    );
  }

  TableRow _buildDayOfTheWeekRow() {
    return TableRow(
      decoration: BoxDecoration(
        color: AppPalette.bg01,
        border: Border.all(color: AppPalette.transparent),
      ),
      children: List.generate(DayOfTheWeek.values.length + 1, (index) {
        if (index == 0) return TableCell(child: SizedBox.shrink());
        final DayOfTheWeek dayOfTheWeek = DayOfTheWeek.values[index - 1];
        return TableCell(
          verticalAlignment: TableCellVerticalAlignment.middle,
          child: Container(
            padding: const EdgeInsets.only(top: 13.5, bottom: 10),
            color: AppPalette.bg01,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  dayOfTheWeek.value,
                  style: AppTextStyles.style14Medium(),
                ),
                SizedBox(height: 10),
                Text(26.toString(), style: AppTextStyles.style16Bold()),
              ],
            ),
          ),
        );
      }),
    );
  }

  TableRow _buildAllDayEventRow() {
    return TableRow(
      decoration: BoxDecoration(
        color: AppPalette.grey100,
        border: Border.symmetric(
          horizontal: BorderSide(color: AppPalette.divider, width: 1),
        ),
      ),
      children: List.generate(DayOfTheWeek.values.length + 1, (index) {
        if (index == 0) return TableCell(child: SizedBox.shrink());
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 2),
          child: Container(
            decoration: BoxDecoration(
              color: AppPalette.grey600,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Center(
              child: Text(
                '설날',
                style: AppTextStyles.style14Bold(color: AppPalette.grey100),
              ),
            ),
          ),
        );
      }),
    );
  }

  List<TableRow> buildTimelineRows(double timeColumnWidth) {
    return List.generate(24, (hour) {
      return TableRow(
        decoration: BoxDecoration(
          border: Border(
            right: BorderSide(color: AppPalette.divider, width: 1),
            bottom: BorderSide(color: AppPalette.divider, width: 1),
          ),
        ),
        children: List.generate(DayOfTheWeek.values.length + 1, (index) {
          if (index == 0) {
            return Container(
              height: 60,
              decoration: BoxDecoration(
                border: Border(
                  right: BorderSide(color: AppPalette.divider, width: 1),
                ),
              ),
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
          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedDayOfWeek = DayOfTheWeek.values[index - 1];
                _eventStartHour = hour;
                _eventEndHour = hour + 1; // Default duration is 1 hour
              });
              _showBottomSheet(context);
            },
            child: Stack(
              children: [
                Container(
                  height: 60,
                  decoration: BoxDecoration(
                    color: AppPalette.grey100,
                    border: Border(
                      right: BorderSide(color: AppPalette.divider, width: 1),
                      bottom: BorderSide(color: AppPalette.divider, width: 1),
                    ),
                  ),
                ),
                // Existing cell content
                if (_eventStartHour == hour &&
                    _selectedDayOfWeek == DayOfTheWeek.values[index - 1])
                  _buildResizableOverlay(hour, index, timeColumnWidth),
              ],
            ),
          );
        }),
      );
    });
  }

  Widget _buildResizableOverlay(int hour, int index, double timeColumnWidth) {
    final double width = (_eventEndHour! - _eventStartHour!) *
        (MediaQuery.of(context).size.width * 0.105);

    return Positioned(
      top: 0,
      left: timeColumnWidth,
      child: GestureDetector(
        onHorizontalDragUpdate: (details) {
          setState(() {
            // Dynamically update the end hour based on horizontal drag
            final double delta = details.localPosition.dx / timeColumnWidth;
            _eventEndHour =
                (_eventStartHour! + delta).clamp(_eventStartHour!, 24).toInt();
          });
        },
        onVerticalDragUpdate: (details) {
          // Optional: handle vertical drag if needed for adjusting time slot start.
        },
        child: Container(
          width: width,
          height: 60, // Height of each event
          color: Colors.blue.withOpacity(0.4),
          child: Center(
            child: Icon(
              Icons.check,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  void _showBottomSheet(BuildContext context) {
    showBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          decoration: BoxDecoration(
            color: AppPalette.grey100,
            borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
            boxShadow: [
              BoxShadow(
                color: AppPalette.grey800.withOpacity(0.25),
                blurRadius: 4,
                spreadRadius: 0,
              )
            ],
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 28),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CalendarAppIcon.closeNavigation(24),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CalendarAppIcon.keyboard(24),
                      SizedBox(width: 5),
                      Text('상세 입력', style: AppTextStyles.style15Medium()),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 28),
              TextField(
                style: AppTextStyles.style18Bold(),
                decoration: InputDecoration(
                  hintText: '제목',
                  hintStyle: AppTextStyles.style18Bold(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppPalette.transparent),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppPalette.transparent),
                  ),
                  contentPadding: EdgeInsets.all(0),
                  isDense: true,
                ),
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  CalendarAppIcon.clock(20),
                  SizedBox(width: 6),
                  Text(
                    '2월 6일 목요일 오전 09:00 ~ 오후 12:00',
                    style: AppTextStyles.style16Medium(),
                  ),
                ],
              ),
              SizedBox(height: 28),
              CalendarAppButton(text: '저장', onPressed: () {}),
            ],
          ),
        );
      },
    );
  }
}
