import 'package:calendar_flutter/core/utils/color_util.dart';
import 'package:calendar_flutter/core/utils/text_style_util.dart';
import 'package:flutter/material.dart';

class SettingRadioButton<T> extends StatelessWidget {
  final T value;
  final T groupValue;
  final ValueChanged<T?> onChanged;
  final String text;

  const SettingRadioButton({
    required this.value,
    required this.groupValue,
    required this.onChanged,
    required this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bool isSelected = value == groupValue; // 현재 버튼이 선택되었는지 확인

    return TextButton(
      onPressed: () => onChanged(value), // 클릭 시 값 변경
      style: TextButton.styleFrom(
        minimumSize: Size.zero,
        backgroundColor: isSelected ? AppPalette.grey700 : AppPalette.grey100,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: AppPalette.grey300,
            width: isSelected ? 0 : 1,
          ),
          borderRadius: BorderRadius.circular(50),
        ),
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 9),
      ),
      child: Text(
        text,
        style: isSelected
            ? AppTextStyles.style16Medium(color: AppPalette.grey100)
            : AppTextStyles.style16Regular(),
      ),
    );
  }
}
