import 'package:calendar_flutter/core/widgets/calendar_app_icons.dart';
import 'package:calendar_flutter/core/widgets/calendar_app_radio_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:calendar_flutter/core/widgets/calendar_app_divider.dart';
import 'package:calendar_flutter/core/widgets/calendar_app_dialog.dart';
import 'package:calendar_flutter/domain/entities/calendar.dart';
import 'package:calendar_flutter/core/utils/text_style_util.dart';

class CalendarSelectList extends StatelessWidget {
  final List<Calendar> calendarList;
  final Calendar? selectedCalendar;

  const CalendarSelectList(this.calendarList, this.selectedCalendar,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      sliver: SliverList.separated(
        itemBuilder: (context, index) {
          if (index < calendarList.length) {
            return CalendarAppRadioListTile<Calendar>(
              contentPadding: EdgeInsets.symmetric(vertical: 7.5),
              title: Text(
                calendarList[index].title,
                style: AppTextStyles.style16Medium(),
              ),
              value: calendarList[index],
              groupValue: selectedCalendar,
              onChanged: (Calendar? value) {
                // Add logic to update selected calendar here
              },
            );
          }
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: Text('캘린더 추가', style: AppTextStyles.style16Medium()),
                leading: CalendarAppIcon.plus(20),
                onTap: () => _onCalendarAddTileTap(context),
                contentPadding: EdgeInsets.symmetric(vertical: 7.5),
                visualDensity: VisualDensity(
                  horizontal: VisualDensity.minimumDensity,
                  vertical: VisualDensity.minimumDensity,
                ),
              ),
              CalendarAppDivider(),
            ],
          );
        },
        itemCount: calendarList.length + 1,
        separatorBuilder: (_, __) => CalendarAppDivider(),
      ),
    );
  }

  void _onCalendarAddTileTap(BuildContext context) async {
    final TextEditingController textEditingController = TextEditingController();
    final bool? result = await showDialog<bool>(
      context: context,
      builder: (context) {
        return CalendarAppDialog(
          title: '캘린더 추가',
          content: TextField(
            controller: textEditingController,
            decoration: const InputDecoration(
              hintText: '캘린더 제목',
              contentPadding: EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 11,
              ),
            ),
          ),
          primaryButtonText: '확인',
          secondaryButtonText: '취소',
        );
      },
    );
    final String name = textEditingController.text;
    if (result == true && name.isNotEmpty) {
      // Add logic to add a new calendar here
    }
  }
}
