import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

const double _kOuterRadius = 12.0;
const double _kInnerRadius = 9.0;

class CalendarAppRadio<T> extends StatefulWidget {
  const CalendarAppRadio({
    super.key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    this.mouseCursor,
    this.toggleable = false,
    this.activeColor,
    this.fillColor,
    this.focusColor,
    this.hoverColor,
    this.overlayColor,
    this.splashRadius,
    this.focusNode,
    this.autofocus = false,
  });

  final T value;
  final T? groupValue;
  final ValueChanged<T?>? onChanged;
  final MouseCursor? mouseCursor;
  final bool toggleable;
  final Color? activeColor;
  final WidgetStateProperty<Color?>? fillColor;
  final Color? focusColor;
  final Color? hoverColor;
  final WidgetStateProperty<Color?>? overlayColor;
  final double? splashRadius;
  final FocusNode? focusNode;
  final bool autofocus;
  bool get _selected => value == groupValue;

  @override
  State<CalendarAppRadio<T>> createState() => _CalendarAppRadioState<T>();
}

class _CalendarAppRadioState<T> extends State<CalendarAppRadio<T>>
    with TickerProviderStateMixin, ToggleableStateMixin {
  final _RadioPainter _painter = _RadioPainter();

  void _handleChanged(bool? selected) {
    if (selected == null) {
      widget.onChanged!(null);
      return;
    }
    if (selected) {
      widget.onChanged!(widget.value);
    }
  }

  @override
  void didUpdateWidget(CalendarAppRadio<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget._selected != oldWidget._selected) {
      animateToValue();
    }
  }

  @override
  void dispose() {
    _painter.dispose();
    super.dispose();
  }

  @override
  ValueChanged<bool?>? get onChanged =>
      widget.onChanged != null ? _handleChanged : null;

  @override
  bool get tristate => widget.toggleable;

  @override
  bool? get value => widget._selected;

  @override
  Duration? get reactionAnimationDuration => kRadialReactionDuration;

  WidgetStateProperty<Color?> get _widgetFillColor {
    return WidgetStateProperty.resolveWith((Set<WidgetState> states) {
      if (states.contains(WidgetState.disabled)) {
        return null;
      }
      if (states.contains(WidgetState.selected)) {
        return widget.activeColor;
      }
      return null;
    });
  }

  @override
  Widget build(BuildContext context) {
    final RadioThemeData radioTheme = RadioTheme.of(context);
    final RadioThemeData defaults = Theme.of(context).useMaterial3
        ? _RadioDefaultsM3(context)
        : _RadioDefaultsM2(context);
    final Size size = const Size(_kOuterRadius * 2, _kOuterRadius * 2);

    final WidgetStateProperty<MouseCursor> effectiveMouseCursor =
        WidgetStateProperty.resolveWith<MouseCursor>((Set<WidgetState> states) {
      return WidgetStateProperty.resolveAs<MouseCursor?>(
              widget.mouseCursor, states) ??
          radioTheme.mouseCursor?.resolve(states) ??
          WidgetStateProperty.resolveAs<MouseCursor>(
              WidgetStateMouseCursor.clickable, states);
    });

    final Set<WidgetState> activeStates = states..add(WidgetState.selected);
    final Set<WidgetState> inactiveStates = states
      ..remove(WidgetState.selected);
    final Color? activeColor = widget.fillColor?.resolve(activeStates) ??
        _widgetFillColor.resolve(activeStates) ??
        radioTheme.fillColor?.resolve(activeStates);
    final Color effectiveActiveColor =
        activeColor ?? defaults.fillColor!.resolve(activeStates)!;
    final Color? inactiveColor = widget.fillColor?.resolve(inactiveStates) ??
        _widgetFillColor.resolve(inactiveStates) ??
        radioTheme.fillColor?.resolve(inactiveStates);
    final Color effectiveInactiveColor =
        inactiveColor ?? defaults.fillColor!.resolve(inactiveStates)!;

    final Set<WidgetState> focusedStates = states..add(WidgetState.focused);
    Color effectiveFocusOverlayColor =
        widget.overlayColor?.resolve(focusedStates) ??
            widget.focusColor ??
            radioTheme.overlayColor?.resolve(focusedStates) ??
            defaults.overlayColor!.resolve(focusedStates)!;

    final Set<WidgetState> hoveredStates = states..add(WidgetState.hovered);
    Color effectiveHoverOverlayColor =
        widget.overlayColor?.resolve(hoveredStates) ??
            widget.hoverColor ??
            radioTheme.overlayColor?.resolve(hoveredStates) ??
            defaults.overlayColor!.resolve(hoveredStates)!;

    final Set<WidgetState> activePressedStates = activeStates
      ..add(WidgetState.pressed);
    final Color effectiveActivePressedOverlayColor =
        widget.overlayColor?.resolve(activePressedStates) ??
            radioTheme.overlayColor?.resolve(activePressedStates) ??
            activeColor?.withAlpha(kRadialReactionAlpha) ??
            defaults.overlayColor!.resolve(activePressedStates)!;

    final Set<WidgetState> inactivePressedStates = inactiveStates
      ..add(WidgetState.pressed);
    final Color effectiveInactivePressedOverlayColor =
        widget.overlayColor?.resolve(inactivePressedStates) ??
            radioTheme.overlayColor?.resolve(inactivePressedStates) ??
            inactiveColor?.withAlpha(kRadialReactionAlpha) ??
            defaults.overlayColor!.resolve(inactivePressedStates)!;

    if (downPosition != null) {
      effectiveHoverOverlayColor = states.contains(WidgetState.selected)
          ? effectiveActivePressedOverlayColor
          : effectiveInactivePressedOverlayColor;
      effectiveFocusOverlayColor = states.contains(WidgetState.selected)
          ? effectiveActivePressedOverlayColor
          : effectiveInactivePressedOverlayColor;
    }
    final bool? accessibilitySelected;

    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
      case TargetPlatform.linux:
      case TargetPlatform.windows:
        accessibilitySelected = null;
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
        accessibilitySelected = widget._selected;
    }

    return Semantics(
      inMutuallyExclusiveGroup: true,
      checked: widget._selected,
      selected: accessibilitySelected,
      child: buildToggleable(
        focusNode: widget.focusNode,
        autofocus: widget.autofocus,
        mouseCursor: effectiveMouseCursor,
        size: size,
        painter: _painter
          ..position = position
          ..reaction = reaction
          ..reactionFocusFade = reactionFocusFade
          ..reactionHoverFade = reactionHoverFade
          ..inactiveReactionColor = effectiveInactivePressedOverlayColor
          ..reactionColor = effectiveActivePressedOverlayColor
          ..hoverColor = effectiveHoverOverlayColor
          ..focusColor = effectiveFocusOverlayColor
          ..splashRadius = widget.splashRadius ??
              radioTheme.splashRadius ??
              kRadialReactionRadius
          ..downPosition = downPosition
          ..isFocused = states.contains(WidgetState.focused)
          ..isHovered = states.contains(WidgetState.hovered)
          ..activeColor = effectiveActiveColor
          ..inactiveColor = effectiveInactiveColor,
      ),
    );
  }
}

