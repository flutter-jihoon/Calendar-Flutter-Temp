import 'package:calendar_flutter/core/utils/text_style_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TimetableTile extends StatelessWidget {
  final String title;
  const TimetableTile({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(4)),
      child: Center(child: Text(title, style: AppTextStyles.style14Bold())),
    );
  }
}
