import 'package:calendar_flutter/core/utils/text_style_util.dart';
import 'package:calendar_flutter/core/widgets/calendar_app_list_tile.dart';
import 'package:calendar_flutter/core/widgets/calendar_app_switch.dart';
import 'package:flutter/material.dart';

class EventSwitchTile extends StatelessWidget {
  final String iconPath;
  final String label;
  final bool value;
  final ValueChanged<bool> onChanged;

  const EventSwitchTile({
    required this.iconPath,
    required this.label,
    required this.value,
    required this.onChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: CalendarAppListTile(
        onTap: () => onChanged(!value),
        leading: Image.asset(iconPath, width: 20, height: 20),
        title: Text(
          label,
          style: AppTextStyles.style16Regular(),
        ),
        trailing: CalendarAppSwitch(value: value, onChanged: onChanged),
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        borderRadius: BorderRadius.circular(12),
        horizontalTitleGap: 6,
      ),
    );
  }
}
