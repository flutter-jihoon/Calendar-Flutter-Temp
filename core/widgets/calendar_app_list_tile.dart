import 'package:calendar_flutter/core/utils/color_util.dart';
import 'package:flutter/material.dart';

class CalendarAppListTile extends StatelessWidget {
  final VoidCallback? onTap;
  final Widget? leading;
  final Widget title;
  final Widget? trailing;
  final EdgeInsets padding;
  final BorderRadius borderRadius;
  final double horizontalTitleGap;
  final bool? isFocused;

  const CalendarAppListTile({
    required this.title,
    required this.padding,
    required this.borderRadius,
    this.horizontalTitleGap = 8,
    this.onTap,
    this.leading,
    this.trailing,
    this.isFocused,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppPalette.grey100,
      borderRadius: borderRadius,
      child: InkWell(
        onTap: onTap,
        borderRadius: borderRadius,
        child: Container(
          padding: padding,
          decoration: BoxDecoration(
            border: Border.all(
              color: isFocused == true
                  ? AppPalette.primary
                  : AppPalette.transparent,
              width: isFocused == true ? 2 : 0,
            ),
            borderRadius: borderRadius,
          ),
          child: Row(
            children: [
              if (leading != null)
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    leading!,
                    SizedBox(width: horizontalTitleGap),
                  ],
                ),
              Expanded(child: title),
              if (trailing != null) trailing!,
            ],
          ),
        ),
      ),
    );
  }
}
