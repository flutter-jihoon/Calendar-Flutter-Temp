// ignore_for_file: implementation_imports

import 'package:calendar_flutter/core/utils/color_util.dart';
import 'package:calendar_flutter/core/widgets/calendar_app_radio.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter/src/material/list_tile.dart';
import 'package:flutter/src/material/radio_theme.dart';
import 'package:flutter/src/material/theme.dart';
import 'package:flutter/src/material/theme_data.dart';

class CalendarAppRadioListTile<T> extends StatelessWidget {
  const CalendarAppRadioListTile({
    super.key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    this.mouseCursor,
    this.toggleable = false,
    this.activeColor,
    this.fillColor,
    this.hoverColor,
    this.overlayColor,
    this.splashRadius,
    this.materialTapTargetSize = MaterialTapTargetSize.shrinkWrap,
    this.title,
    this.subtitle,
    this.isThreeLine = false,
    this.dense,
    this.secondary,
    this.selected = false,
    this.controlAffinity = ListTileControlAffinity.platform,
    this.autofocus = false,
    this.contentPadding = EdgeInsets.zero,
    this.shape,
    this.tileColor,
    this.selectedTileColor,
    this.visualDensity,
    this.focusNode,
    this.onFocusChange,
    this.enableFeedback,
  });

  final T value;

  final T? groupValue;

  final ValueChanged<T?>? onChanged;

  final MouseCursor? mouseCursor;

  final bool toggleable;

  final Color? activeColor;

  final WidgetStateProperty<Color?>? fillColor;

  final MaterialTapTargetSize? materialTapTargetSize;

  final Color? hoverColor;

  final WidgetStateProperty<Color?>? overlayColor;

  final double? splashRadius;

  final Widget? title;

  final Widget? subtitle;

  final Widget? secondary;

  final bool isThreeLine;

  final bool? dense;

  final bool selected;

  final ListTileControlAffinity controlAffinity;

  final bool autofocus;

  final EdgeInsetsGeometry? contentPadding;

  bool get checked => value == groupValue;

  final ShapeBorder? shape;

  final Color? tileColor;

  final Color? selectedTileColor;

  final VisualDensity? visualDensity;

  final FocusNode? focusNode;

  final ValueChanged<bool>? onFocusChange;

  final bool? enableFeedback;

  @override
  Widget build(BuildContext context) {
    final Widget control;
    control = ExcludeFocus(
      child: CalendarAppRadio<T>(
        value: value,
        groupValue: groupValue,
        onChanged: onChanged,
        toggleable: toggleable,
        activeColor: activeColor,
        autofocus: autofocus,
        fillColor: WidgetStateProperty.resolveWith(
          (states) {
            return states.contains(WidgetState.selected)
                ? AppPalette.primary
                : AppPalette.grey300;
          },
        ),
        mouseCursor: mouseCursor,
        hoverColor: hoverColor,
        overlayColor: overlayColor,
        splashRadius: splashRadius,
      ),
    );

    Widget? leading, trailing;
    (leading, trailing) = switch (controlAffinity) {
      ListTileControlAffinity.leading || ListTileControlAffinity.platform => (
          control,
          secondary
        ),
      ListTileControlAffinity.trailing => (secondary, control),
    };
    final ThemeData theme = Theme.of(context);
    final RadioThemeData radioThemeData = RadioTheme.of(context);
    final Set<WidgetState> states = <WidgetState>{
      if (selected) WidgetState.selected,
    };
    final Color effectiveActiveColor = activeColor ??
        radioThemeData.fillColor?.resolve(states) ??
        theme.colorScheme.secondary;
    return MergeSemantics(
      child: ListTile(
        selectedColor: effectiveActiveColor,
        leading: leading,
        title: title,
        subtitle: subtitle,
        trailing: trailing,
        isThreeLine: isThreeLine,
        dense: dense,
        enabled: onChanged != null,
        shape: shape,
        tileColor: tileColor,
        selectedTileColor: selectedTileColor,
        onTap: onChanged != null
            ? () {
                if (toggleable && checked) {
                  onChanged!(null);
                  return;
                }
                if (!checked) {
                  onChanged!(value);
                }
              }
            : null,
        selected: selected,
        autofocus: autofocus,
        contentPadding: contentPadding,
        visualDensity: VisualDensity(
          horizontal: VisualDensity.minimumDensity,
          vertical: VisualDensity.minimumDensity,
        ),
        focusNode: focusNode,
        onFocusChange: onFocusChange,
        enableFeedback: enableFeedback,
      ),
    );
  }
}
