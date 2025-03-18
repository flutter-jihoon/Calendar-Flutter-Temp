import 'dart:math' as math;

import 'package:flutter/cupertino.dart';
import 'package:flutter/scheduler.dart';

const double _kItemExtent = 32.0;

const double _kPickerWidth = 320.0;
const bool _kUseMagnifier = true;
const double _kMagnification = 2.35 / 2.1;
const double _kDatePickerPadSize = 12.0;

const double _kSqueeze = 1.25;

const TextStyle _kDefaultPickerTextStyle = TextStyle(
  letterSpacing: -0.83,
);

TextStyle _themeTextStyle(BuildContext context, {bool isValid = true}) {
  final TextStyle style =
      CupertinoTheme.of(context).textTheme.dateTimePickerTextStyle;
  return isValid
      ? style.copyWith(
          color: CupertinoDynamicColor.maybeResolve(style.color, context))
      : style.copyWith(
          color: CupertinoDynamicColor.resolve(
              CupertinoColors.inactiveGray, context));
}

void _animateColumnControllerToItem(
    FixedExtentScrollController controller, int targetItem) {
  controller.animateToItem(
    targetItem,
    curve: Curves.easeInOut,
    duration: const Duration(milliseconds: 200),
  );
}

const Widget _startSelectionOverlay =
    CupertinoPickerDefaultSelectionOverlay(capEndEdge: false);
const Widget _centerSelectionOverlay = CupertinoPickerDefaultSelectionOverlay(
    capStartEdge: false, capEndEdge: false);
const Widget _endSelectionOverlay =
    CupertinoPickerDefaultSelectionOverlay(capStartEdge: false);

typedef SelectionOverlayBuilder = Widget? Function(BuildContext context,
    {required int columnCount, required int selectedIndex});

class _DatePickerLayoutDelegate extends MultiChildLayoutDelegate {
  _DatePickerLayoutDelegate({
    required this.columnWidths,
    required this.textDirectionFactor,
    required this.maxWidth,
  });

  final List<double> columnWidths;

  final int textDirectionFactor;

  final double maxWidth;

  @override
  void performLayout(Size size) {
    double remainingWidth = maxWidth < size.width ? maxWidth : size.width;

    double currentHorizontalOffset = (size.width - remainingWidth) / 2;

    for (int i = 0; i < columnWidths.length; i++) {
      remainingWidth -= columnWidths[i] + _kDatePickerPadSize * 2;
    }

    for (int i = 0; i < columnWidths.length; i++) {
      final int index =
          textDirectionFactor == 1 ? i : columnWidths.length - i - 1;

      double childWidth = columnWidths[index] + _kDatePickerPadSize * 2;
      if (index == 0 || index == columnWidths.length - 1) {
        childWidth += remainingWidth / 2;
      }

      assert(() {
        if (childWidth < 0) {
          FlutterError.reportError(
            FlutterErrorDetails(
              exception: FlutterError(
                'Insufficient horizontal space to render the '
                'CalendarAppTimePicker because the parent is too narrow at '
                '${size.width}px.\n'
                'An additional ${-remainingWidth}px is needed to avoid '
                'overlapping columns.',
              ),
            ),
          );
        }
        return true;
      }());
      layoutChild(index,
          BoxConstraints.tight(Size(math.max(0.0, childWidth), size.height)));
      positionChild(index, Offset(currentHorizontalOffset, 0.0));

      currentHorizontalOffset += childWidth;
    }
  }

  @override
  bool shouldRelayout(_DatePickerLayoutDelegate oldDelegate) {
    return columnWidths != oldDelegate.columnWidths ||
        textDirectionFactor != oldDelegate.textDirectionFactor;
  }
}

enum CalendarAppTimePickerMode {
  time,

  date,

  dateAndTime,

  monthYear,
}

enum _PickerColumnType {
  dayOfMonth,

  month,

  year,

  date,

  hour,

  minute,

  dayPeriod,
}

