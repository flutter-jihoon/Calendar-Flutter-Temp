import 'package:calendar_flutter/core/utils/text_style_util.dart';
import 'package:calendar_flutter/core/widgets/calendar_app_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CalendarAppInputDialog extends StatefulWidget {
  final String? title;
  final String hintText;
  final String primaryButtonText;
  final String? secondaryButtonText;

  const CalendarAppInputDialog({
    required this.title,
    required this.hintText,
    required this.primaryButtonText,
    this.secondaryButtonText,
    super.key,
  });

  @override
  State<CalendarAppInputDialog> createState() => _CalendarAppInputDialogState();
}

class _CalendarAppInputDialogState extends State<CalendarAppInputDialog> {
  late TextEditingController _textEditingController;

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _textEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 32, 16, 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (widget.title != null)
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    widget.title!,
                    style: AppTextStyles.style16Bold(),
                  ),
                  SizedBox(height: 12),
                ],
              ),
            TextField(
              controller: _textEditingController,
              decoration: InputDecoration(
                hintText: widget.hintText,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 11,
                ),
              ),
            ),
            SizedBox(height: 28),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (widget.secondaryButtonText != null)
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: CalendarAppButton(
                            onPressed: () => context.pop(null),
                            text: widget.secondaryButtonText!,
                            buttonType: ButtonType.grey,
                          ),
                        ),
                        SizedBox(width: 8),
                      ],
                    ),
                  ),
                Expanded(
                  child: CalendarAppButton(
                    onPressed: () => context.pop(_textEditingController.text),
                    text: widget.primaryButtonText,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
