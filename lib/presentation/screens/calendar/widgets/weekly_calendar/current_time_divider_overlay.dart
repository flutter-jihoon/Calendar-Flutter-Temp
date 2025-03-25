import 'package:flutter/material.dart';

class CurrentTimeDividerOverlay extends StatelessWidget {
  const CurrentTimeDividerOverlay({super.key});

  static const double _thickness = 2.0;
  static const double _diameter = 8.0;

  @override
  Widget build(BuildContext context) {
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
          top: top + _thickness / 2,
          width: width,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                left: -_diameter / 2,
                top: -_diameter / 2 - _thickness / 2,
                child: Container(
                  width: _diameter,
                  height: _diameter,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.red,
                  ),
                ),
              ),
              Divider(
                color: Colors.red,
                height: 0,
                thickness: _thickness,
              ),
            ],
          ),
        );
      },
    );
  }
}
