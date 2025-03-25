import 'package:calendar_flutter/core/utils/color_util.dart';
import 'package:calendar_flutter/core/widgets/calendar_app_checkbox.dart';
import 'package:calendar_flutter/core/widgets/calendar_app_list_tile.dart';
import 'package:flutter/material.dart';

class CalendarAppCheckboxListTile extends StatelessWidget {
  final bool value;
  final ValueChanged<bool?> onChanged;
  final Widget title;
  final EdgeInsets padding;
  final BorderRadius borderRadius;

  const CalendarAppCheckboxListTile({
    super.key,
    required this.title,
    required this.value,
    required this.onChanged,
    this.padding = EdgeInsets.zero,
    this.borderRadius = const BorderRadius.all(Radius.circular(8.0)),
  });

  @override
  Widget build(BuildContext context) {
    return CalendarAppListTile(
      borderRadius: borderRadius,
      padding: padding,
      leading: CalendarAppCheckbox(
        value: value,
        onChanged: onChanged,
        inactiveSide: BorderSide(
          width: 1.3,
          color: AppPalette.grey400,
        ),
      ),
      title: title,
      onTap: () => onChanged(!value),
    );
  }
}
