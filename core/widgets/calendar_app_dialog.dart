import 'package:calendar_flutter/core/utils/text_style_util.dart';
import 'package:calendar_flutter/core/widgets/calendar_app_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CalendarAppDialog extends StatelessWidget {
  final String? title;
  final String? subtitle;
  final Widget? content;
  final String primaryButtonText;
  final String? secondaryButtonText;

  const CalendarAppDialog({
    required this.title,
    this.subtitle,
    this.content,
    required this.primaryButtonText,
    this.secondaryButtonText,
    super.key,
  });

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
            if (title != null)
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    title!,
                    style: AppTextStyles.style16Bold(),
                  ),
                  SizedBox(height: 12),
                ],
              ),
            if (subtitle != null)
              Text(
                subtitle!,
                style: AppTextStyles.style15Regular(height: 1.4),
                textAlign: TextAlign.center,
              ),
            if (content != null) content!,
            SizedBox(height: 28),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (secondaryButtonText != null)
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: CalendarAppButton(
                            onPressed: () => context.pop(false),
                            text: secondaryButtonText!,
                            buttonType: ButtonType.grey,
                          ),
                        ),
                        SizedBox(width: 8),
                      ],
                    ),
                  ),
                Expanded(
                  child: CalendarAppButton(
                    onPressed: () => context.pop(true),
                    text: primaryButtonText,
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
