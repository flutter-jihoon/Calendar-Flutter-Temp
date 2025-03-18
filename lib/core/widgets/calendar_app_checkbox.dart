import 'package:calendar_flutter/core/utils/color_util.dart';
import 'package:flutter/material.dart';

class CalendarAppCheckbox extends StatefulWidget {
  const CalendarAppCheckbox({
    super.key,
    required this.value,
    this.tristate = false,
    required this.onChanged,
    this.mouseCursor,
    this.fillColor,
    this.checkColor,
    this.focusColor,
    this.hoverColor,
    this.overlayColor,
    this.splashRadius,
    this.focusNode,
    this.autofocus = false,
    this.isError = false,
    this.semanticLabel,
  }) : assert(tristate || value != null);

  final bool? value;
  final ValueChanged<bool?>? onChanged;
  final MouseCursor? mouseCursor;
  final WidgetStateProperty<Color?>? fillColor;
  final Color? checkColor;
  final bool tristate;
  final Color? focusColor;
  final Color? hoverColor;
  final WidgetStateProperty<Color?>? overlayColor;
  final double? splashRadius;
  final FocusNode? focusNode;
  final bool autofocus;
  final bool isError;
  final String? semanticLabel;
  static const double width = 20;

  @override
  State<CalendarAppCheckbox> createState() => _CalendarAppCheckboxState();
}

class _CalendarAppCheckboxState extends State<CalendarAppCheckbox>
    with TickerProviderStateMixin, ToggleableStateMixin {
  final _CheckboxPainter _painter = _CheckboxPainter();
  bool? _previousValue;

  @override
  void initState() {
    super.initState();
    _previousValue = widget.value;
  }

  @override
  void didUpdateWidget(CalendarAppCheckbox oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.value != widget.value) {
      _previousValue = oldWidget.value;
      animateToValue();
    }
  }

  @override
  void dispose() {
    _painter.dispose();
    super.dispose();
  }

  @override
  ValueChanged<bool?>? get onChanged => widget.onChanged;

  @override
  bool get tristate => widget.tristate;

  @override
  bool? get value => widget.value;

  @override
  Duration? get reactionAnimationDuration => kRadialReactionDuration;

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasMaterial(context));
    final CheckboxThemeData checkboxTheme = CheckboxTheme.of(context);
    final CheckboxThemeData defaults = Theme.of(context).useMaterial3
        ? _CheckboxDefaultsM3(context)
        : _CheckboxDefaultsM2(context);

    final WidgetStateProperty<MouseCursor> effectiveMouseCursor =
        WidgetStateProperty.resolveWith<MouseCursor>((Set<WidgetState> states) {
      return WidgetStateProperty.resolveAs<MouseCursor?>(
              widget.mouseCursor, states) ??
          checkboxTheme.mouseCursor?.resolve(states) ??
          WidgetStateMouseCursor.clickable.resolve(states);
    });

    final Set<WidgetState> activeStates = states..add(WidgetState.selected);
    final Set<WidgetState> inactiveStates = states
      ..remove(WidgetState.selected);
    if (widget.isError) {
      activeStates.add(WidgetState.error);
      inactiveStates.add(WidgetState.error);
    }

    final Set<WidgetState> focusedStates = states..add(WidgetState.focused);
    if (widget.isError) {
      focusedStates.add(WidgetState.error);
    }
    Color effectiveFocusOverlayColor =
        widget.overlayColor?.resolve(focusedStates) ??
            widget.focusColor ??
            checkboxTheme.overlayColor?.resolve(focusedStates) ??
            defaults.overlayColor!.resolve(focusedStates)!;

    final Set<WidgetState> hoveredStates = states..add(WidgetState.hovered);
    if (widget.isError) {
      hoveredStates.add(WidgetState.error);
    }
    Color effectiveHoverOverlayColor =
        widget.overlayColor?.resolve(hoveredStates) ??
            widget.hoverColor ??
            checkboxTheme.overlayColor?.resolve(hoveredStates) ??
            defaults.overlayColor!.resolve(hoveredStates)!;

    final Color effectiveActivePressedOverlayColor =
        AppPalette.primary.withAlpha(kRadialReactionAlpha);

    final Set<WidgetState> inactivePressedStates = inactiveStates
      ..add(WidgetState.pressed);
    final Color effectiveInactivePressedOverlayColor =
        widget.overlayColor?.resolve(inactivePressedStates) ??
            checkboxTheme.overlayColor?.resolve(inactivePressedStates) ??
            AppPalette.grey100.withAlpha(kRadialReactionAlpha);

    if (downPosition != null) {
      effectiveHoverOverlayColor = states.contains(WidgetState.selected)
          ? effectiveActivePressedOverlayColor
          : effectiveInactivePressedOverlayColor;
      effectiveFocusOverlayColor = states.contains(WidgetState.selected)
          ? effectiveActivePressedOverlayColor
          : effectiveInactivePressedOverlayColor;
    }

    final double effectiveSplashRadius = widget.splashRadius ??
        checkboxTheme.splashRadius ??
        defaults.splashRadius!;

    return Semantics(
      label: widget.semanticLabel,
      checked: widget.value ?? false,
      mixed: widget.tristate ? widget.value == null : null,
      child: buildToggleable(
        mouseCursor: effectiveMouseCursor,
        focusNode: widget.focusNode,
        autofocus: widget.autofocus,
        size: Size(24, 24),
        painter: _painter
          ..position = position
          ..reaction = reaction
          ..reactionFocusFade = reactionFocusFade
          ..reactionHoverFade = reactionHoverFade
          ..inactiveReactionColor = effectiveInactivePressedOverlayColor
          ..reactionColor = effectiveActivePressedOverlayColor
          ..hoverColor = effectiveHoverOverlayColor
          ..focusColor = effectiveFocusOverlayColor
          ..splashRadius = effectiveSplashRadius
          ..downPosition = downPosition
          ..isFocused = states.contains(WidgetState.focused)
          ..isHovered = states.contains(WidgetState.hovered)
          ..activeColor = AppPalette.primary
          ..inactiveColor = AppPalette.grey100
          ..checkColor = AppPalette.grey100
          ..value = value
          ..previousValue = _previousValue
          ..shape = RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(4)),
          )
          ..activeSide = BorderSide.none
          ..inactiveSide = BorderSide(width: 1.3, color: AppPalette.grey400),
      ),
    );
  }
}

