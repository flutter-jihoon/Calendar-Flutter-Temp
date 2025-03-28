import 'dart:async';

import 'package:flutter/material.dart';

class CurrentTimeDividerOverlay extends StatefulWidget {
  final double thickness = 2.0;
  final double diameter = 8.0;

  const CurrentTimeDividerOverlay({super.key});

  @override
  State<CurrentTimeDividerOverlay> createState() =>
      _CurrentTimeDividerOverlayState();
}

class _CurrentTimeDividerOverlayState extends State<CurrentTimeDividerOverlay> {
  DateTime _now = DateTime.now();
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    final int secondsUntilNextMinute = 60 - _now.second;
    _timer = Timer(Duration(seconds: secondsUntilNextMinute), () {
      setState(() => _now = DateTime.now());
      _timer = Timer.periodic(Duration(minutes: 1), (_) {
        setState(() => _now = DateTime.now());
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double timeColumnWidth = MediaQuery.sizeOf(context).width * 0.105;
    final double width = MediaQuery.sizeOf(context).width * 0.895 / 7;
    final double left = timeColumnWidth + (_now.weekday % 7) * width;
    final double top = (_now.hour + _now.minute / 60) * 70;

    return Positioned(
      left: left,
      top: top + widget.thickness / 2,
      width: width,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            left: -widget.diameter / 2,
            top: -widget.diameter / 2 - widget.thickness / 2,
            child: Container(
              width: widget.diameter,
              height: widget.diameter,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.red,
              ),
            ),
          ),
          Divider(
            color: Colors.red,
            height: 0,
            thickness: widget.thickness,
          ),
        ],
      ),
    );
  }
}
