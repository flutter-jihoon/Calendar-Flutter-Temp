import 'package:calendar_flutter/core/utils/text_style_util.dart';
import 'package:calendar_flutter/core/widgets/calendar_app_icons.dart';
import 'package:calendar_flutter/core/widgets/calendar_app_list_tile.dart';
import 'package:flutter/material.dart';

class EventTile extends StatelessWidget {
  final VoidCallback? onTap;
  final String iconPath;
  final String label;

  const EventTile({
    this.onTap,
    required this.iconPath,
    required this.label,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Focus(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: CalendarAppListTile(
          onTap: onTap,
          leading: Image.asset(iconPath, width: 20, height: 20),
          title: Text(
            label,
            style: AppTextStyles.style16Regular(),
          ),
          trailing: CalendarAppIcon.chevronRight(16),
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          borderRadius: BorderRadius.circular(12),
          horizontalTitleGap: 6,
        ),
      ),
    );
  }
}
