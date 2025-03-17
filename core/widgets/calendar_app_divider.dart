import 'package:calendar_flutter/core/utils/color_util.dart';
import 'package:flutter/material.dart';

class CalendarAppDivider extends StatelessWidget {
  final double indent;

  const CalendarAppDivider({super.key, this.indent = 0});

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 1,
      thickness: 1,
      indent: indent,
      endIndent: indent,
      color: AppPalette.divider,
    );
  }
}
