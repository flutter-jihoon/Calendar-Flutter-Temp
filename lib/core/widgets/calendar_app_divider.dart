import 'package:calendar_flutter/core/utils/color_util.dart';
import 'package:flutter/material.dart';

class CalendarAppDivider extends StatelessWidget {
  final double indent;
  final Color color;

  const CalendarAppDivider({
    super.key,
    this.indent = 0,
    this.color = AppPalette.divider,
  });

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 1,
      thickness: 1,
      indent: indent,
      endIndent: indent,
      color: color,
    );
  }
}
