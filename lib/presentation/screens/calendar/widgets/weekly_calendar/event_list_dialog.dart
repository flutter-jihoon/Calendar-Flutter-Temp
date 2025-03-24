import 'package:calendar_flutter/core/constants/route_path.dart';
import 'package:calendar_flutter/core/enums/day_of_the_week.dart';
import 'package:calendar_flutter/core/utils/color_util.dart';
import 'package:calendar_flutter/core/utils/text_style_util.dart';
import 'package:calendar_flutter/core/widgets/calendar_app_divider.dart';
import 'package:calendar_flutter/core/widgets/calendar_app_square_icons.dart';
import 'package:calendar_flutter/domain/entities/schedule_event.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class EventListDialog extends StatelessWidget {
  final List<ScheduleEvent> events;
  const EventListDialog({required this.events, super.key});

  @override
  Widget build(BuildContext context) {
    // 2(화) 와 같이 표시
    final DateTime dateTime = events.first.originalInstanceStartDate;
    final String title =
        '${dateTime.day}(${DayOfTheWeek.values[dateTime.weekday % 7].value})';
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 36),
                Text(title, style: AppTextStyles.style18Bold()),
                SizedBox(height: 16),
                CalendarAppDivider(color: AppPalette.grey300),
                ListView.separated(
                  padding: EdgeInsets.only(top: 28, bottom: 36),
                  shrinkWrap: true,
                  itemCount: events.length,
                  itemBuilder: (context, index) {
                    final ScheduleEvent event = events[index];
                    final DateTime startTime = event.originalInstanceStartDate;
                    final DateTime endTime = event.originalInstanceEndDate;
                    final DateFormat formatter = DateFormat('a h:mm', 'ko');
                    final String time =
                        '${formatter.format(startTime)} - ${formatter.format(endTime)}';
                    return InkWell(
                      onTap: () {
                        // TODO: 일정 수정 화면으로 이동
                        context.goNamed(RoutePath.addScheduleScreenRoute);
                      },
                      borderRadius: BorderRadius.circular(8),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: CalendarTheme
                                  .basic.eventColors[event.colorType],
                              radius: 10,
                            ),
                            SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    event.title,
                                    style: AppTextStyles.style16Bold(),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    time,
                                    style: AppTextStyles.style16Medium(),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (_, __) => SizedBox(height: 20),
                ),
              ],
            ),
          ),
          Positioned(
            right: 0,
            top: 0,
            child: IconButton(
              icon: CalendarAppSquareIcon.closeNavigation(20),
              onPressed: context.pop,
            ),
          ),
        ],
      ),
    );
  }
}