const double _kEdgeSize = CalendarAppCheckbox.width;
const double _kStrokeWidth = 1.5;

class _CheckboxPainter extends ToggleablePainter {
  Color get checkColor => _checkColor!;
  Color? _checkColor;
  set checkColor(Color value) {
    if (_checkColor == value) {
      return;
    }
    _checkColor = value;
    notifyListeners();
  }

  bool? get value => _value;
  bool? _value;
  set value(bool? value) {
    if (_value == value) {
      return;
    }
    _value = value;
    notifyListeners();
  }

  bool? get previousValue => _previousValue;
  bool? _previousValue;
  set previousValue(bool? value) {
    if (_previousValue == value) {
      return;
    }
    _previousValue = value;
    notifyListeners();
  }

  OutlinedBorder get shape => _shape!;
  OutlinedBorder? _shape;
  set shape(OutlinedBorder value) {
    if (_shape == value) {
      return;
    }
    _shape = value;
    notifyListeners();
  }

  BorderSide get activeSide => _activeSide!;
  BorderSide? _activeSide;
  set activeSide(BorderSide value) {
    if (_activeSide == value) {
      return;
    }
    _activeSide = value;
    notifyListeners();
  }

  BorderSide get inactiveSide => _inactiveSide!;
  BorderSide? _inactiveSide;
  set inactiveSide(BorderSide value) {
    if (_inactiveSide == value) {
      return;
    }
    _inactiveSide = value;
    notifyListeners();
  }

  Rect _outerRectAt(Offset origin, double t) {
    final double inset = 1.0 - (t - 0.5).abs() * 2.0;
    final double size = _kEdgeSize - inset * _kStrokeWidth;
    final Rect rect =
        Rect.fromLTWH(origin.dx + inset, origin.dy + inset, size, size);
    return rect;
  }

  Color _colorAt(double t) {
    return t >= 0.25
        ? activeColor
        : Color.lerp(inactiveColor, activeColor, t * 4.0)!;
  }

  Paint _createStrokePaint() {
    return Paint()
      ..color = checkColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = _kStrokeWidth;
  }

  void _drawBox(Canvas canvas, Rect outer, Paint paint, BorderSide? side) {
    canvas.drawPath(shape.getOuterPath(outer), paint);
    if (side != null) {
      shape.copyWith(side: side).paint(canvas, outer);
    }
  }