/// 오전/오후 - 시간 - 분 순서로 표시되도록 기존 위젯을 수정했습니다.
/// Locale('ko', 'KR')로 설정했을 때, 오전/오후는 시간 - 분 뒤에 표시됩니다.
class CalendarAppTimePicker extends StatefulWidget {
  CalendarAppTimePicker({
    super.key,
    required this.onTimeChanged,
    DateTime? initialDateTime,
    this.minimumDate,
    this.maximumDate,
    this.minimumYear = 1,
    this.maximumYear,
    this.minuteInterval = 1,
    this.use24hFormat = false,
    this.dateOrder,
    this.backgroundColor,
    this.showDayOfWeek = false,
    this.itemExtent = _kItemExtent,
    this.selectionOverlayBuilder,
  })  : initialDateTime = initialDateTime ?? DateTime.now(),
        assert(
          itemExtent > 0,
          'item extent should be greater than 0',
        ),
        assert(
          minuteInterval > 0 && 60 % minuteInterval == 0,
          'minute interval is not a positive integer factor of 60',
        ) {
    assert(
      mode != CalendarAppTimePickerMode.dateAndTime ||
          minimumDate == null ||
          !this.initialDateTime.isBefore(minimumDate!),
      'initial date is before minimum date',
    );
    assert(
      mode != CalendarAppTimePickerMode.dateAndTime ||
          maximumDate == null ||
          !this.initialDateTime.isAfter(maximumDate!),
      'initial date is after maximum date',
    );
    assert(
      (mode != CalendarAppTimePickerMode.date &&
              mode != CalendarAppTimePickerMode.monthYear) ||
          (minimumYear >= 1 && this.initialDateTime.year >= minimumYear),
      'initial year is not greater than minimum year, or minimum year is not positive',
    );
    assert(
      (mode != CalendarAppTimePickerMode.date &&
              mode != CalendarAppTimePickerMode.monthYear) ||
          maximumYear == null ||
          this.initialDateTime.year <= maximumYear!,
      'initial year is not smaller than maximum year',
    );
    assert(
      (mode != CalendarAppTimePickerMode.date &&
              mode != CalendarAppTimePickerMode.monthYear) ||
          minimumDate == null ||
          !minimumDate!.isAfter(this.initialDateTime),
      'initial date ${this.initialDateTime} is not greater than or equal to minimumDate $minimumDate',
    );
    assert(
      (mode != CalendarAppTimePickerMode.date &&
              mode != CalendarAppTimePickerMode.monthYear) ||
          maximumDate == null ||
          !maximumDate!.isBefore(this.initialDateTime),
      'initial date ${this.initialDateTime} is not less than or equal to maximumDate $maximumDate',
    );
    assert(
      this.initialDateTime.minute % minuteInterval == 0,
      'initial minute is not divisible by minute interval',
    );
  }

  final CalendarAppTimePickerMode mode = CalendarAppTimePickerMode.time;

  final DateTime initialDateTime;

  final DateTime? minimumDate;

  final DateTime? maximumDate;

  final int minimumYear;

  final int? maximumYear;

  final int minuteInterval;

  final bool use24hFormat;

  final DatePickerDateOrder? dateOrder;

  final ValueChanged<DateTime> onTimeChanged;

  final Color? backgroundColor;

  final bool showDayOfWeek;

  final double itemExtent;

  final SelectionOverlayBuilder? selectionOverlayBuilder;

  @override
  State<StatefulWidget> createState() => _CalendarAppTimePickerDateTimeState();

