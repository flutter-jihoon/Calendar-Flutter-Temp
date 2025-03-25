import 'package:calendar_flutter/core/constants/route_path.dart';
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
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late ScrollController _scrollController;
  late PageController _pageController;

  int _currentMonth = DateTime.now().month;
  bool _isWeekPickerExpanded = false;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
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
          title: '$_currentMonth월',
          onExpandButtonPressed: () {
            setState(() => _isWeekPickerExpanded = !_isWeekPickerExpanded);
          },
          onTodayButtonPressed: () {
            _pageController
                .animateToPage(0,
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeInOut)
                .then((_) {
              _scrollController.animateTo(70.0 * DateTime.now().hour,
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeInOut);
            });
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
                        setState(() => _currentMonth = value.month);
                        _pageController.animateToPage(
                          value.difference(DateTime.now()).inDays ~/ 7,
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      },
                      initialDate: DateTime.now(),
                      currentDate: DateTime.now(),
                      firstDate: DateTime(1900, 1, 1),
                      lastDate: DateTime(2100, 1, 1),
                    ),
                  ),
                  Expanded(
                    child: PageView.builder(
                      controller: _pageController,
                      itemBuilder: (context, index) => WeeklyCalendar(
                        scrollController: _scrollController,
                        currentCalendar: currentCalendar,
                        weekOffset: index,
                      ),
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
}
