import 'package:calendar_flutter/core/enums/day_of_the_week.dart';
import 'package:calendar_flutter/core/utils/color_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class WeeklyCalendarSelectOverlay extends StatefulWidget {
  final DateTime? startTime;
  final DateTime firstDayOfWeek;
  final Function(DateTime? startTime, DateTime? endTime) onSelectionChanged;

  const WeeklyCalendarSelectOverlay({
    required this.startTime,
    required this.firstDayOfWeek,
    required this.onSelectionChanged,
    super.key,
  });

  @override
  State<WeeklyCalendarSelectOverlay> createState() =>
      _WeeklyCalendarSelectOverlayState();
}

class _WeeklyCalendarSelectOverlayState
    extends State<WeeklyCalendarSelectOverlay> {
  static const _durationRange = (
    minimumDuration: Duration(minutes: 30), // 최소 30분
    maximumDuration: Duration(hours: 24), // 최대 24시간
  );
  static const _stepDuration = Duration(minutes: 15);
  static final double _step = _stepDuration.inMinutes / 60 * 70;

  late DateTime? _startTime;
  late DateTime? _endTime;
  Duration _selectionDuration = Duration(hours: 1);

  double _dragOffset = 0.0;

  @override
  void initState() {
    super.initState();
    _startTime = widget.startTime;
    _endTime = _startTime?.add(_selectionDuration);
  }

  @override
  void didUpdateWidget(WeeklyCalendarSelectOverlay oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.startTime != oldWidget.startTime) {
      _startTime = widget.startTime;
      _endTime = _startTime?.add(_selectionDuration);
    }
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.sizeOf(context).width;
    final double timeColumnWidth = screenWidth * 0.105;
    final double width = (screenWidth - timeColumnWidth) / 7;

    final List<Widget> overlays = [];
    if (_startTime != null && _endTime != null) {
      final DateTime start = _startTime!;
      final DateTime end = _endTime!;

      overlays.add(
        buildOverlayWidgetForSingleDay(start, end, timeColumnWidth, width),
      );
    }

    return Positioned.fill(
      child: Stack(
        children: [
          Positioned.fill(
            child: Table(
              columnWidths: {0: FixedColumnWidth(timeColumnWidth)},
              children: List.generate(
                Duration(days: 1).inHours,
                (hour) {
                  return TableRow(
                    children: List.generate(
                      DayOfTheWeek.values.length + 1,
                      (dayIndex) {
                        return SizedBox(
                          height: 70,
                          child: Column(
                            children: [
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    final DateTime day = widget.firstDayOfWeek
                                        .add(Duration(days: dayIndex - 1));
                                    final DateTime newStartTime = DateTime(
                                        day.year, day.month, day.day, hour);
                                    setState(() {
                                      _startTime = newStartTime;
                                      _endTime =
                                          _startTime!.add(_selectionDuration);
                                    });
                                    widget.onSelectionChanged(
                                        _startTime, _endTime);
                                  },
                                ),
                              ),
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    final DateTime day = widget.firstDayOfWeek
                                        .add(Duration(days: dayIndex - 1));
                                    final DateTime newStartTime = DateTime(
                                        day.year, day.month, day.day, hour, 30);
                                    setState(() {
                                      _startTime = newStartTime;
                                      _endTime =
                                          _startTime!.add(_selectionDuration);
                                    });
                                    widget.onSelectionChanged(
                                        _startTime, _endTime);
                                  },
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ),
          ...overlays,
        ],
      ),
    );
  }

  Widget buildOverlayWidgetForSingleDay(DateTime startTime, DateTime endTime,
      double timeColumnWidth, double width) {
    return Positioned(
      left: timeColumnWidth + width * (startTime.weekday % 7),
      top: 70 * (startTime.hour + startTime.minute / 60),
      child: buildSelectOverlayWidget(startTime, endTime),
    );
  }

  Widget buildSelectOverlayWidget(DateTime startTime, DateTime endTime) {
    final double timeColumnWidth = MediaQuery.sizeOf(context).width * 0.105;
    final double width =
        (MediaQuery.sizeOf(context).width - timeColumnWidth) / 7;

    return Stack(
      clipBehavior: Clip.none,
      children: [
        IgnorePointer(
          child: Container(
            width: width,
            height: _selectionDuration.inMinutes / 60 * 70,
            decoration: BoxDecoration(
              color: AppPalette.primary.withOpacity(0.05),
              border: Border.all(color: AppPalette.primary, width: 1),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(4),
                bottomLeft: Radius.circular(4),
              ),
            ),
          ),
        ),
        Positioned(
          left: -5,
          top: -5,
          child: GestureDetector(
            onPanDown: (_) => HapticFeedback.mediumImpact(),
            onVerticalDragUpdate: (details) {
              _dragOffset += details.primaryDelta!;
              if (_dragOffset.abs() >= _step) {
                final int steps = (_dragOffset / _step).truncate();
                final newStartTime = startTime.add(_stepDuration * steps);
                if (newStartTime
                    .isBefore(startTime.add(_durationRange.minimumDuration))) {
                  return;
                }
                if (newStartTime.isAfter(
                    endTime.subtract(_durationRange.minimumDuration))) {
                  return;
                }
                HapticFeedback.lightImpact();
                setState(() {
                  startTime = newStartTime;
                  _startTime = startTime;
                  _selectionDuration = endTime.difference(startTime);
                });
                _dragOffset -= steps * _step;
              }
            },
            child: buildDragDot(),
          ),
        ),
        Positioned(
          right: -5,
          bottom: -5,
          child: GestureDetector(
            onPanDown: (_) => HapticFeedback.mediumImpact(),
            onVerticalDragUpdate: (details) {
              _dragOffset += details.primaryDelta!;
              if (_dragOffset.abs() >= _step) {
                final int steps = (_dragOffset / _step).truncate();
                final newEndTime = endTime.add(_stepDuration * steps);
                if (newEndTime
                    .isBefore(startTime.add(_durationRange.minimumDuration))) {
                  return;
                }
                if (newEndTime
                    .isAfter(startTime.add(_durationRange.maximumDuration))) {
                  return;
                }
                HapticFeedback.lightImpact();
                setState(() {
                  endTime = newEndTime;
                  _endTime = endTime;
                  _selectionDuration = endTime.difference(startTime);
                });
                _dragOffset -= steps * _step;
              }
            },
            child: buildDragDot(),
          ),
        ),
      ],
    );
  }

  Widget buildDragDot() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 6,
          height: 6,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppPalette.primary,
          ),
        ),
        Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppPalette.primary.withOpacity(0.2),
          ),
        ),
      ],
    );
  }
}
