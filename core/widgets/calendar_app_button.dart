import 'package:calendar_flutter/core/utils/color_util.dart';
import 'package:calendar_flutter/core/utils/text_style_util.dart';
import 'package:flutter/material.dart';

enum ButtonType {
  solid(
    backgroundColor: AppPalette.primary,
    foregroundColor: AppPalette.grey100,
  ),
  ghost(
    backgroundColor: AppPalette.grey100,
    foregroundColor: AppPalette.primary,
  ),
  grey(
    backgroundColor: AppPalette.grey250,
    foregroundColor: AppPalette.grey800,
  );

  final Color backgroundColor;
  final Color foregroundColor;

  const ButtonType({
    required this.backgroundColor,
    required this.foregroundColor,
  });
}

class CalendarAppButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final ButtonType buttonType;
  final EdgeInsets? padding;

  const CalendarAppButton({
    required this.text,
    required this.onPressed,
    this.padding,
    this.buttonType = ButtonType.solid,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        backgroundColor: buttonType.backgroundColor,
        foregroundColor: buttonType.foregroundColor,
        padding: padding ?? const EdgeInsets.symmetric(vertical: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
      ),
      child: Center(
        child: Text(text, style: AppTextStyles.style16Regular()),
      ),
    );
  }
}
