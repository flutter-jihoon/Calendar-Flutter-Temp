import 'package:calendar_flutter/core/constants/route_path.dart';
import 'package:calendar_flutter/core/enums/day_of_the_week.dart';
import 'package:calendar_flutter/core/utils/color_util.dart';
import 'package:calendar_flutter/core/utils/text_style_util.dart';
import 'package:calendar_flutter/core/widgets/calendar_app_main_app_bar.dart';
import 'package:calendar_flutter/core/widgets/calendar_app_bottom_button.dart';
import 'package:calendar_flutter/core/widgets/calendar_app_square_icons.dart';
// import 'package:calendar_flutter/core/widgets/calendar_app_date_picker.dart';
import 'package:calendar_flutter/core/widgets/calendar_app_switch.dart';
import 'package:calendar_flutter/core/widgets/calendar_app_time_picker.dart';
import 'package:calendar_flutter/presentation/screens/add_event/widgets/color_pallete.dart';
import 'package:calendar_flutter/presentation/screens/add_event/widgets/event_switch_tile.dart';
import 'package:calendar_flutter/presentation/screens/add_event/widgets/event_text_field.dart';
import 'package:calendar_flutter/presentation/screens/add_event/widgets/event_tile.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AddEventScreen extends StatefulWidget {
  const AddEventScreen({super.key});

  @override
  State<AddEventScreen> createState() => _AddEventScreenState();
}

class _AddEventScreenState extends State<AddEventScreen> {
  late DateTime _startTime;
  late DateTime _endTime;

  bool _isAllDay = false;
  bool _isScreenLockMode = false;

  late TextEditingController _titleController;
  late TextEditingController _locationController;
  late TextEditingController _memoController;

  @override
  void initState() {
    super.initState();

    final DateTime now = DateTime.now();
    _startTime = DateTime(now.year, now.month, now.day, now.hour, 0);
    _endTime = DateTime(now.year, now.month, now.day, now.hour + 1, 0);

    _titleController = TextEditingController();
    _locationController = TextEditingController();
    _memoController = TextEditingController();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _locationController.dispose();
    _memoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPalette.grey200,
      appBar: CalendarAppMainAppBar(title: '일정 추가'),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
                  child: Column(
                    children: [
                      EventTextField(
                        controller: _titleController,
                        maxLength: 100,
                        label: '제목',
                      ),
                      Block(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              children: [
                                CalendarAppSquareIcon.clock(20),
                                SizedBox(width: 6),
                                Text(
                                  '하루 종일',
                                  style: AppTextStyles.style16Regular(),
                                ),
                                Spacer(),
                                CalendarAppSwitch(
                                  value: _isAllDay,
                                  onChanged: (bool value) {
                                    setState(() => _isAllDay = value);
                                  },
                                ),
                              ],
                            ),
                            if (!_isAllDay)
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 38, vertical: 24),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          '${_startTime.month}월 ${_startTime.day}일 (${DayOfTheWeek.values[_startTime.weekday % 7].value})',
                                          style: AppTextStyles.style16Medium(),
                                        ),
                                        SizedBox(height: 12),
                                        Text(
                                          '${_startTime.hour > 12 ? '오후 ${_startTime.hour - 12}' : '오전 ${_startTime.hour}'}:${_startTime.minute.toString().padLeft(2, '0')}',
                                          style: AppTextStyles.style16Medium(),
                                        ),
                                      ],
                                    ),
                                    CalendarAppSquareIcon.arrowRight(20),
                                    Column(
                                      children: [
                                        Text(
                                          '${_endTime.month}월 ${_endTime.day}일 (${DayOfTheWeek.values[_endTime.weekday % 7].value})',
                                          style: AppTextStyles.style16Medium(),
                                        ),
                                        SizedBox(height: 12),
                                        Text(
                                          '${_endTime.hour > 12 ? '오후 ${_endTime.hour - 12}' : '오전 ${_endTime.hour}'}:${_endTime.minute.toString().padLeft(2, '0')}',
                                          style: AppTextStyles.style16Medium(),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            Padding(
                              padding: const EdgeInsets.only(top: 4),
                              child: SizedBox(
                                height: 177,
                                child: CalendarAppTimePicker(
                                  onTimeChanged: (value) {},
                                ),
                                // child: CalendarAppDatePicker(
                                //   onDateChanged: (value) {},
                                //   initialDate: DateTime.now(),
                                //   currentDate: DateTime.now(),
                                //   firstDate: DateTime(1900, 1, 1),
                                //   lastDate: DateTime(2100, 1, 1),
                                // ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      EventTextField(
                        controller: _locationController,
                        maxLength: 100,
                        label: '장소',
                      ),
                      EventTile(
                        iconPath:
                            'packages/calendar_flutter/assets/icons/repeat.webp',
                        label: '반복 안함',
                        onTap: () =>
                            context.goNamed(RoutePath.repeatSettingScreenRoute),
                      ),
                      EventTile(
                        iconPath:
                            'packages/calendar_flutter/assets/icons/bell.webp',
                        label: '10분 전',
                        onTap: () => context
                            .goNamed(RoutePath.notificationSettingScreenRoute),
                      ),
                      if (defaultTargetPlatform == TargetPlatform.android)
                        EventSwitchTile(
                          iconPath:
                              'packages/calendar_flutter/assets/icons/lock.webp',
                          label: '꽉잠금 모드',
                          value: _isScreenLockMode,
                          onChanged: (bool value) {
                            setState(() => _isScreenLockMode = value);
                          },
                        ),
                      ColorPalette(),
                      EventTextField(
                        controller: _memoController,
                        maxLength: 500,
                        label: '메모',
                      ),
                    ],
                  ),
                ),
              ),
            ),
            CalendarAppBottomButton(
              text: '저장',
              onPressed: () {
                context.pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}

class Block extends StatelessWidget {
  final Widget child;
  final VoidCallback? onTap;
  const Block({required this.child, this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        decoration: BoxDecoration(
          color: AppPalette.grey100,
          borderRadius: BorderRadius.circular(12),
        ),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(12),
          child: child,
        ),
      ),
    );
  }
}
