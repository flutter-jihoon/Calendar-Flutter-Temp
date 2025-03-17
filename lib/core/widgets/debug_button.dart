import 'package:calendar_flutter/core/utils/color_util.dart';
import 'package:calendar_flutter/core/utils/text_style_util.dart';
import 'package:calendar_flutter/core/utils/log_util.dart';
import 'package:flutter/material.dart';

class DebugButton extends StatefulWidget {
  final Size screenSize;
  final EdgeInsets screenPadding;

  const DebugButton({
    required this.screenSize,
    required this.screenPadding,
    super.key,
  });

  @override
  State<DebugButton> createState() => _DebugButtonState();
}

class _DebugButtonState extends State<DebugButton> {
  late Offset _offset;
  late Offset _dragStartOffset;

  static const double buttonWidth = 65;
  static const double buttonHeight = 40;

  double get _horizontalLowerLimit => 0;
  double get _horizontalUpperLimit => widget.screenSize.width - buttonWidth;
  double get _verticalLowerLimit => widget.screenPadding.top;
  double get _verticalUpperLimit =>
      widget.screenSize.height - widget.screenPadding.bottom - buttonHeight;

  Offset _clampOffset(double x, double y) {
    return Offset(
      x.clamp(_horizontalLowerLimit, _horizontalUpperLimit),
      y.clamp(_verticalLowerLimit, _verticalUpperLimit),
    );
  }

  @override
  void initState() {
    super.initState();
    _offset = Offset(20, _verticalUpperLimit - 20);
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: _offset.dx,
      top: _offset.dy,
      child: GestureDetector(
        onPanStart: (details) {
          _dragStartOffset = details.localPosition;
        },
        onPanUpdate: (details) {
          setState(() {
            final double dx = details.localPosition.dx - _dragStartOffset.dx;
            final double dy = details.localPosition.dy - _dragStartOffset.dy;
            _offset = _clampOffset(_offset.dx + dx, _offset.dy + dy);
            _dragStartOffset = details.localPosition;
          });
        },
        child: ElevatedButton(
          onPressed: () {
            logger.i('디버그 버튼 탭');
          },
          style: ElevatedButton.styleFrom(
            elevation: 10,
            fixedSize: Size(buttonWidth, buttonHeight),
            padding: EdgeInsets.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            visualDensity: VisualDensity.compact,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          child: Text(
            '디버그',
            style: AppTextStyles.style16Bold(color: AppPalette.grey100),
          ),
        ),
      ),
    );
  }
}
