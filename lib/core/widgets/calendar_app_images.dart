import 'package:calendar_flutter/core/utils/color_util.dart';
import 'package:flutter/material.dart';

sealed class CalendarAppImage extends StatelessWidget {
  const CalendarAppImage({super.key});

  factory CalendarAppImage.calendarSelect(Size size) =>
      _CalendarSelectImage(size);
  factory CalendarAppImage.theme(CalendarTheme theme, Size size) =>
      _CalendarThemeImage(theme, size);
}

final class _CalendarSelectImage extends CalendarAppImage {
  final Size size;
  const _CalendarSelectImage(this.size);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'packages/calendar_flutter/assets/images/calendar_select.webp',
      width: size.width,
      height: size.height,
    );
  }
}

final class _CalendarThemeImage extends CalendarAppImage {
  final CalendarTheme theme;
  final Size size;
  const _CalendarThemeImage(this.theme, this.size);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'packages/calendar_flutter/assets/images/theme_${theme.name}.webp',
      width: size.width,
      height: size.height,
    );
  }
}
