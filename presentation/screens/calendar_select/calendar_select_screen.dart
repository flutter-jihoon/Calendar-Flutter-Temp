import 'package:calendar_flutter/core/constants/route_path.dart';
import 'package:calendar_flutter/core/utils/text_style_util.dart';
import 'package:calendar_flutter/core/widgets/calendar_app_app_bar.dart';
import 'package:calendar_flutter/core/widgets/calendar_app_bottom_button.dart';
import 'package:calendar_flutter/presentation/providers/calendar_list_provider.dart';
import 'package:calendar_flutter/presentation/screens/calendar_select/widgets/calendar_select_list.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:calendar_flutter/domain/entities/calendar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CalendarSelectScreen extends ConsumerStatefulWidget {
  const CalendarSelectScreen({super.key});

  @override
  ConsumerState<CalendarSelectScreen> createState() =>
      _CalendarSelectScreenState();
}

class _CalendarSelectScreenState extends ConsumerState<CalendarSelectScreen> {
  @override
  Widget build(BuildContext context) {
    final Calendar? selectedCalendar = ref.watch(currentCalendarProvider);
    final List<Calendar>? calendarList = ref.watch(calendarListProvider).value;

    return Scaffold(
      appBar: CalendarAppAppBar(title: '캘린더', isTopmost: true),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: CustomScrollView(
                slivers: [
                  SliverPadding(
                    padding: const EdgeInsets.all(16),
                    sliver: SliverList(
                      delegate: SliverChildListDelegate(
                        [
                          Text(
                            '사용할 캘린더를 선택해 주세요',
                            style: AppTextStyles.style20Bold(),
                          ),
                          SizedBox(height: 8),
                          Text(
                            '선택한 캘린더에 시간표가 연동돼요',
                            style: AppTextStyles.style16Regular(),
                          ),
                          SizedBox(height: 28),
                          Center(
                            child: Image.asset(
                              'packages/calendar_flutter/assets/images/calendar_select.webp',
                              width: 160,
                              height: 120,
                            ),
                          ),
                          SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ),
                  if (calendarList != null)
                    CalendarSelectList(calendarList, selectedCalendar),
                ],
              ),
            ),
            CalendarAppBottomButton(
              text: '캘린더 사용하기',
              onPressed: () {
                context.push(RoutePath.calendarScreenRoute);
              },
            ),
          ],
        ),
      ),
    );
  }
}
