import 'package:calendar_flutter/core/widgets/calendar_app_list_tile.dart';
import 'package:calendar_flutter/core/widgets/calendar_app_radio.dart';
import 'package:flutter/widgets.dart';

class CalendarAppRadioListTile<T> extends StatelessWidget {
  final T value;
  final T? groupValue;
  final ValueChanged<T?> onChanged;
  final Widget title;
  final EdgeInsets padding;
  final BorderRadius borderRadius;

  const CalendarAppRadioListTile({
    super.key,
    required this.title,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    this.padding = EdgeInsets.zero,
    this.borderRadius = BorderRadius.zero,
  });

  @override
  Widget build(BuildContext context) {
    return CalendarAppListTile(
      borderRadius: borderRadius,
      horizontalTitleGap: 6,
      padding: padding,
      leading: CalendarAppRadio(
        value: value,
        groupValue: groupValue,
        onChanged: onChanged,
      ),
      title: title,
      onTap: () => onChanged(value),
    );
  }
}
