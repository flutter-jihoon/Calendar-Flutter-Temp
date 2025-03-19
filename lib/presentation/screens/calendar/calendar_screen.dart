import 'package:calendar_flutter/core/constants/route_path.dart';
import 'package:calendar_flutter/core/widgets/calendar_app_date_picker.dart';
import 'package:calendar_flutter/core/widgets/calendar_app_square_icons.dart';
import 'package:calendar_flutter/domain/entities/calendar.dart';
import 'package:calendar_flutter/presentation/providers/calendar_list_provider.dart';
import 'package:calendar_flutter/presentation/screens/calendar/widgets/calendar_screen_app_bar.dart';
import 'package:calendar_flutter/presentation/screens/calendar/widgets/calendar_screen_drawer.dart';
import 'package:calendar_flutter/presentation/screens/calendar/widgets/weekly_calendar.dart';
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

  bool _isWeekPickerExpanded = false;

  @override
  Widget build(BuildContext context) {
    final AsyncValue<List<Calendar>> timetables =
        ref.watch(calendarListProvider);
    final Calendar? currentCalendar = ref.watch(currentCalendarProvider);
    final currentMonth = '3월';

    return timetables.when(
      data: (data) => Scaffold(
        key: _scaffoldKey,
        appBar: CalendarScreenAppBar(
          title: currentMonth,
          onExpandButtonPressed: () {
            setState(() => _isWeekPickerExpanded = !_isWeekPickerExpanded);
          },
          onMenuButtonPressed: () => _scaffoldKey.currentState?.openEndDrawer(),
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
                    child: SizedBox(
                      height: 222,
                      child: CalendarAppDatePicker(
                        onDateChanged: (value) {},
                        initialDate: DateTime.now(),
                        currentDate: DateTime.now(),
                        firstDate: DateTime(1900, 1, 1),
                        lastDate: DateTime(2100, 1, 1),
                      ),
                    ),
                  ),
                  Expanded(
                    child: WeeklyCalendar(
                      currentCalendar: currentCalendar,
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
