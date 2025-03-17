import 'package:flutter/material.dart';

class CalendarAppIconButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String assetName;

  const CalendarAppIconButton({
    required this.onPressed,
    required this.assetName,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      customBorder: const CircleBorder(),
      child: Image.asset(
        assetName,
        width: 20,
        height: 20,
      ),
    );
  }
}
