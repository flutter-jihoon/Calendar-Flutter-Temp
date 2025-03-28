import 'package:calendar_flutter/core/utils/color_util.dart';
import 'package:calendar_flutter/core/utils/log_util.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

const Duration _bottomSheetEnterDuration = Duration(milliseconds: 250);
const Duration _bottomSheetExitDuration = Duration(milliseconds: 200);
const double _minFlingVelocity = 700.0;
const double _closeProgressThreshold = 0.5;

class MinimizableBottomSheet extends StatefulWidget {
  const MinimizableBottomSheet({
    super.key,
    this.animationController,
    this.enableDrag = true,
    this.showDragHandle,
    this.dragHandleColor,
    this.dragHandleSize,
    this.onDragStart,
    this.onDragEnd,
    this.backgroundColor,
    this.shadowColor,
    this.elevation,
    this.shape,
    this.clipBehavior,
    this.constraints,
    required this.onClosing,
    required this.builder,
  }) : assert(elevation == null || elevation >= 0.0);

  final AnimationController? animationController;
  final VoidCallback onClosing;
  final WidgetBuilder builder;
  final bool enableDrag;
  final bool? showDragHandle;
  final Color? dragHandleColor;
  final Size? dragHandleSize;
  final BottomSheetDragStartHandler? onDragStart;
  final BottomSheetDragEndHandler? onDragEnd;
  final Color? backgroundColor;
  final Color? shadowColor;
  final double? elevation;
  final ShapeBorder? shape;
  final Clip? clipBehavior;
  final BoxConstraints? constraints;

  @override
  State<MinimizableBottomSheet> createState() => _MinimizableBottomSheetState();

  static AnimationController createAnimationController(
    TickerProvider vsync, {
    AnimationStyle? sheetAnimationStyle,
  }) {
    return AnimationController(
      duration: sheetAnimationStyle?.duration ?? _bottomSheetEnterDuration,
      reverseDuration:
          sheetAnimationStyle?.reverseDuration ?? _bottomSheetExitDuration,
      debugLabel: 'MinimizableBottomSheet',
      vsync: vsync,
    );
  }
}

class _MinimizableBottomSheetState extends State<MinimizableBottomSheet> {
  final GlobalKey _childKey =
      GlobalKey(debugLabel: 'MinimizedBottomSheet child');

  bool isMinimized = false;

  double get _childHeight {
    final RenderBox renderBox =
        _childKey.currentContext!.findRenderObject()! as RenderBox;
    return renderBox.size.height;
  }

  bool get _dismissUnderway =>
      widget.animationController!.status == AnimationStatus.reverse;

  Set<WidgetState> dragHandleMaterialState = <WidgetState>{};

  // 드래그 시작 시 상태 처리
  void _handleDragStart(DragStartDetails details) {
    setState(() {
      dragHandleMaterialState.add(WidgetState.dragged);
    });
    widget.onDragStart?.call(details);
  }

  // 드래그 업데이트 시 처리
  void _handleDragUpdate(DragUpdateDetails details) {
    assert(
      (widget.enableDrag || (widget.showDragHandle ?? false)) &&
          widget.animationController != null,
      "'MinimizedBottomSheet.animationController' cannot be null when 'MinimizedBottomSheet.enableDrag' or 'MinimizedBottomSheet.showDragHandle' is true. "
      "Use 'MinimizedBottomSheet.createAnimationController' to create one, or provide another AnimationController.",
    );
    if (_dismissUnderway) {
      return;
    }
    if (isMinimized) {
      if (details.primaryDelta! < 0) {
        // 위로 드래그만 허용
        widget.animationController!.value -=
            details.primaryDelta! / _childHeight;
      }
    } else {
      // isMinimized가 아닐 때는 전체적으로 드래그 가능
      if (details.primaryDelta! > -10) {
        widget.animationController!.value -=
            details.primaryDelta! / _childHeight;
      }
    }
  }

