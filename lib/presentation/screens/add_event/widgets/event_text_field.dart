import 'package:calendar_flutter/core/utils/color_util.dart';
import 'package:calendar_flutter/core/utils/text_style_util.dart';
import 'package:flutter/material.dart';

class EventTextField extends StatefulWidget {
  final String? label;
  final int maxLength;
  final TextEditingController controller;

  const EventTextField({
    this.label,
    required this.maxLength,
    required this.controller,
    super.key,
  });

  @override
  State<EventTextField> createState() => _EventTextFieldState();
}

class _EventTextFieldState extends State<EventTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Stack(
        children: [
          TextField(
            controller: widget.controller,
            onTapOutside: (event) {
              FocusManager.instance.primaryFocus?.unfocus();
            },
            style: AppTextStyles.style16Regular(),
            maxLines: null,
            maxLength: widget.maxLength,
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppPalette.primary),
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppPalette.transparent),
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
              contentPadding: EdgeInsets.symmetric(
                horizontal: 60,
                vertical: 20,
              ),
              counterText: '',
            ),
          ),
          if (widget.label != null)
            Positioned.fill(
              right: null,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                child: Center(
                  child: Text(
                    widget.label!,
                    style: AppTextStyles.style16Regular(),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
