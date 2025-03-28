import 'package:calendar_flutter/core/constants/route_path.dart';
import 'package:calendar_flutter/core/utils/date_time_util.dart';
import 'package:calendar_flutter/core/utils/log_util.dart';
import 'package:calendar_flutter/core/widgets/calendar_app_date_picker.dart';
import 'package:calendar_flutter/core/widgets/calendar_app_square_icons.dart';
import 'package:calendar_flutter/core/widgets/minimizable_bottom_sheet.dart';
import 'package:calendar_flutter/domain/entities/calendar.dart';
import 'package:calendar_flutter/presentation/providers/calendar_list_provider.dart';
import 'package:calendar_flutter/presentation/providers/selected_time_range_provider.dart';
import 'package:calendar_flutter/presentation/screens/calendar/widgets/add_event_bottom_sheet.dart';
import 'package:calendar_flutter/presentation/screens/calendar/widgets/calendar_screen_app_bar.dart';
import 'package:calendar_flutter/presentation/screens/calendar/widgets/calendar_screen_drawer.dart';
import 'package:calendar_flutter/presentation/screens/calendar/widgets/weekly_calendar/weekly_calendar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CalendarScreen extends ConsumerStatefulWidget {
  const CalendarScreen({super.key});

  @override
  ConsumerState<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends ConsumerState<CalendarScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  static final DateTime _firstDate = DateTime(1900, 1, 1);
  static final DateTime _lastDate = DateTime(2100, 1, 1);
  static final int _initialPage =
      DateTime.now().difference(_firstDate).inDays ~/ 7;

  late PageController _pageController;
  late ScrollController _scrollController;

  bool _isWeekPickerExpanded = false;
  DateTime _selectedDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _initialPage);
    _scrollController = TrackingScrollController(
      initialScrollOffset: 70 * DateTime.now().hour.toDouble(),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Calendar? currentCalendar = ref.watch(currentCalendarProvider);
    return Scaffold(
      key: _scaffoldKey,
      appBar: CalendarScreenAppBar(
        title: _appBarTitle,
        onExpandButtonPressed: _onExpandButtonPressed,
        onTodayButtonPressed: _onTodayButtonPressed,
        onMenuButtonPressed: _onMenuButtonPressed,
        isExpanded: _isWeekPickerExpanded,
      ),
      endDrawer: CalendarScreenDrawer(),
      body: SafeArea(
        child: Stack(
          children: [
            Stack(
              children: [
                CalendarAppDatePicker(
                  onDateChanged: (value) {
                    final int weekOffset = value.firstDayOfWeek
                            .difference(_firstDate.firstDayOfWeek)
                            .inDays ~/
                        7;
                    _pageController.animateToPage(
                      weekOffset,
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  },
                  initialDate: _selectedDate,
                  firstDate: _firstDate,
                  lastDate: _lastDate,
                ),
                Column(
                  children: [
                    AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      height: _isWeekPickerExpanded ? 222 : 0,
                      curve: Curves.easeInOut,
                      child: SizedBox(),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onPanDown: (_) {
                          if (_isWeekPickerExpanded) {
                            setState(() => _isWeekPickerExpanded = false);
                          }
                        },
                        child: WeeklyCalendar(
                          scrollController: _scrollController,
                          pageController: _pageController,
                          currentCalendar: currentCalendar,
                          firstDate: _firstDate,
                          lastDate: _lastDate,
                          initialPage: _initialPage,
                          onPageChanged: (value) {
                            setState(() {
                              _selectedDate = _firstDate.firstDayOfWeek
                                  .add(Duration(days: value * 7));
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Positioned(
              right: 16,
              bottom: 16,
              child: FloatingActionButton(
                onPressed: () {
                  context.goNamed(RoutePath.addScheduleScreenRoute);
                },
                child: CalendarAppSquareIcon.plusWhite(32),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String get _appBarTitle {
    final List<int> monthsInWeek = List.generate(7, (index) {
      return _selectedDate.firstDayOfWeek.add(Duration(days: index)).month;
    });
    final Map<int, int> monthCountMap = {};
    for (final int month in monthsInWeek) {
      monthCountMap.update(month, (count) => count + 1, ifAbsent: () => 1);
    }

    final int selectedMonth =
        monthCountMap.entries.fold<int>(0, (selectedMonth, entry) {
      return entry.value > (monthCountMap[selectedMonth] ?? 0)
          ? entry.key
          : selectedMonth;
    });

    return DateTime.now().year == _selectedDate.year
        ? '$selectedMonth월'
        : '${_selectedDate.year}년 $selectedMonth월';
  }

  void _onExpandButtonPressed() {
    setState(() => _isWeekPickerExpanded = !_isWeekPickerExpanded);
  }

  void _onTodayButtonPressed() async {
    setState(() => _selectedDate = DateTime.now());
    await _pageController.animateToPage(_initialPage,
        duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
    _scrollController.animateTo(70.0 * DateTime.now().hour,
        duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
  }

  void _onMenuButtonPressed() {
    _scaffoldKey.currentState?.openEndDrawer();
  }
}
