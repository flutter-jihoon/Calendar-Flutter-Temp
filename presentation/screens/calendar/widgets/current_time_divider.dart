import 'package:flutter/material.dart';

class CurrentTimeDivider extends StatelessWidget {
  const CurrentTimeDivider({super.key});

  @override
  Widget build(BuildContext context) {
    const double thickness = 2;
    const double diameter = 8;
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(
          left: -diameter / 2,
          top: -diameter / 2 - thickness / 2,
          child: Container(
            width: diameter,
            height: diameter,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.red,
            ),
          ),
        ),
        Divider(
          color: Colors.red,
          height: 0,
          thickness: thickness,
        ),
      ],
    );
  }
}
