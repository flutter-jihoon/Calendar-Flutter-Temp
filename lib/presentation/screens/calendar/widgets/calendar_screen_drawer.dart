import 'package:calendar_flutter/core/constants/route_path.dart';
import 'package:calendar_flutter/core/utils/text_style_util.dart';
import 'package:calendar_flutter/core/widgets/calendar_app_dialog.dart';
import 'package:calendar_flutter/core/widgets/calendar_app_divider.dart';
import 'package:calendar_flutter/core/widgets/calendar_app_icon_button.dart';
import 'package:calendar_flutter/core/widgets/calendar_app_icons.dart';
import 'package:calendar_flutter/core/widgets/calendar_app_switch.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:calendar_flutter/core/utils/color_util.dart';
import 'package:calendar_flutter/domain/entities/calendar.dart';
import 'package:calendar_flutter/presentation/providers/calendar_list_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CalendarScreenDrawer extends ConsumerStatefulWidget {
  final List<Calendar> data;

  const CalendarScreenDrawer({
    required this.data,
    super.key,
  });

  @override
  ConsumerState<CalendarScreenDrawer> createState() =>
      _TimetableScreenDrawerState();
}

class _TimetableScreenDrawerState extends ConsumerState<CalendarScreenDrawer> {
  bool _showHoliday = false;

  @override
  Widget build(BuildContext context) {
    final Calendar? currentCalendar = ref.watch(currentCalendarProvider);
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
                        itemCount: widget.data.length,
                        itemBuilder: (context, index) {
                          final Calendar calendar = widget.data[index];
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
                                  widget.data[index];
                            },
                          );
                        },
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 5),
                      ),
                      SizedBox(height: 5),
                      ListTile(
                        leading: CalendarAppIcon.plus(20),
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
                          final TextEditingController textEditingController =
                              TextEditingController();
                          final bool? result = await showDialog<bool>(
                            context: context,
                            builder: (context) {
                              return CalendarAppDialog(
                                title: '캘린더 추가',
                                content: TextField(
                                  controller: textEditingController,
                                  decoration: const InputDecoration(
                                    hintText: '캘린더 제목',
                                    contentPadding: EdgeInsets.symmetric(
                                      horizontal: 16,
                                      vertical: 11,
                                    ),
                                  ),
                                ),
                                primaryButtonText: '확인',
                                secondaryButtonText: '취소',
                              );
                            },
                          );
                          final String title = textEditingController.text;
                          if (result == true && title.isNotEmpty) {
                            ref
                                .read(calendarListProvider.notifier)
                                .addCalendar(Calendar(title: title));
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
                      Text(
                        '기타',
                        style: AppTextStyles.style13Medium(),
                      ),
                      SizedBox(height: 12),
                      ListTileTheme(
                        horizontalTitleGap: 8,
                        child: CheckboxListTile(
                          title: Text(
                            '공휴일',
                            style: AppTextStyles.style15Medium(),
                          ),
                          value: _showHoliday,
                          contentPadding: EdgeInsets.symmetric(horizontal: 0),
                          controlAffinity: ListTileControlAffinity.leading,
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          visualDensity: const VisualDensity(
                            horizontal: VisualDensity.minimumDensity,
                            vertical: VisualDensity.minimumDensity,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7),
                          ),
                          side:
                              BorderSide(color: AppPalette.grey400, width: 1.5),
                          activeColor: AppPalette.primary,
                          onChanged: (value) =>
                              setState(() => _showHoliday = value!),
                        ),
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
                      Text('시간표 리스트', style: AppTextStyles.style13Medium()),
                      SizedBox(height: 12),
                      ListTileTheme(
                        horizontalTitleGap: 8,
                        child: ListView.separated(
                          physics: ClampingScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: 3,
                          itemBuilder: (context, index) {
                            return Center(
                              child: CheckboxListTile(
                                title: Text(
                                  '공휴일',
                                  style: AppTextStyles.style15Medium(),
                                ),
                                value: _showHoliday,
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 0),
                                controlAffinity:
                                    ListTileControlAffinity.leading,
                                materialTapTargetSize:
                                    MaterialTapTargetSize.shrinkWrap,
                                visualDensity: const VisualDensity(
                                  horizontal: VisualDensity.minimumDensity,
                                  vertical: VisualDensity.minimumDensity,
                                ),
                                side: BorderSide(
                                    color: AppPalette.grey400, width: 1.5),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(7),
                                ),
                                activeColor: AppPalette.primary,
                                onChanged: (value) =>
                                    setState(() => _showHoliday = value!),
                              ),
                            );
                          },
                          separatorBuilder: (context, index) =>
                              const SizedBox(height: 8),
                        ),
                      ),
                    ],
                  ),
                ),
                CalendarAppDivider(),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 19.5),
                  child: Row(
                    children: [
                      CalendarAppIcon.logoGoogle(20),
                      SizedBox(width: 8),
                      Text(
                        'Google 캘린더 연동',
                        style: AppTextStyles.style15Medium(),
                      ),
                      Spacer(),
                      CalendarAppSwitch(value: false, onChanged: (value) {}),
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
