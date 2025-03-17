import 'package:calendar_flutter/core/utils/color_util.dart';
import 'package:flutter/material.dart';

class CalendarAppSwitch extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  const CalendarAppSwitch({
    required this.value,
    required this.onChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.tightFor(width: 42, height: 26),
      child: Transform.scale(
        scale: 0.8,
        child: Switch(
          value: value,
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          inactiveTrackColor: AppPalette.grey300,
          activeTrackColor: AppPalette.primary,
          onChanged: onChanged,
          thumbIcon: WidgetStateProperty.resolveWith<Icon?>(
            (states) {
              return Icon(
                Icons.circle,
                color: AppPalette.grey100,
                size: 20,
              );
            },
          ),
          thumbColor: WidgetStatePropertyAll(AppPalette.grey100),
          trackOutlineColor: WidgetStatePropertyAll(AppPalette.transparent),
          trackOutlineWidth: WidgetStatePropertyAll(0),
          splashRadius: 20,
        ),
      ),
    );
  }
}
