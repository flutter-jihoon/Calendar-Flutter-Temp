import 'package:calendar_flutter/core/utils/color_util.dart';
import 'package:calendar_flutter/core/utils/text_style_util.dart';
import 'package:calendar_flutter/core/widgets/calendar_app_checkbox.dart';
import 'package:calendar_flutter/core/widgets/calendar_app_list_tile.dart';
import 'package:flutter/material.dart';

class RepeatSettingCheckboxListTile extends StatelessWidget {
  final String title;
  final bool value;
  final ValueChanged<bool?> onChanged;

  const RepeatSettingCheckboxListTile({
    required this.title,
    required this.value,
    required this.onChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CalendarAppListTile(
      onTap: () => onChanged(!value),
      title: Text(title, style: AppTextStyles.style16Medium()),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      borderRadius: BorderRadius.zero,
      trailing: CalendarAppCheckbox(
        value: value,
        onChanged: onChanged,
        checkColor: AppPalette.primary,
        activeColor: AppPalette.transparent,
        inactiveColor: AppPalette.transparent,
      ),
    );
  }
}