  void _drawCheck(Canvas canvas, Offset origin, double t, Paint paint) {
    assert(t >= 0.0 && t <= 1.0);

    final Path path = Path();

    final double x1 = 1 + (_kEdgeSize - 12) / 2,
        y1 = 5.625 + (_kEdgeSize - 11) / 2;
    final double x2 = 4.367 + (_kEdgeSize - 12) / 2,
        y2 = 10 + (_kEdgeSize - 11) / 2;
    final double x3 = 11 + (_kEdgeSize - 12) / 2,
        y3 = 1 + (_kEdgeSize - 11) / 2;

    path.moveTo(origin.dx + x1, origin.dy + y1);
    path.lineTo(
      origin.dx + x1 + (x2 - x1) * t,
      origin.dy + y1 + (y2 - y1) * t,
    );
    path.lineTo(
      origin.dx + x2 + (x3 - x2) * t,
      origin.dy + y2 + (y3 - y2) * t,
    );

    // 둥근 모서리 적용
    paint.strokeCap = StrokeCap.round;
    paint.strokeJoin = StrokeJoin.round;

    canvas.drawPath(path, paint);
  }

  void _drawDash(Canvas canvas, Offset origin, double t, Paint paint) {
    assert(t >= 0.0 && t <= 1.0);

    const Offset start = Offset(_kEdgeSize * 0.2, _kEdgeSize * 0.5);
    const Offset mid = Offset(_kEdgeSize * 0.5, _kEdgeSize * 0.5);
    const Offset end = Offset(_kEdgeSize * 0.8, _kEdgeSize * 0.5);
    final Offset drawStart = Offset.lerp(start, mid, 1.0 - t)!;
    final Offset drawEnd = Offset.lerp(mid, end, t)!;
    canvas.drawLine(origin + drawStart, origin + drawEnd, paint);
  }

  @override
  void paint(Canvas canvas, Size size) {
    paintRadialReaction(canvas: canvas, origin: size.center(Offset.zero));

    final Paint strokePaint = _createStrokePaint();
    final Offset origin =
        size / 2.0 - const Size.square(_kEdgeSize) / 2.0 as Offset;
    final double tNormalized = switch (position.status) {
      AnimationStatus.forward || AnimationStatus.completed => position.value,
      AnimationStatus.reverse ||
      AnimationStatus.dismissed =>
        1.0 - position.value,
    };

    if (previousValue == false || value == false) {
      final double t = value == false ? 1.0 - tNormalized : tNormalized;
      final Rect outer = _outerRectAt(origin, t);
      final Paint paint = Paint()..color = _colorAt(t);

      if (t <= 0.5) {
        final BorderSide border = BorderSide.lerp(inactiveSide, activeSide, t);
        _drawBox(canvas, outer, paint, border);
      } else {
        _drawBox(canvas, outer, paint, activeSide);
        final double tShrink = (t - 0.5) * 2.0;
        if (previousValue == null || value == null) {
          _drawDash(canvas, origin, tShrink, strokePaint);
        } else {
          _drawCheck(canvas, origin, tShrink, strokePaint);
        }
      }
    } else {
      final Rect outer = _outerRectAt(origin, 1.0);
      final Paint paint = Paint()..color = _colorAt(1.0);

      _drawBox(canvas, outer, paint, activeSide);
      if (tNormalized <= 0.5) {
        final double tShrink = 1.0 - tNormalized * 2.0;
        if (previousValue ?? false) {
          _drawCheck(canvas, origin, tShrink, strokePaint);
        } else {
          _drawDash(canvas, origin, tShrink, strokePaint);
        }
      } else {
        final double tExpand = (tNormalized - 0.5) * 2.0;
        if (value ?? false) {
          _drawCheck(canvas, origin, tExpand, strokePaint);
        } else {
          _drawDash(canvas, origin, tExpand, strokePaint);
        }
      }
    }
  }
}

class _CheckboxDefaultsM2 extends CheckboxThemeData {
  _CheckboxDefaultsM2(BuildContext context)
      : _theme = Theme.of(context),
        _colors = Theme.of(context).colorScheme;

  final ThemeData _theme;
  final ColorScheme _colors;

  @override
  WidgetStateBorderSide? get side {
    return WidgetStateBorderSide.resolveWith((Set<WidgetState> states) {
      if (states.contains(WidgetState.disabled)) {
        if (states.contains(WidgetState.selected)) {
          return const BorderSide(width: 2.0, color: Colors.transparent);
        }
        return BorderSide(width: 2.0, color: _theme.disabledColor);
      }
      if (states.contains(WidgetState.selected)) {
        return const BorderSide(width: 2.0, color: Colors.transparent);
      }
      return BorderSide(width: 2.0, color: _theme.unselectedWidgetColor);
    });
  }

