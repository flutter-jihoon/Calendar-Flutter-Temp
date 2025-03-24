import 'package:calendar_flutter/core/utils/color_util.dart';
import 'package:calendar_flutter/core/utils/text_style_util.dart';
import 'package:calendar_flutter/core/widgets/calendar_app_square_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CalendarScreenAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  @override
  final Size preferredSize = Size.fromHeight(48);

  final String title;
  final VoidCallback onExpandButtonPressed;
  final VoidCallback onTodayButtonPressed;
  final VoidCallback onMenuButtonPressed;
  final bool isExpanded;

  CalendarScreenAppBar({
    required this.title,
    required this.onExpandButtonPressed,
    required this.onTodayButtonPressed,
    required this.onMenuButtonPressed,
    required this.isExpanded,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      titleSpacing: 8,
      title: Row(
        children: [
          Text(title, style: AppTextStyles.style16Bold()),
          SizedBox(width: 2),
          InkWell(
            onTap: onExpandButtonPressed,
            customBorder: const CircleBorder(),
            child: AnimatedRotation(
              turns: isExpanded ? -0.5 : 0,
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeInOut,
              child: CalendarAppSquareIcon.chevronDown(20),
            ),
          ),
        ],
      ),
      centerTitle: false,
      leading: IconButton(
        icon: CalendarAppSquareIcon.arrowLeftNavigation(24),
        onPressed: SystemNavigator.pop,
      ),
      actions: [
        Container(
          padding: EdgeInsets.fromLTRB(8, 2, 2, 2),
          decoration: BoxDecoration(
            color: AppPalette.primary,
            borderRadius: BorderRadius.circular(13),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '캘린더',
                style: AppTextStyles.style13Medium(
                  color: AppPalette.grey100,
                ),
              ),
              SizedBox(width: 5),
              Container(
                padding: EdgeInsets.all(3),
                decoration: BoxDecoration(
                  color: AppPalette.grey100,
                  shape: BoxShape.circle,
                ),
                child: CalendarAppSquareIcon.calendar(16),
              ),
            ],
          ),
        ),
        SizedBox(width: 15),
        IconButton(
          onPressed: onTodayButtonPressed,
          icon: SizedBox(
            width: 24,
            height: 24,
            child: Center(
              child: Stack(
                children: [
                  Container(
                    width: 18,
                    height: 18,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppPalette.grey700,
                        width: 1.4,
                      ),
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  Positioned.fill(
                    left: -1.5,
                    child: Text(
                      DateTime.now().day.toString(),
                      style: AppTextStyles.style13Medium(letterSpacing: -1),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        IconButton(
          icon: CalendarAppSquareIcon.menu(24),
          onPressed: onMenuButtonPressed,
        ),
      ],
    );
  }
}
