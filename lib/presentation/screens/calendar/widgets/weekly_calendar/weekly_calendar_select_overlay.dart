import 'package:calendar_flutter/core/enums/day_of_the_week.dart';
import 'package:calendar_flutter/core/utils/color_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class WeeklyCalendarSelectOverlay extends StatefulWidget {
  final DayOfTheWeek? selectedDayOfWeek;
  final int? selectedStartHour;
  final int? selectedEndHour;

  const WeeklyCalendarSelectOverlay({
    required this.selectedDayOfWeek,
    required this.selectedStartHour,
    required this.selectedEndHour,
    super.key,
  });

  @override
  State<WeeklyCalendarSelectOverlay> createState() =>
      _WeeklyCalendarSelectOverlayState();
}

class _WeeklyCalendarSelectOverlayState
    extends State<WeeklyCalendarSelectOverlay> {
  double selectionHeight = 70.0;
  double _dragOffset = 0.0;

  @override
  Widget build(BuildContext context) {
    final double timeColumnWidth = MediaQuery.sizeOf(context).width * 0.105;
    final double width =
        (MediaQuery.sizeOf(context).width - timeColumnWidth) / 7;

    if (widget.selectedDayOfWeek == null ||
        widget.selectedStartHour == null ||
        widget.selectedEndHour == null) {
      return Container();
    }

    return Positioned(
      left: timeColumnWidth + width * widget.selectedDayOfWeek!.index,
      top: 70 * widget.selectedStartHour!.toDouble(),
      child: _buildSelectOverlayWidget(),
    );
  }

  Widget _buildSelectOverlayWidget() {
    final double timeColumnWidth = MediaQuery.sizeOf(context).width * 0.105;
    final double width =
        (MediaQuery.sizeOf(context).width - timeColumnWidth) / 7;

    return Stack(
      clipBehavior: Clip.none,
      children: [
        IgnorePointer(
          child: AnimatedContainer(
            width: width,
            height: selectionHeight,
            duration: const Duration(milliseconds: 100),
            curve: Curves.easeInOut,
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
          child: _buildDragDot(),
        ),
        Positioned(
          right: -5,
          bottom: -5,
          child: GestureDetector(
            onPanDown: (_) => HapticFeedback.mediumImpact(),
            onVerticalDragUpdate: (details) {
              _dragOffset += details.primaryDelta!;
              const step = 17.5;

              if (_dragOffset.abs() >= step) {
                HapticFeedback.lightImpact();
                final int steps = (_dragOffset / step).truncate();
                final double newHeight =
                    (selectionHeight + steps * step).clamp(25.0, 700.0);
                setState(() => selectionHeight = newHeight);
                _dragOffset -= steps * step;
              }
            },
            child: _buildDragDot(),
          ),
        ),
      ],
    );
  }

  Widget _buildDragDot() {
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
