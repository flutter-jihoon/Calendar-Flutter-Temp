import 'package:calendar_flutter/core/constants/route_path.dart';
import 'package:calendar_flutter/core/utils/date_time_util.dart';
import 'package:calendar_flutter/core/widgets/calendar_app_date_picker.dart';
import 'package:calendar_flutter/core/widgets/calendar_app_square_icons.dart';
import 'package:calendar_flutter/domain/entities/calendar.dart';
import 'package:calendar_flutter/presentation/providers/calendar_list_provider.dart';
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
  static final DateTime _firstDate = DateTime(1900, 1, 1);
  static final DateTime _lastDate = DateTime(2100, 1, 1);
  static final int _initialPage =
      DateTime.now().difference(_firstDate).inDays ~/ 7;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  bool _isWeekPickerExpanded = false;
  DateTime _selectedDate = DateTime.now();
  late PageController _pageController;
  late ScrollController _scrollController;

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
    final AsyncValue<List<Calendar>> calendars =
        ref.watch(calendarListProvider);
    final Calendar? currentCalendar = ref.watch(currentCalendarProvider);

    return calendars.when(
      data: (data) => Scaffold(
        key: _scaffoldKey,
        appBar: CalendarScreenAppBar(
          title: _appBarTitle,
          onExpandButtonPressed: () {
            setState(() => _isWeekPickerExpanded = !_isWeekPickerExpanded);
          },
          onTodayButtonPressed: () async {
            setState(() => _selectedDate = DateTime.now());
            await _pageController.animateToPage(_initialPage,
                duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
            _scrollController.animateTo(70.0 * DateTime.now().hour,
                duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
          },
          onMenuButtonPressed: () => _scaffoldKey.currentState?.openEndDrawer(),
          isExpanded: _isWeekPickerExpanded,
        ),
        endDrawer: CalendarScreenDrawer(data: data),
        body: SafeArea(
          child: Stack(
            children: [
              Column(
                children: [
                  AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    height: _isWeekPickerExpanded ? 222 : 0,
                    curve: Curves.easeInOut,
                    child: CalendarAppDatePicker(
                      onDateChanged: (value) {
                        final int weekOffset = value.firstDayOfTheWeek
                                .difference(_firstDate.firstDayOfTheWeek)
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
                  ),
                  Expanded(
                    child: WeeklyCalendar(
                      scrollController: _scrollController,
                      pageController: _pageController,
                      currentCalendar: currentCalendar,
                      firstDate: _firstDate,
                      lastDate: _lastDate,
                      initialPage: _initialPage,
                      onPageChanged: (value) {
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          setState(() {
                            _selectedDate = _firstDate.firstDayOfTheWeek
                                .add(Duration(days: value * 7));
                          });
                        });
                      },
                    ),
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
      ),
      loading: () => const CircularProgressIndicator(),
      error: (error, stackTrace) => Text('Error: $error'),
    );
  }

  String get _appBarTitle {
    final DateTime firstDayOfTheWeek =
        _selectedDate.subtract(Duration(days: _selectedDate.weekday % 7));
    final List<int> monthsInWeek = List.generate(7, (index) {
      return firstDayOfTheWeek.add(Duration(days: index)).month;
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

    if (DateTime.now().year == _selectedDate.year) {
      return '$selectedMonth월';
    } else {
      return '${_selectedDate.year}년 $selectedMonth월';
    }
  }
}
