import 'package:calendar_flutter/core/widgets/calendar_app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

class CalendarAppAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize = Size.fromHeight(48);

  final String title;
  final bool isTopmost;
  final bool centerTitle;
  final Widget? leading;
  final List<Widget>? actions;

  CalendarAppAppBar({
    required this.title,
    this.isTopmost = false,
    this.centerTitle = true,
    this.leading,
    this.actions,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      centerTitle: centerTitle,
      leading: leading ??
          IconButton(
            icon: CalendarAppIcon.arrowLeftNavigation(24),
            onPressed: isTopmost ? SystemNavigator.pop : context.pop,
          ),
      actions: actions,
    );
  }
}
