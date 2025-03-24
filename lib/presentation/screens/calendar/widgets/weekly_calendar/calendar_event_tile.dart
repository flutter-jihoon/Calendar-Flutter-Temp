import 'package:calendar_flutter/core/constants/route_path.dart';
import 'package:calendar_flutter/core/utils/color_util.dart';
import 'package:calendar_flutter/core/utils/text_style_util.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CalendarEventTile extends StatelessWidget {
  final String title;
  final int colorType;
  final double height;

  const CalendarEventTile({
    required this.title,
    required this.colorType,
    required this.height,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0.5),
      child: Material(
        color: CalendarTheme.basic.eventColors[colorType],
        borderRadius: BorderRadius.circular(4),
        child: InkWell(
          borderRadius: BorderRadius.circular(4),
          onTap: () {
            context.goNamed(RoutePath.addScheduleScreenRoute);
          },
          child: SizedBox(
            height: height - 1,
            child: Text(
              title,
              style: AppTextStyles.style14Bold(),
            ),
          ),
        ),
      ),
    );
  }
}