  static double _getColumnWidth(
    _PickerColumnType columnType,
    CupertinoLocalizations localizations,
    BuildContext context,
    bool showDayOfWeek, {
    bool standaloneMonth = false,
  }) {
    String longestText = '';

    switch (columnType) {
      case _PickerColumnType.date:
        for (int i = 1; i <= 12; i++) {
          final String date =
              localizations.datePickerMediumDate(DateTime(2018, i, 25));
          if (longestText.length < date.length) {
            longestText = date;
          }
        }
      case _PickerColumnType.hour:
        for (int i = 0; i < 24; i++) {
          final String hour = localizations.datePickerHour(i);
          if (longestText.length < hour.length) {
            longestText = hour;
          }
        }
      case _PickerColumnType.minute:
        for (int i = 0; i < 60; i++) {
          final String minute = localizations.datePickerMinute(i);
          if (longestText.length < minute.length) {
            longestText = minute;
          }
        }
      case _PickerColumnType.dayPeriod:
        longestText = localizations.anteMeridiemAbbreviation.length >
                localizations.postMeridiemAbbreviation.length
            ? localizations.anteMeridiemAbbreviation
            : localizations.postMeridiemAbbreviation;
      case _PickerColumnType.dayOfMonth:
        int longestDayOfMonth = 1;
        for (int i = 1; i <= 31; i++) {
          final String dayOfMonth = localizations.datePickerDayOfMonth(i);
          if (longestText.length < dayOfMonth.length) {
            longestText = dayOfMonth;
            longestDayOfMonth = i;
          }
        }
        if (showDayOfWeek) {
          for (int wd = 1; wd < DateTime.daysPerWeek; wd++) {
            final String dayOfMonth =
                localizations.datePickerDayOfMonth(longestDayOfMonth, wd);
            if (longestText.length < dayOfMonth.length) {
              longestText = dayOfMonth;
            }
          }
        }
      case _PickerColumnType.month:
        for (int i = 1; i <= 12; i++) {
          final String month = standaloneMonth
              ? localizations.datePickerStandaloneMonth(i)
              : localizations.datePickerMonth(i);
          if (longestText.length < month.length) {
            longestText = month;
          }
        }
      case _PickerColumnType.year:
        longestText = localizations.datePickerYear(2018);
    }

    assert(longestText != '', 'column type is not appropriate');

    return TextPainter.computeMaxIntrinsicWidth(
      text: TextSpan(
        style: _themeTextStyle(context),
        text: longestText,
      ),
      textDirection: Directionality.of(context),
    );
  }
}

typedef _ColumnBuilder = Widget Function(double offAxisFraction,
    TransitionBuilder itemPositioningBuilder, Widget? selectionOverlay);

class _CalendarAppTimePickerDateTimeState extends State<CalendarAppTimePicker> {
  static const double _kMaximumOffAxisFraction = 0.45;

  late int textDirectionFactor;
  late CupertinoLocalizations localizations;

  late Alignment alignCenterLeft;
  late Alignment alignCenterRight;

  late DateTime initialDateTime;

  int get selectedDayFromInitial {
    switch (widget.mode) {
      case CalendarAppTimePickerMode.dateAndTime:
        return dateController.hasClients ? dateController.selectedItem : 0;
      case CalendarAppTimePickerMode.time:
        return 0;
      case CalendarAppTimePickerMode.date:
      case CalendarAppTimePickerMode.monthYear:
        break;
    }
    assert(
      false,
      '$runtimeType is only meant for dateAndTime mode or time mode',
    );
    return 0;
  }

  late FixedExtentScrollController dateController;

  int get selectedHour => _selectedHour(selectedAmPm, _selectedHourIndex);
  int get _selectedHourIndex => hourController.hasClients
      ? hourController.selectedItem % 24
      : initialDateTime.hour;

  int _selectedHour(int selectedAmPm, int selectedHour) {
    return _isHourRegionFlipped(selectedAmPm)
        ? (selectedHour + 12) % 24
        : selectedHour;
  }

  late FixedExtentScrollController hourController;

  int get selectedMinute {
    return minuteController.hasClients
        ? minuteController.selectedItem * widget.minuteInterval % 60
        : initialDateTime.minute;
  }

  late FixedExtentScrollController minuteController;

  late int selectedAmPm;

  bool get isHourRegionFlipped => _isHourRegionFlipped(selectedAmPm);
  bool _isHourRegionFlipped(int selectedAmPm) => selectedAmPm != meridiemRegion;

  late int meridiemRegion;

  late FixedExtentScrollController meridiemController;

  bool isDatePickerScrolling = false;
  bool isHourPickerScrolling = false;
  bool isMinutePickerScrolling = false;
  bool isMeridiemPickerScrolling = false;

  bool get isScrolling {
    return isDatePickerScrolling ||
        isHourPickerScrolling ||
        isMinutePickerScrolling ||
        isMeridiemPickerScrolling;
  }

  final Map<int, double> estimatedColumnWidths = <int, double>{};

