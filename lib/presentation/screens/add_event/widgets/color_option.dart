import 'package:calendar_flutter/core/utils/color_util.dart';
import 'package:flutter/material.dart';

class ColorOption extends StatelessWidget {
  final Color color;
  final bool value;
  final ValueChanged<bool?>? onChanged;

  const ColorOption({
    required this.color,
    required this.value,
    required this.onChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 1.5,
      child: Checkbox(
        checkColor: AppPalette.grey100,
        fillColor: WidgetStateProperty.all(color),
        side: BorderSide.none,
        value: value,
        shape: CircleBorder(),
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        visualDensity: VisualDensity(
          horizontal: VisualDensity.minimumDensity,
          vertical: VisualDensity.minimumDensity,
        ),
        onChanged: onChanged,
      ),
    );
  }
}
