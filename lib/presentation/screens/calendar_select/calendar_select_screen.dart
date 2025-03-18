import 'package:calendar_flutter/core/constants/route_path.dart';
import 'package:calendar_flutter/core/utils/text_style_util.dart';
import 'package:calendar_flutter/core/widgets/calendar_app_images.dart';
import 'package:calendar_flutter/core/widgets/calendar_app_input_dialog.dart';
import 'package:calendar_flutter/core/widgets/calendar_app_main_app_bar.dart';
import 'package:calendar_flutter/core/widgets/calendar_app_bottom_button.dart';
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
  int selectedCalendarId = 1;

  @override
  Widget build(BuildContext context) {
    final List<Calendar> calendarList = List.generate(
      5,
      (index) => Calendar(id: index + 1, title: '테스트 캘린더 ${index + 1}'),
    );

    return Scaffold(
      appBar: CalendarAppMainAppBar(title: '캘린더', isTopmost: true),
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
                            child: CalendarAppImage.calendarSelect(
                              Size(160, 120),
                            ),
                          ),
                          SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ),
                  CalendarSelectList(
                    calendarList: calendarList,
                    selectedCalendarId: selectedCalendarId,
                    onChanged: (Calendar? calendar) {
                      if (calendar != null) {
                        setState(() => selectedCalendarId = calendar.id);
                      }
                    },
                    onCalendarAddTileTap: _onCalendarAddTileTap,
                  ),
                ],
              ),
            ),
            CalendarAppBottomButton(
              text: '캘린더 사용하기',
              onPressed: () {
                // TODO: 캘린더 선택 로직 구현
                context.push(RoutePath.calendarScreenRoute);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _onCalendarAddTileTap() async {
    final String? title = await showDialog<String>(
      context: context,
      builder: (context) => CalendarAppInputDialog(
        title: '캘린더 추가',
        hintText: '캘린더 제목',
        primaryButtonText: '확인',
        secondaryButtonText: '취소',
      ),
    );
    if (title != null && title.isNotEmpty) {
      // TODO: 캘린더 추가 로직 구현
    }
  }
}