  // 드래그 종료 시 처리
  void _handleDragEnd(DragEndDetails details) {
    assert(
      (widget.enableDrag || (widget.showDragHandle ?? false)) &&
          widget.animationController != null,
      "'BottomSheet.animationController' cannot be null when 'BottomSheet.enableDrag' or 'BottomSheet.showDragHandle' is true. "
      "Use 'BottomSheet.createAnimationController' to create one, or provide another AnimationController.",
    );
    if (_dismissUnderway) {
      return;
    }
    setState(() {
      dragHandleMaterialState.remove(WidgetState.dragged);
    });
    if (details.velocity.pixelsPerSecond.dy > _minFlingVelocity) {
      final double flingVelocity =
          -details.velocity.pixelsPerSecond.dy / _childHeight;
      if (widget.animationController!.value > 0.0) {
        widget.animationController!.fling(velocity: flingVelocity);
      }
      if (flingVelocity < 0.0) {
        onMinimizing();
      }
      if (flingVelocity > 0.0) {
        onMaximizing();
      }
    } else if (widget.animationController!.value < _closeProgressThreshold) {
      if (widget.animationController!.value > 0.0) {
        // 축소 상태로 전환
        onMinimizing();
      }
    } else if (widget.animationController!.value > _closeProgressThreshold) {
      if (widget.animationController!.value > 0.0) {
        // 확장 상태로 전환
        onMaximizing();
      }
    } else {
      widget.animationController!.forward();
    }

    widget.onDragEnd?.call(details, isClosing: false);
  }

  bool extentChanged(DraggableScrollableNotification notification) {
    if (notification.extent == notification.minExtent &&
        notification.shouldCloseOnMinExtent) {
      onMinimizing();
    }
    return false;
  }

  void onMinimizing() {
    logger.i('바텀시트 끄기');
    setState(() => isMinimized = true);
    widget.animationController!.forward();
  }

  void onMaximizing() {
    setState(() => isMinimized = false);
    widget.animationController!.forward();
  }

  @override
  Widget build(BuildContext context) {
    final BottomSheetThemeData bottomSheetTheme =
        Theme.of(context).bottomSheetTheme;
    final bool useMaterial3 = Theme.of(context).useMaterial3;
    final BottomSheetThemeData defaults = useMaterial3
        ? _BottomSheetDefaultsM3(context)
        : const BottomSheetThemeData();
    final BoxConstraints? constraints = widget.constraints ??
        bottomSheetTheme.constraints ??
        defaults.constraints;
    final bool showDragHandle = widget.showDragHandle ??
        (widget.enableDrag && (bottomSheetTheme.showDragHandle ?? false));

    Widget? dragHandle;
    if (showDragHandle) {
      dragHandle = isMinimized
          ? GestureDetector(
              onTap: () => setState(() => isMinimized = false),
              child: Icon(Icons.keyboard_arrow_up_rounded, size: 24),
            )
          : Icon(Icons.minimize_rounded, size: 24);

      if (!widget.enableDrag) {
        dragHandle = _BottomSheetGestureDetector(
          onVerticalDragStart: _handleDragStart,
          onVerticalDragUpdate: _handleDragUpdate,
          onVerticalDragEnd: _handleDragEnd,
          onTap: isMinimized ? () => setState(() => isMinimized = false) : null,
          child: dragHandle,
        );
      }
    }

    final Widget child = AnimatedOpacity(
      opacity: isMinimized ? 0.0 : 1.0,
      duration: const Duration(seconds: 1),
      curve: Curves.easeInOut,
      child: widget.builder(context),
    );

    Widget bottomSheet = Material(
      key: _childKey,
      child: Container(
        decoration: BoxDecoration(
          color: AppPalette.grey100,
          borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
          boxShadow: [
            BoxShadow(
              color: AppPalette.grey800.withOpacity(0.25),
              blurRadius: 4,
              spreadRadius: 0,
            )
          ],
        ),
        child: NotificationListener<DraggableScrollableNotification>(
          onNotification: extentChanged,
          child: AnimatedContainer(
            duration: const Duration(seconds: 1),
            curve: Curves.easeInOut,
            height: isMinimized ? 50 : null,
            child: !showDragHandle
                ? child
                : Stack(
                    alignment: Alignment.topCenter,
                    children: <Widget>[
                      child,
                      Positioned(top: 12, child: dragHandle!)
                    ],
                  ),
          ),
        ),
      ),
    );

    if (constraints != null) {
      bottomSheet = Align(
        alignment: Alignment.bottomCenter,
        heightFactor: 1.0,
        child: ConstrainedBox(
          constraints: constraints,
          child: bottomSheet,
        ),
      );
    }

    return !widget.enableDrag
        ? bottomSheet
        : _BottomSheetGestureDetector(
            onVerticalDragStart: _handleDragStart,
            onVerticalDragUpdate: _handleDragUpdate,
            onVerticalDragEnd: _handleDragEnd,
            onTap:
                isMinimized ? () => setState(() => isMinimized = false) : null,
            child: bottomSheet,
          );
  }
}

