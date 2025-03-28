import 'package:calendar_flutter/core/constants/route_path.dart';
import 'package:calendar_flutter/core/utils/log_util.dart';
import 'package:calendar_flutter/core/utils/text_style_util.dart';
import 'package:calendar_flutter/core/widgets/calendar_app_checkbox_list_tile.dart';
import 'package:calendar_flutter/core/widgets/calendar_app_divider.dart';
import 'package:calendar_flutter/core/widgets/calendar_app_icon_button.dart';
import 'package:calendar_flutter/core/widgets/calendar_app_input_dialog.dart';
import 'package:calendar_flutter/core/widgets/calendar_app_square_icons.dart';
import 'package:calendar_flutter/core/widgets/calendar_app_switch.dart';
import 'package:calendar_flutter/domain/entities/timetable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:calendar_flutter/core/utils/color_util.dart';
import 'package:calendar_flutter/domain/entities/calendar.dart';
import 'package:calendar_flutter/presentation/providers/calendar_list_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CalendarScreenDrawer extends ConsumerStatefulWidget {
  const CalendarScreenDrawer({super.key});

  @override
  ConsumerState<CalendarScreenDrawer> createState() =>
      _TimetableScreenDrawerState();
}

class _TimetableScreenDrawerState extends ConsumerState<CalendarScreenDrawer> {
  bool _showHoliday = false;

  @override
  Widget build(BuildContext context) {
    final List<Calendar> calendars =
        ref.watch(calendarListProvider).requireValue;

    final Calendar? currentCalendar = ref.watch(currentCalendarProvider);

    final List<Timetable> timetables = List.generate(4, (index) {
      return Timetable(id: index, title: '테스트 시간표 ${index + 1}');
    });

    return Drawer(
      shape: Theme.of(context).drawerTheme.shape,
      child: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 39, 16, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      currentCalendar?.title ?? '',
                      style: AppTextStyles.style16Bold(),
                    ),
                    CalendarAppIconButton(
                      onPressed: () =>
                          context.goNamed(RoutePath.calendarSettingScreenRoute),
                      assetName:
                          'packages/calendar_flutter/assets/icons/settings.webp',
                    ),
                  ],
                ),
                SizedBox(height: 17.5),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 19.5),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '캘린더 리스트',
                            style: AppTextStyles.style14Medium(),
                          ),
                          GestureDetector(
                            onTap: () {
                              context
                                  .goNamed(RoutePath.calendarManageScreenRoute);
                            },
                            child: Text(
                              '관리',
                              style: AppTextStyles.style13Bold(
                                color: AppPalette.primary,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 12),
                      ListView.separated(
                        physics: ClampingScrollPhysics(),
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        itemCount: calendars.length,
                        itemBuilder: (context, index) {
                          final Calendar calendar = calendars[index];
                          final bool isSelected = calendar == currentCalendar;
                          return ListTile(
                            title: Text(
                              calendar.title,
                              style: isSelected
                                  ? AppTextStyles.style15Bold()
                                  : AppTextStyles.style15Medium(),
                            ),
                            selected: isSelected,
                            selectedTileColor: AppPalette.bg02,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7),
                              side: BorderSide(
                                color: isSelected
                                    ? AppPalette.primary
                                    : Colors.transparent,
                              ),
                            ),
                            visualDensity: VisualDensity(
                              horizontal: VisualDensity.minimumDensity,
                              vertical: VisualDensity.minimumDensity,
                            ),
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 16),
                            onTap: () {
                              ref.read(currentCalendarProvider.notifier).state =
                                  calendars[index];
                            },
                          );
                        },
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 5),
                      ),
                      SizedBox(height: 5),
                      ListTile(
                        leading: CalendarAppSquareIcon.plus(20),
                        horizontalTitleGap: 6,
                        contentPadding: EdgeInsets.symmetric(horizontal: 16),
                        visualDensity: VisualDensity(
                          horizontal: VisualDensity.minimumDensity,
                          vertical: VisualDensity.minimumDensity,
                        ),
                        title: Text(
                          '캘린더 추가',
                          style: AppTextStyles.style15Medium(),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7),
                        ),
                        onTap: () async {
                          final String? title = await showDialog<String>(
                            context: context,
                            builder: (context) {
                              return CalendarAppInputDialog(
                                title: '캘린더 추가',
                                hintText: '캘린더 제목',
                                primaryButtonText: '확인',
                                secondaryButtonText: '취소',
                              );
                            },
                          );
                          if (title != null && title.isNotEmpty) {
                            ref
                                .read(calendarListProvider.notifier)
                                .addCalendar(Calendar(id: 1, title: title));
                          }
                        },
                      ),
                    ],
                  ),
                ),
                CalendarAppDivider(),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 19.5),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('기타', style: AppTextStyles.style13Medium()),
                      SizedBox(height: 12),
                      CalendarAppCheckboxListTile(
                        title: Text(
                          '공휴일',
                          style: AppTextStyles.style15Medium(),
                        ),
                        value: _showHoliday,
                        onChanged: (value) {
                          setState(() => _showHoliday = value!);
                        },
                      ),
                    ],
                  ),
                ),
                CalendarAppDivider(),
                if (timetables.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 19.5),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('시간표 리스트', style: AppTextStyles.style13Medium()),
                        SizedBox(height: 12),
                        ListView.separated(
                          physics: ClampingScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: timetables.length,
                          itemBuilder: (context, index) {
                            return Center(
                              child: CalendarAppCheckboxListTile(
                                title: Text(
                                  timetables[index].title,
                                  style: AppTextStyles.style15Medium(),
                                ),
                                // TODO: 시간표 연동 여부 구현
                                value: false,
                                onChanged: (value) {
                                  // TODO: 시간표 연동 로직 구현
                                  if (value ?? false) {
                                    logger.i(
                                      '시간표 "${timetables[index].title}" 연동',
                                    );
                                  }
                                },
                              ),
                            );
                          },
                          separatorBuilder: (_, __) =>
                              const SizedBox(height: 8),
                        ),
                      ],
                    ),
                  ),
                CalendarAppDivider(),
                if (defaultTargetPlatform == TargetPlatform.android)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 19.5),
                    child: Row(
                      children: [
                        CalendarAppSquareIcon.logoGoogle(20),
                        SizedBox(width: 8),
                        Text(
                          'Google 캘린더 연동',
                          style: AppTextStyles.style15Medium(),
                        ),
                        Spacer(),
                        CalendarAppSwitch(
                          value: false,
                          onChanged: (value) {
                            // TODO: Host API 호출
                            if (value) logger.i('Google 캘린더 연동 Host API 호출');
                          },
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
