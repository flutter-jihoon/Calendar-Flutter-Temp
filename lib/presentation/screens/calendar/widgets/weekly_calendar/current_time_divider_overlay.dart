import 'package:flutter/material.dart';

class CurrentTimeDividerOverlay extends StatelessWidget {
  const CurrentTimeDividerOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    const double thickness = 2;
    const double diameter = 8;
    final double timeColumnWidth = MediaQuery.sizeOf(context).width * 0.105;
    final double width =
        (MediaQuery.sizeOf(context).width - timeColumnWidth) / 7;
    return Builder(
      builder: (context) {
        final DateTime now = DateTime.now();
        final double left = (now.weekday % 7) * width + timeColumnWidth;
        final double top = (now.hour + now.minute / 60) * 70;
        return Positioned(
          left: left,
          top: top + thickness / 2,
          width: width,
          child: Stack(
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
          ),
        );
      },
    );
  }
}
