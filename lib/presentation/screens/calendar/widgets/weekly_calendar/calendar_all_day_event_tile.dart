import 'package:calendar_flutter/core/constants/route_path.dart';
import 'package:calendar_flutter/core/utils/color_util.dart';
import 'package:calendar_flutter/core/utils/text_style_util.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CalendarAllDayEventTile extends StatelessWidget {
  final String title;
  final int colorType;

  const CalendarAllDayEventTile({
    required this.title,
    required this.colorType,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 1),
      child: Material(
        color: CalendarTheme.basic.eventColors[colorType],
        borderRadius: BorderRadius.circular(4),
        child: InkWell(
          borderRadius: BorderRadius.circular(4),
          onTap: () {
            context.goNamed(RoutePath.addScheduleScreenRoute);
          },
          child: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(4)),
            child: Center(
              child: Text(title, style: AppTextStyles.style14Bold()),
            ),
          ),
        ),
      ),
    );
  }
}