  @override
  void initState() {
    super.initState();
    initialDateTime = widget.initialDateTime;

    selectedAmPm = initialDateTime.hour ~/ 12;
    meridiemRegion = selectedAmPm;

    meridiemController = FixedExtentScrollController(initialItem: selectedAmPm);
    hourController =
        FixedExtentScrollController(initialItem: initialDateTime.hour);
    minuteController = FixedExtentScrollController(
        initialItem: initialDateTime.minute ~/ widget.minuteInterval);
    dateController = FixedExtentScrollController();

    PaintingBinding.instance.systemFonts.addListener(_handleSystemFontsChange);
  }

  void _handleSystemFontsChange() {
    setState(() {
      estimatedColumnWidths.clear();
    });
  }

  @override
  void dispose() {
    dateController.dispose();
    hourController.dispose();
    minuteController.dispose();
    meridiemController.dispose();

    PaintingBinding.instance.systemFonts
        .removeListener(_handleSystemFontsChange);
    super.dispose();
  }

  @override
  void didUpdateWidget(CalendarAppTimePicker oldWidget) {
    super.didUpdateWidget(oldWidget);

    assert(
      oldWidget.mode == widget.mode,
      "The $runtimeType's mode cannot change once it's built.",
    );

    if (!widget.use24hFormat && oldWidget.use24hFormat) {
      meridiemController.dispose();
      meridiemController =
          FixedExtentScrollController(initialItem: selectedAmPm);
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    textDirectionFactor =
        Directionality.of(context) == TextDirection.ltr ? 1 : -1;
    localizations = CupertinoLocalizations.of(context);

    alignCenterLeft =
        textDirectionFactor == 1 ? Alignment.centerLeft : Alignment.centerRight;
    alignCenterRight =
        textDirectionFactor == 1 ? Alignment.centerRight : Alignment.centerLeft;

    estimatedColumnWidths.clear();
  }

  double _getEstimatedColumnWidth(_PickerColumnType columnType) {
    estimatedColumnWidths[columnType.index] ??=
        CalendarAppTimePicker._getColumnWidth(
            columnType, localizations, context, widget.showDayOfWeek);

    return estimatedColumnWidths[columnType.index]!;
  }

  DateTime get selectedDateTime {
    return DateTime(
      initialDateTime.year,
      initialDateTime.month,
      initialDateTime.day + selectedDayFromInitial,
      selectedHour,
      selectedMinute,
    );
  }

  void _onSelectedItemChange(int index) {
    final DateTime selected = selectedDateTime;

    final bool isDateInvalid =
        (widget.minimumDate?.isAfter(selected) ?? false) ||
            (widget.maximumDate?.isBefore(selected) ?? false);

    if (isDateInvalid) {
      return;
    }

    widget.onTimeChanged(selected);
  }

  Widget _buildMediumDatePicker(double offAxisFraction,
      TransitionBuilder itemPositioningBuilder, Widget? selectionOverlay) {
    return NotificationListener<ScrollNotification>(
      onNotification: (ScrollNotification notification) {
        if (notification is ScrollStartNotification) {
          isDatePickerScrolling = true;
        } else if (notification is ScrollEndNotification) {
          isDatePickerScrolling = false;
          _pickerDidStopScrolling();
        }

        return false;
      },
      child: CupertinoPicker.builder(
        scrollController: dateController,
        offAxisFraction: offAxisFraction,
        itemExtent: widget.itemExtent,
        useMagnifier: _kUseMagnifier,
        magnification: _kMagnification,
        backgroundColor: widget.backgroundColor,
        squeeze: _kSqueeze,
        onSelectedItemChanged: (int index) {
          _onSelectedItemChange(index);
        },
        itemBuilder: (BuildContext context, int index) {
          final DateTime rangeStart = DateTime(
            initialDateTime.year,
            initialDateTime.month,
            initialDateTime.day + index,
          );

          final DateTime rangeEnd = DateTime(
            initialDateTime.year,
            initialDateTime.month,
            initialDateTime.day + index + 1,
          );

          final DateTime now = DateTime.now();

          if (widget.minimumDate?.isBefore(rangeEnd) == false) {
            return null;
          }
          if (widget.maximumDate?.isAfter(rangeStart) == false) {
            return null;
          }

          final String dateText =
              rangeStart == DateTime(now.year, now.month, now.day)
                  ? localizations.todayLabel
                  : localizations.datePickerMediumDate(rangeStart);

          return itemPositioningBuilder(
            context,
            Text(dateText, style: _themeTextStyle(context)),
          );
        },
        selectionOverlay: selectionOverlay,
      ),
    );
  }

  bool _isValidHour(int meridiemIndex, int hourIndex) {
    final DateTime rangeStart = DateTime(
      initialDateTime.year,
      initialDateTime.month,
      initialDateTime.day + selectedDayFromInitial,
      _selectedHour(meridiemIndex, hourIndex),
    );

    final DateTime rangeEnd = rangeStart.add(const Duration(hours: 1));

    return (widget.minimumDate?.isBefore(rangeEnd) ?? true) &&
        !(widget.maximumDate?.isBefore(rangeStart) ?? false);
  }

  Widget _buildHourPicker(double offAxisFraction,
      TransitionBuilder itemPositioningBuilder, Widget? selectionOverlay) {
    return NotificationListener<ScrollNotification>(
      onNotification: (ScrollNotification notification) {
        if (notification is ScrollStartNotification) {
          isHourPickerScrolling = true;
        } else if (notification is ScrollEndNotification) {
          isHourPickerScrolling = false;
          _pickerDidStopScrolling();
        }

        return false;
      },
      child: CupertinoPicker(
        scrollController: hourController,
        offAxisFraction: offAxisFraction,
        itemExtent: widget.itemExtent,
        useMagnifier: _kUseMagnifier,
        magnification: _kMagnification,
        backgroundColor: widget.backgroundColor,
        squeeze: _kSqueeze,
        onSelectedItemChanged: (int index) {
          final bool regionChanged = meridiemRegion != index ~/ 12;
          final bool debugIsFlipped = isHourRegionFlipped;

          if (regionChanged) {
            meridiemRegion = index ~/ 12;
            selectedAmPm = 1 - selectedAmPm;
          }

          if (!widget.use24hFormat && regionChanged) {
            meridiemController.animateToItem(
              selectedAmPm,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOut,
            );
          } else {
            _onSelectedItemChange(index);
          }

          assert(debugIsFlipped == isHourRegionFlipped);
        },
        looping: true,
        selectionOverlay: selectionOverlay,
        children: List<Widget>.generate(24, (int index) {
          final int hour = isHourRegionFlipped ? (index + 12) % 24 : index;
          final int displayHour =
              widget.use24hFormat ? hour : (hour + 11) % 12 + 1;

          return itemPositioningBuilder(
            context,
            Text(
              localizations.datePickerHour(displayHour),
              semanticsLabel:
                  localizations.datePickerHourSemanticsLabel(displayHour),
              style: _themeTextStyle(context,
                  isValid: _isValidHour(selectedAmPm, index)),
            ),
          );
        }),
      ),
    );
  }

  Widget _buildMinutePicker(double offAxisFraction,
      TransitionBuilder itemPositioningBuilder, Widget? selectionOverlay) {
    return NotificationListener<ScrollNotification>(
      onNotification: (ScrollNotification notification) {
        if (notification is ScrollStartNotification) {
          isMinutePickerScrolling = true;
        } else if (notification is ScrollEndNotification) {
          isMinutePickerScrolling = false;
          _pickerDidStopScrolling();
        }

        return false;
      },
      child: CupertinoPicker(
        scrollController: minuteController,
        offAxisFraction: offAxisFraction,
        itemExtent: widget.itemExtent,
        useMagnifier: _kUseMagnifier,
        magnification: _kMagnification,
        backgroundColor: widget.backgroundColor,
        squeeze: _kSqueeze,
        onSelectedItemChanged: _onSelectedItemChange,
        looping: true,
        selectionOverlay: selectionOverlay,
        children:
            List<Widget>.generate(60 ~/ widget.minuteInterval, (int index) {
          final int minute = index * widget.minuteInterval;

          final DateTime date = DateTime(
            initialDateTime.year,
            initialDateTime.month,
            initialDateTime.day + selectedDayFromInitial,
            selectedHour,
            minute,
          );

          final bool isInvalidMinute =
              (widget.minimumDate?.isAfter(date) ?? false) ||
                  (widget.maximumDate?.isBefore(date) ?? false);

          return itemPositioningBuilder(
            context,
            Text(
              localizations.datePickerMinute(minute),
              semanticsLabel:
                  localizations.datePickerMinuteSemanticsLabel(minute),
              style: _themeTextStyle(context, isValid: !isInvalidMinute),
            ),
          );
        }),
      ),
    );
  }

  Widget _buildAmPmPicker(double offAxisFraction,
      TransitionBuilder itemPositioningBuilder, Widget? selectionOverlay) {
    return NotificationListener<ScrollNotification>(
      onNotification: (ScrollNotification notification) {
        if (notification is ScrollStartNotification) {
          isMeridiemPickerScrolling = true;
        } else if (notification is ScrollEndNotification) {
          isMeridiemPickerScrolling = false;
          _pickerDidStopScrolling();
        }

        return false;
      },
      child: CupertinoPicker(
        scrollController: meridiemController,
        offAxisFraction: offAxisFraction,
        itemExtent: widget.itemExtent,
        useMagnifier: _kUseMagnifier,
        magnification: _kMagnification,
        backgroundColor: widget.backgroundColor,
        squeeze: _kSqueeze,
        onSelectedItemChanged: (int index) {
          selectedAmPm = index;
          assert(selectedAmPm == 0 || selectedAmPm == 1);
          _onSelectedItemChange(index);
        },
        selectionOverlay: selectionOverlay,
        children: List<Widget>.generate(2, (int index) {
          return itemPositioningBuilder(
            context,
            Text(
              index == 0
                  ? localizations.anteMeridiemAbbreviation
                  : localizations.postMeridiemAbbreviation,
              style: _themeTextStyle(context,
                  isValid: _isValidHour(index, _selectedHourIndex)),
            ),
          );
        }),
      ),
    );
  }

  void _pickerDidStopScrolling() {
    setState(() {});

    if (isScrolling) {
      return;
    }

    final DateTime selectedDate = selectedDateTime;

    final bool minCheck = widget.minimumDate?.isAfter(selectedDate) ?? false;
    final bool maxCheck = widget.maximumDate?.isBefore(selectedDate) ?? false;

    if (minCheck || maxCheck) {
      final DateTime targetDate =
          minCheck ? widget.minimumDate! : widget.maximumDate!;
      _scrollToDate(targetDate, selectedDate, minCheck);
    }
  }

  void _scrollToDate(DateTime newDate, DateTime fromDate, bool minCheck) {
    SchedulerBinding.instance.addPostFrameCallback((Duration timestamp) {
      if (fromDate.year != newDate.year ||
          fromDate.month != newDate.month ||
          fromDate.day != newDate.day) {
        _animateColumnControllerToItem(dateController, selectedDayFromInitial);
      }

      if (fromDate.hour != newDate.hour) {
        final bool needsMeridiemChange =
            !widget.use24hFormat && fromDate.hour ~/ 12 != newDate.hour ~/ 12;

        if (needsMeridiemChange) {
          _animateColumnControllerToItem(
              meridiemController, 1 - meridiemController.selectedItem);

          final int newItem = (hourController.selectedItem ~/ 12) * 12 +
              (hourController.selectedItem + newDate.hour - fromDate.hour) % 12;
          _animateColumnControllerToItem(hourController, newItem);
        } else {
          _animateColumnControllerToItem(
            hourController,
            hourController.selectedItem + newDate.hour - fromDate.hour,
          );
        }
      }

      if (fromDate.minute != newDate.minute) {
        final double positionDouble = newDate.minute / widget.minuteInterval;
        final int position =
            minCheck ? positionDouble.ceil() : positionDouble.floor();
        _animateColumnControllerToItem(minuteController, position);
      }
    }, debugLabel: 'DatePicker.scrollToDate');
  }

  @override
  Widget build(BuildContext context) {
    final List<double> columnWidths = <double>[
      _getEstimatedColumnWidth(_PickerColumnType.hour),
      _getEstimatedColumnWidth(_PickerColumnType.minute),
    ];

    final List<_ColumnBuilder> pickerBuilders =
        Directionality.of(context) == TextDirection.rtl
            ? <_ColumnBuilder>[_buildMinutePicker, _buildHourPicker]
            : <_ColumnBuilder>[_buildHourPicker, _buildMinutePicker];

    if (!widget.use24hFormat) {
      switch (localizations.datePickerDateTimeOrder) {
        case DatePickerDateTimeOrder.date_time_dayPeriod:
        case DatePickerDateTimeOrder.time_dayPeriod_date:
        case DatePickerDateTimeOrder.date_dayPeriod_time:
        case DatePickerDateTimeOrder.dayPeriod_time_date:
          pickerBuilders.insert(0, _buildAmPmPicker);
          columnWidths.insert(
              0, _getEstimatedColumnWidth(_PickerColumnType.dayPeriod));
      }
    }

    if (widget.mode == CalendarAppTimePickerMode.dateAndTime) {
      switch (localizations.datePickerDateTimeOrder) {
        case DatePickerDateTimeOrder.time_dayPeriod_date:
        case DatePickerDateTimeOrder.dayPeriod_time_date:
          pickerBuilders.add(_buildMediumDatePicker);
          columnWidths.add(_getEstimatedColumnWidth(_PickerColumnType.date));
        case DatePickerDateTimeOrder.date_time_dayPeriod:
        case DatePickerDateTimeOrder.date_dayPeriod_time:
          pickerBuilders.insert(0, _buildMediumDatePicker);
          columnWidths.insert(
              0, _getEstimatedColumnWidth(_PickerColumnType.date));
      }
    }

    final List<Widget> pickers = <Widget>[];
    double totalColumnWidths = 4 * _kDatePickerPadSize;

    for (final (int i, double width) in columnWidths.indexed) {
      final (bool firstColumn, bool lastColumn) =
          (i == 0, i == columnWidths.length - 1);
      double offAxisFraction = 0.0;
      Widget? selectionOverlay = _centerSelectionOverlay;

      if (widget.selectionOverlayBuilder != null) {
        selectionOverlay = widget.selectionOverlayBuilder!(context,
            selectedIndex: i, columnCount: columnWidths.length);
      } else {
        if (firstColumn) {
          selectionOverlay = _startSelectionOverlay;
        } else if (lastColumn) {
          selectionOverlay = _endSelectionOverlay;
        }
      }

      if (firstColumn) {
        offAxisFraction = -_kMaximumOffAxisFraction * textDirectionFactor;
      } else if (i >= 2 || columnWidths.length == 2) {
        offAxisFraction = _kMaximumOffAxisFraction * textDirectionFactor;
      }

      EdgeInsets padding = const EdgeInsets.only(right: _kDatePickerPadSize);
      if (lastColumn) {
        padding = padding.flipped;
      }
      if (textDirectionFactor == -1) {
        padding = padding.flipped;
      }

      totalColumnWidths += width + (2 * _kDatePickerPadSize);

      pickers.add(LayoutId(
        id: i,
        child: pickerBuilders[i](
          offAxisFraction,
          (BuildContext context, Widget? child) {
            late final Widget constrained = ConstrainedBox(
              constraints:
                  BoxConstraints(maxWidth: width + _kDatePickerPadSize),
              child: child,
            );

            return Padding(
              padding: padding,
              child: Align(
                alignment: lastColumn ? alignCenterLeft : alignCenterRight,
                child: firstColumn || lastColumn ? constrained : child,
              ),
            );
          },
          selectionOverlay,
        ),
      ));
    }

    final double maxPickerWidth =
        totalColumnWidths > _kPickerWidth ? totalColumnWidths : _kPickerWidth;

    return MediaQuery.withNoTextScaling(
      child: DefaultTextStyle.merge(
        style: _kDefaultPickerTextStyle,
        child: CustomMultiChildLayout(
          delegate: _DatePickerLayoutDelegate(
            columnWidths: columnWidths,
            textDirectionFactor: textDirectionFactor,
            maxWidth: maxPickerWidth,
          ),
          children: pickers,
        ),
      ),
    );
  }
}
