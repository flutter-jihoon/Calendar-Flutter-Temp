import 'package:calendar_flutter/core/utils/color_util.dart';
import 'package:calendar_flutter/core/widgets/calendar_app_button.dart';
import 'package:flutter/material.dart';

class CalendarAppBottomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final ButtonType buttonRole;

  const CalendarAppBottomButton({
    required this.text,
    required this.onPressed,
    this.buttonRole = ButtonType.solid,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      clipBehavior: Clip.none,
      children: [
        Container(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
          color: AppPalette.grey100,
          child: CalendarAppButton(
            text: text,
            onPressed: onPressed,
            padding: EdgeInsets.symmetric(vertical: 13),
          ),
        ),
        Positioned(
          top: -20,
          left: 0,
          right: 0,
          child: Container(
            height: 20,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  AppPalette.grey100.withOpacity(0),
                  AppPalette.grey100,
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
