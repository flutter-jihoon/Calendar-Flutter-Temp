import 'package:calendar_flutter/core/widgets/calendar_app_square_icons.dart';
import 'package:calendar_flutter/core/widgets/calendar_app_list_tile.dart';
import 'package:calendar_flutter/core/widgets/calendar_app_radio_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:calendar_flutter/core/widgets/calendar_app_divider.dart';
import 'package:calendar_flutter/domain/entities/calendar.dart';
import 'package:calendar_flutter/core/utils/text_style_util.dart';

class CalendarSelectList extends StatelessWidget {
  final List<Calendar> calendarList;
  final int selectedCalendarId;
  final ValueChanged<Calendar?> onChanged;
  final VoidCallback onCalendarAddTileTap;

  const CalendarSelectList({
    required this.calendarList,
    required this.selectedCalendarId,
    required this.onChanged,
    required this.onCalendarAddTileTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.only(bottom: 16),
      sliver: SliverList.separated(
        itemBuilder: (context, index) {
          if (index < calendarList.length) {
            return CalendarAppRadioListTile<Calendar>(
              padding: EdgeInsets.all(16),
              title: Text(
                calendarList[index].title,
                style: AppTextStyles.style16Medium(),
              ),
              value: calendarList[index],
              groupValue: calendarList.firstWhere(
                (element) => element.id == selectedCalendarId,
                orElse: () => calendarList.first,
              ),
              onChanged: onChanged,
            );
          }
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CalendarAppListTile(
                title: Text('캘린더 추가', style: AppTextStyles.style16Medium()),
                leading: CalendarAppSquareIcon.plus(20),
                onTap: onCalendarAddTileTap,
                padding: EdgeInsets.all(16),
                borderRadius: BorderRadius.circular(0),
              ),
              CalendarAppDivider(indent: 16),
            ],
          );
        },
        itemCount: calendarList.length + 1,
        separatorBuilder: (_, __) => CalendarAppDivider(indent: 16),
      ),
    );
  }
}