PersistentBottomSheetController showMinimizableBottomSheet({
  required BuildContext context,
  required WidgetBuilder builder,
  Color? backgroundColor,
  double? elevation,
  ShapeBorder? shape,
  Clip? clipBehavior,
  BoxConstraints? constraints,
  bool? enableDrag,
  bool? showDragHandle,
  AnimationController? transitionAnimationController,
  AnimationStyle? sheetAnimationStyle,
}) {
  assert(debugCheckHasScaffold(context));

  return Scaffold.of(context).showMinimizableBottomSheet(
    builder,
    backgroundColor: backgroundColor,
    elevation: elevation,
    shape: shape,
    clipBehavior: clipBehavior,
    constraints: constraints,
    enableDrag: enableDrag,
    showDragHandle: showDragHandle,
    transitionAnimationController: transitionAnimationController,
    sheetAnimationStyle: sheetAnimationStyle,
  );
}

class _BottomSheetGestureDetector extends StatelessWidget {
  const _BottomSheetGestureDetector({
    required this.child,
    required this.onVerticalDragStart,
    required this.onVerticalDragUpdate,
    required this.onVerticalDragEnd,
    this.onTap,
  });

  final Widget child;
  final GestureDragStartCallback onVerticalDragStart;
  final GestureDragUpdateCallback onVerticalDragUpdate;
  final GestureDragEndCallback onVerticalDragEnd;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return RawGestureDetector(
      excludeFromSemantics: true,
      gestures: <Type, GestureRecognizerFactory<GestureRecognizer>>{
        VerticalDragGestureRecognizer:
            GestureRecognizerFactoryWithHandlers<VerticalDragGestureRecognizer>(
          () => VerticalDragGestureRecognizer(debugOwner: this),
          (VerticalDragGestureRecognizer instance) {
            instance
              ..onStart = onVerticalDragStart
              ..onUpdate = onVerticalDragUpdate
              ..onEnd = onVerticalDragEnd
              ..onlyAcceptDragOnThreshold = true;
          },
        ),
        TapGestureRecognizer:
            GestureRecognizerFactoryWithHandlers<TapGestureRecognizer>(
          () => TapGestureRecognizer(debugOwner: this),
          (TapGestureRecognizer instance) {
            instance.onTap = onTap;
          },
        ),
      },
      child: child,
    );
  }
}

class _BottomSheetDefaultsM3 extends BottomSheetThemeData {
  _BottomSheetDefaultsM3(this.context)
      : super(
          elevation: 1.0,
          modalElevation: 1.0,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(28.0))),
          constraints: const BoxConstraints(maxWidth: 640),
        );

  final BuildContext context;
  late final ColorScheme _colors = Theme.of(context).colorScheme;

  @override
  Color? get backgroundColor => _colors.surfaceContainerLow;

  @override
  Color? get surfaceTintColor => Colors.transparent;

  @override
  Color? get shadowColor => Colors.transparent;

  @override
  Color? get dragHandleColor => _colors.onSurfaceVariant;

  @override
  Size? get dragHandleSize => const Size(32, 4);

  @override
  BoxConstraints? get constraints => const BoxConstraints(maxWidth: 640.0);
}

extension BottomSheetExtension on ScaffoldState {
  PersistentBottomSheetController showMinimizableBottomSheet(
    WidgetBuilder builder, {
    Color? backgroundColor,
    double? elevation,
    ShapeBorder? shape,
    Clip? clipBehavior,
    BoxConstraints? constraints,
    bool? enableDrag,
    bool? showDragHandle,
    AnimationController? transitionAnimationController,
    AnimationStyle? sheetAnimationStyle,
  }) {
    final AnimationController controller = (transitionAnimationController ??
        MinimizableBottomSheet.createAnimationController(this,
            sheetAnimationStyle: sheetAnimationStyle))
      ..forward();
    return this.showBottomSheet(
      (context) {
        return AnimatedBuilder(
          animation: controller,
          builder: (BuildContext context, Widget? child) {
            return Align(
              alignment: AlignmentDirectional.topStart,
              heightFactor: Curves.linear.transform(controller.value),
              child: child,
            );
          },
          child: MinimizableBottomSheet(
            onClosing: () {},
            builder: builder,
            showDragHandle: true,
            animationController: controller,
          ),
        );
      },
      enableDrag: true,
      sheetAnimationStyle: sheetAnimationStyle,
    );
  }
}