  @override
  WidgetStateProperty<Color> get fillColor {
    return WidgetStateProperty.resolveWith((Set<WidgetState> states) {
      if (states.contains(WidgetState.disabled)) {
        if (states.contains(WidgetState.selected)) {
          return _theme.disabledColor;
        }
        return Colors.transparent;
      }
      if (states.contains(WidgetState.selected)) {
        return _colors.secondary;
      }
      return Colors.transparent;
    });
  }

  @override
  WidgetStateProperty<Color> get checkColor {
    return WidgetStateProperty.all<Color>(const Color(0xFFFFFFFF));
  }

  @override
  WidgetStateProperty<Color?> get overlayColor {
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
  double get splashRadius => kRadialReactionRadius;

  @override
  MaterialTapTargetSize get materialTapTargetSize =>
      _theme.materialTapTargetSize;

  @override
  VisualDensity get visualDensity => _theme.visualDensity;

  @override
  OutlinedBorder get shape => const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(1.0)));
}

class _CheckboxDefaultsM3 extends CheckboxThemeData {
  _CheckboxDefaultsM3(BuildContext context)
      : _theme = Theme.of(context),
        _colors = Theme.of(context).colorScheme;

  final ThemeData _theme;
  final ColorScheme _colors;

  @override
  WidgetStateBorderSide? get side {
    return WidgetStateBorderSide.resolveWith((Set<WidgetState> states) {
      if (states.contains(WidgetState.disabled)) {
        if (states.contains(WidgetState.selected)) {
          return const BorderSide(width: 2.0, color: Colors.transparent);
        }
        return BorderSide(
            width: 2.0, color: _colors.onSurface.withOpacity(0.38));
      }
      if (states.contains(WidgetState.selected)) {
        return const BorderSide(width: 0.0, color: Colors.transparent);
      }
      if (states.contains(WidgetState.error)) {
        return BorderSide(width: 2.0, color: _colors.error);
      }
      if (states.contains(WidgetState.pressed)) {
        return BorderSide(width: 2.0, color: _colors.onSurface);
      }
      if (states.contains(WidgetState.hovered)) {
        return BorderSide(width: 2.0, color: _colors.onSurface);
      }
      if (states.contains(WidgetState.focused)) {
        return BorderSide(width: 2.0, color: _colors.onSurface);
      }
      return BorderSide(width: 2.0, color: _colors.onSurfaceVariant);
    });
  }

  @override
  WidgetStateProperty<Color> get fillColor {
    return WidgetStateProperty.resolveWith((Set<WidgetState> states) {
      if (states.contains(WidgetState.disabled)) {
        if (states.contains(WidgetState.selected)) {
          return _colors.onSurface.withOpacity(0.38);
        }
        return Colors.transparent;
      }
      if (states.contains(WidgetState.selected)) {
        if (states.contains(WidgetState.error)) {
          return _colors.error;
        }
        return _colors.primary;
      }
      return Colors.transparent;
    });
  }

  @override
  WidgetStateProperty<Color> get checkColor {
    return WidgetStateProperty.resolveWith((Set<WidgetState> states) {
      if (states.contains(WidgetState.disabled)) {
        if (states.contains(WidgetState.selected)) {
          return _colors.surface;
        }
        return Colors.transparent;
      }
      if (states.contains(WidgetState.selected)) {
        if (states.contains(WidgetState.error)) {
          return _colors.onError;
        }
        return _colors.onPrimary;
      }
      return Colors.transparent;
    });
  }

  @override
  WidgetStateProperty<Color> get overlayColor {
    return WidgetStateProperty.resolveWith((Set<WidgetState> states) {
      if (states.contains(WidgetState.error)) {
        if (states.contains(WidgetState.pressed)) {
          return _colors.error.withOpacity(0.1);
        }
        if (states.contains(WidgetState.hovered)) {
          return _colors.error.withOpacity(0.08);
        }
        if (states.contains(WidgetState.focused)) {
          return _colors.error.withOpacity(0.1);
        }
      }
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
  double get splashRadius => 40.0 / 2;

  @override
  MaterialTapTargetSize get materialTapTargetSize =>
      _theme.materialTapTargetSize;

  @override
  VisualDensity get visualDensity => _theme.visualDensity;

  @override
  OutlinedBorder get shape => const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(2.0)),
      );
}
