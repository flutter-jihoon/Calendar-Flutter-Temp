import 'package:calendar_flutter/core/constants/route_path.dart';
import 'package:calendar_flutter/core/enums/day_of_the_week.dart';
import 'package:calendar_flutter/core/utils/color_util.dart';
import 'package:calendar_flutter/core/utils/text_style_util.dart';
import 'package:calendar_flutter/core/widgets/calendar_app_main_app_bar.dart';
import 'package:calendar_flutter/core/widgets/calendar_app_divider.dart';
import 'package:calendar_flutter/core/widgets/calendar_app_list_tile.dart';
import 'package:calendar_flutter/core/widgets/calendar_app_square_icons.dart';
import 'package:calendar_flutter/presentation/screens/repeat_setting/widgets/repeat_setting_checkbox_tile.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

enum RepeatSetting { none, daily, weekly, monthly, yearly }

class RepeatSettingScreen extends StatefulWidget {
  const RepeatSettingScreen({super.key});

  @override
  State<RepeatSettingScreen> createState() => _RepeatSettingScreenState();
}

class _RepeatSettingScreenState extends State<RepeatSettingScreen> {
  RepeatSetting _repeatSetting = RepeatSetting.none;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CalendarAppMainAppBar(title: '반복'),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: Column(
              children: [
                SizedBox(height: 4),
                RepeatSettingCheckboxListTile(
                  title: '반복 안함',
                  value: _repeatSetting == RepeatSetting.none,
                  onChanged: (value) {
                    setState(() => _repeatSetting =
                        value! ? RepeatSetting.none : _repeatSetting);
                  },
                ),
                CalendarAppDivider(),
                RepeatSettingCheckboxListTile(
                  title: '매일',
                  value: _repeatSetting == RepeatSetting.daily,
                  onChanged: (value) {
                    setState(() => _repeatSetting =
                        value! ? RepeatSetting.daily : _repeatSetting);
                  },
                ),
                CalendarAppDivider(),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    RepeatSettingCheckboxListTile(
                        title: '매주',
                        value: _repeatSetting == RepeatSetting.weekly,
                        onChanged: (value) {
                          setState(() => _repeatSetting =
                              value! ? RepeatSetting.weekly : _repeatSetting);
                        }),
                    AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      height: _repeatSetting == RepeatSetting.weekly ? 48 : 0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: List.generate(
                          DayOfTheWeek.values.length,
                          (index) {
                            return Container(
                              width: 28,
                              height: 28,
                              padding: EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 20,
                              ),
                              decoration: BoxDecoration(
                                color: _repeatSetting == RepeatSetting.weekly
                                    ? AppPalette.primary
                                    : AppPalette.transparent,
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: Text(
                                  DayOfTheWeek.values[index].value,
                                  style: _repeatSetting == RepeatSetting.weekly
                                      ? AppTextStyles.style16Medium(
                                          color: AppPalette.grey100)
                                      : AppTextStyles.style14Medium(
                                          color: AppPalette.grey700),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                CalendarAppDivider(),
                RepeatSettingCheckboxListTile(
                  title: '매월',
                  value: _repeatSetting == RepeatSetting.monthly,
                  onChanged: (value) {
                    setState(() => _repeatSetting =
                        value! ? RepeatSetting.monthly : _repeatSetting);
                  },
                ),
                CalendarAppDivider(),
                RepeatSettingCheckboxListTile(
                  title: '매년',
                  value: _repeatSetting == RepeatSetting.yearly,
                  onChanged: (value) {
                    setState(() => _repeatSetting =
                        value! ? RepeatSetting.yearly : _repeatSetting);
                  },
                ),
                CalendarAppDivider(),
                CalendarAppListTile(
                  onTap: () {
                    context.goNamed(RoutePath.repeatEndSettingScreenRoute);
                  },
                  title: Text('반복 종료 설정', style: AppTextStyles.style16Medium()),
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                  borderRadius: BorderRadius.zero,
                  trailing: CalendarAppSquareIcon.chevronRight(16),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
