import 'package:calendar_flutter/core/widgets/calendar_app_checkbox.dart';
import 'package:calendar_flutter/core/widgets/calendar_app_list_tile.dart';
import 'package:flutter/material.dart';

class CalendarAppCheckboxListTile extends StatelessWidget {
  const CalendarAppCheckboxListTile({
    super.key,
    required this.title,
    required this.value,
    required this.onChanged,
    this.padding = EdgeInsets.zero,
    this.borderRadius = const BorderRadius.all(Radius.circular(8.0)),
  });

  final bool value;
  final ValueChanged<bool?> onChanged;
  final Widget title;
  final EdgeInsets padding;
  final BorderRadius borderRadius;

  @override
  Widget build(BuildContext context) {
    return MergeSemantics(
      child: CalendarAppListTile(
        borderRadius: borderRadius,
        padding: padding,
        leading: CalendarAppCheckbox(
          value: value,
          onChanged: onChanged,
        ),
        title: title,
        onTap: () => onChanged(!value),
      ),
    );
  }
}