class _RadioPainter extends ToggleablePainter {
  @override
  void paint(Canvas canvas, Size size) {
    paintRadialReaction(canvas: canvas, origin: size.center(Offset.zero));

    final Offset center = (Offset.zero & size).center;

    final Paint paint = Paint()
      ..color = Color.lerp(inactiveColor, activeColor, position.value)!
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;
    canvas.drawCircle(center, _kOuterRadius, paint);

    if (!position.isDismissed) {
      paint.style = PaintingStyle.fill;
      canvas.drawCircle(center, _kInnerRadius * position.value, paint);
    }
  }
}

class _RadioDefaultsM2 extends RadioThemeData {
  _RadioDefaultsM2(this.context);

  final BuildContext context;
  late final ThemeData _theme = Theme.of(context);
  late final ColorScheme _colors = _theme.colorScheme;

  @override
  WidgetStateProperty<Color> get fillColor {
    return WidgetStateProperty.resolveWith((Set<WidgetState> states) {
      if (states.contains(WidgetState.disabled)) {
        return _theme.disabledColor;
      }
      if (states.contains(WidgetState.selected)) {
        return _colors.secondary;
      }
      return _theme.unselectedWidgetColor;
    });
  }

  @override
  WidgetStateProperty<Color> get overlayColor {
    return WidgetStateProperty.resolveWith((Set<WidgetState> states) {
      if (states.contains(WidgetState.pressed)) {
        return fillColor.resolve(states).withAlpha(kRadialReactionAlpha);
      }
      if (states.contains(WidgetState.hovered)) {
        return _theme.hoverColor;
      }
      if (states.contains(WidgetState.focused)) {
        return _theme.focusColor;
      }
      return Colors.transparent;
    });
  }

  @override
  MaterialTapTargetSize get materialTapTargetSize =>
      _theme.materialTapTargetSize;

  @override
  VisualDensity get visualDensity => _theme.visualDensity;
}

class _RadioDefaultsM3 extends RadioThemeData {
  _RadioDefaultsM3(this.context);

  final BuildContext context;
  late final ThemeData _theme = Theme.of(context);
  late final ColorScheme _colors = _theme.colorScheme;

  @override
  WidgetStateProperty<Color> get fillColor {
    return WidgetStateProperty.resolveWith((Set<WidgetState> states) {
      if (states.contains(WidgetState.selected)) {
        if (states.contains(WidgetState.disabled)) {
          return _colors.onSurface.withOpacity(0.38);
        }
        if (states.contains(WidgetState.pressed)) {
          return _colors.primary;
        }
        if (states.contains(WidgetState.hovered)) {
          return _colors.primary;
        }
        if (states.contains(WidgetState.focused)) {
          return _colors.primary;
        }
        return _colors.primary;
      }
      if (states.contains(WidgetState.disabled)) {
        return _colors.onSurface.withOpacity(0.38);
      }
      if (states.contains(WidgetState.pressed)) {
        return _colors.onSurface;
      }
      if (states.contains(WidgetState.hovered)) {
        return _colors.onSurface;
      }
      if (states.contains(WidgetState.focused)) {
        return _colors.onSurface;
      }
      return _colors.onSurfaceVariant;
    });
  }

  @override
  WidgetStateProperty<Color> get overlayColor {
    return WidgetStateProperty.resolveWith((Set<WidgetState> states) {
      if (states.contains(WidgetState.selected)) {
        if (states.contains(WidgetState.pressed)) {
          return _colors.onSurface.withOpacity(0.1);
        }
        if (states.contains(WidgetState.hovered)) {
          return _colors.primary.withOpacity(0.08);
        }
        if (states.contains(WidgetState.focused)) {
          return _colors.primary.withOpacity(0.1);
        }
        return Colors.transparent;
      }
      if (states.contains(WidgetState.pressed)) {
        return _colors.primary.withOpacity(0.1);
      }
      if (states.contains(WidgetState.hovered)) {
        return _colors.onSurface.withOpacity(0.08);
      }
      if (states.contains(WidgetState.focused)) {
        return _colors.onSurface.withOpacity(0.1);
      }
      return Colors.transparent;
    });
  }

  @override
  MaterialTapTargetSize get materialTapTargetSize =>
      _theme.materialTapTargetSize;

  @override
  VisualDensity get visualDensity => _theme.visualDensity;
}
