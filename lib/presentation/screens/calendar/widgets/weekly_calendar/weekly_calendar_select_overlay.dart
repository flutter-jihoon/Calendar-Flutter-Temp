import 'package:calendar_flutter/core/utils/color_util.dart';
import 'package:calendar_flutter/presentation/providers/selected_time_range_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WeeklyCalendarSelectOverlay extends ConsumerStatefulWidget {
  final DateTime firstDayOfWeek;
  final Function(DateTime? startTime, DateTime? endTime) onSelectionChanged;

  const WeeklyCalendarSelectOverlay({
    required this.firstDayOfWeek,
    required this.onSelectionChanged,
    super.key,
  });

  @override
  ConsumerState<WeeklyCalendarSelectOverlay> createState() =>
      _WeeklyCalendarSelectOverlayState();
}

class _WeeklyCalendarSelectOverlayState
    extends ConsumerState<WeeklyCalendarSelectOverlay> {
  // TODO: 드래그로 조정 가능한 최대/최소 시간 범위 설정
  static const Duration _minimumDuration = Duration(minutes: 30);
  static const Duration _maximumDuration = Duration(days: 1);
  static const Duration _stepDuration = Duration(minutes: 15);
  static final double _step = _stepDuration.inMinutes / 60 * 70;

  DateTime? _startTime;
  DateTime? _endTime;

  @override
  void initState() {
    super.initState();
    _startTime = ref.read(selectedTimeRangeProvider)?.start;
    _endTime = ref.read(selectedTimeRangeProvider)?.end;
  }

  @override
  void didUpdateWidget(WeeklyCalendarSelectOverlay oldWidget) {
    super.didUpdateWidget(oldWidget);
    _startTime = ref.read(selectedTimeRangeProvider)?.start;
    _endTime = ref.read(selectedTimeRangeProvider)?.end;
  }

  double _dragOffset = 0.0;

  @override
  Widget build(BuildContext context) {
    if (_startTime == null || _endTime == null) return SizedBox.shrink();
    return buildOverlayWidgetForSingleDay(_startTime!, _endTime!);
  }

  Widget buildOverlayWidgetForSingleDay(DateTime startTime, DateTime endTime) {
    final double timeColumnWidth = MediaQuery.sizeOf(context).width * 0.105;
    final double width = MediaQuery.sizeOf(context).width * 0.895 / 7;
    return Positioned(
      left: timeColumnWidth + width * (startTime.weekday % 7) - 5,
      top: 70 * (startTime.hour + startTime.minute / 60) - 5,
      child: buildSelectOverlayWidget(startTime, endTime, width),
    );
  }

  Widget buildSelectOverlayWidget(
      DateTime startTime, DateTime endTime, double width) {
    return Stack(
      children: [
        IgnorePointer(
          child: Container(
            width: width,
            height: endTime.difference(startTime).inMinutes / 60 * 70,
            margin: const EdgeInsets.all(5),
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
          left: 0,
          top: 0,
          child: GestureDetector(
            onPanDown: (_) => HapticFeedback.mediumImpact(),
            onVerticalDragEnd: (_) {
              widget.onSelectionChanged.call(_startTime, _endTime);
            },
            onVerticalDragUpdate: (details) {
              _dragOffset += details.primaryDelta!;
              if (_dragOffset.abs() >= _step) {
                final int steps = (_dragOffset / _step).truncate();
                final DateTime newStartTime =
                    startTime.add(_stepDuration * steps);
                if (newStartTime.day != startTime.day) {
                  return;
                }
                if (newStartTime.isBefore(endTime.subtract(_maximumDuration))) {
                  return;
                }
                if (newStartTime.isAfter(endTime.subtract(_minimumDuration))) {
                  return;
                }
                setState(() {
                  startTime = newStartTime;
                  _startTime = startTime;
                });
                _dragOffset -= steps * _step;
              }
            },
            child: Stack(
              alignment: Alignment.center,
              children: [
                CircleAvatar(radius: 3, backgroundColor: AppPalette.primary),
                CircleAvatar(
                  radius: 5,
                  backgroundColor: AppPalette.primary.withOpacity(0.2),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          right: 0,
          bottom: 0,
          child: GestureDetector(
            onPanDown: (_) => HapticFeedback.mediumImpact(),
            onVerticalDragEnd: (_) {
              widget.onSelectionChanged.call(_startTime, _endTime);
            },
            onVerticalDragUpdate: (details) {
              _dragOffset += details.primaryDelta!;
              if (_dragOffset.abs() >= _step) {
                final int steps = (_dragOffset / _step).truncate();
                final newEndTime = endTime.add(_stepDuration * steps);
                if (newEndTime
                    .isAfter(startTime.add(Duration(days: 1)).copyWith(
                          hour: 0,
                          minute: 0,
                          second: 0,
                        ))) {
                  return;
                }
                if (newEndTime.isAfter(startTime.add(_maximumDuration))) {
                  return;
                }
                if (newEndTime.isBefore(startTime.add(_minimumDuration))) {
                  return;
                }
                setState(() {
                  endTime = newEndTime;
                  _endTime = endTime;
                });
                _dragOffset -= steps * _step;
              }
            },
            child: Stack(
              alignment: Alignment.center,
              children: [
                CircleAvatar(radius: 3, backgroundColor: AppPalette.primary),
                CircleAvatar(
                  radius: 5,
                  backgroundColor: AppPalette.primary.withOpacity(0.2),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
