import 'package:calendar_flutter/core/enums/calendar_setting_enums.dart';
import 'package:calendar_flutter/core/utils/color_util.dart';
import 'package:calendar_flutter/core/utils/text_style_util.dart';
import 'package:calendar_flutter/core/utils/string_util.dart';
import 'package:calendar_flutter/core/widgets/calendar_app_app_bar.dart';
import 'package:calendar_flutter/core/widgets/calendar_app_divider.dart';
import 'package:calendar_flutter/presentation/screens/calendar_setting/widgets/setting_option_button.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class CalendarSettingScreen extends ConsumerStatefulWidget {
  const CalendarSettingScreen({super.key});

  @override
  ConsumerState<CalendarSettingScreen> createState() =>
      _CalendarSelectScreenState();
}

class _CalendarSelectScreenState extends ConsumerState<CalendarSettingScreen> {
  CalendarTheme _selectedTheme = CalendarTheme.basic;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CalendarAppAppBar(title: '캘린더 디자인/설정'),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 24, bottom: 21.5),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('테마', style: AppTextStyles.style15Medium()),
                    SizedBox(height: 12),
                    SizedBox(
                      height: 100,
                      child: ListView.separated(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: CalendarTheme.values.length,
                        itemBuilder: (context, index) {
                          final CalendarTheme theme =
                              CalendarTheme.values[index];
                          final bool isSelected = _selectedTheme == theme;
                          return Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Stack(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.asset(
                                      'packages/calendar_flutter/assets/images/theme_${theme.name}.webp',
                                      width: 72,
                                      height: 72,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  Positioned.fill(
                                      child: Container(
                                    decoration: BoxDecoration(
                                      border: isSelected
                                          ? Border.all(
                                              color: AppPalette.primary,
                                              width: 2,
                                            )
                                          : null,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  )),
                                  Positioned.fill(
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: Material(
                                        color: Colors.transparent,
                                        child: InkWell(
                                          onTap: () => setState(() {
                                            _selectedTheme = theme;
                                          }),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(height: 4),
                              Text(
                                theme.name.capitalize(),
                                style: isSelected
                                    ? AppTextStyles.style13Bold()
                                    : AppTextStyles.style13Regular(
                                        color: AppPalette.grey600,
                                      ),
                              ),
                            ],
                          );
                        },
                        separatorBuilder: (_, __) => SizedBox(width: 8),
                      ),
                    ),
                  ],
                ),
              ),
              CalendarAppDivider(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 23.5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('폰트 색상', style: AppTextStyles.style15Medium()),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(width: 12),
                        Container(
                          width: 24,
                          height: 24,
                          decoration: BoxDecoration(
                            color: AppPalette.grey100,
                            shape: BoxShape.circle,
                          ),
                        ),
                        SizedBox(width: 12),
                        Container(
                          width: 24,
                          height: 24,
                          decoration: BoxDecoration(
                            color: AppPalette.grey700,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              CalendarAppDivider(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 23.5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '폰트 크기',
                      style: AppTextStyles.style15Medium(),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: List.generate(
                        CalendarFontSize.values.length,
                        (index) => Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: SettingRadioButton(
                            value: CalendarFontSize.values[index],
                            groupValue: _selectedTheme,
                            onChanged: (value) => setState(() {
                              // TODO: Implement onChanged
                            }),
                            text: CalendarFontSize.values[index].description,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              CalendarAppDivider(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 23.5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('시간 형식', style: AppTextStyles.style15Medium()),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: List.generate(
                        CalendarTimeFormat.values.length,
                        (index) => Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: SettingRadioButton(
                            value: CalendarTimeFormat.values[index],
                            groupValue: _selectedTheme,
                            onChanged: (value) => setState(() {
                              // TODO: Implement onChanged
                            }),
                            text: CalendarTimeFormat.values[index].description,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              CalendarAppDivider(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 23.5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('한 주의 시작', style: AppTextStyles.style15Medium()),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: List.generate(
                        CalendarFirstDayOfWeek.values.length,
                        (index) => Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: SettingRadioButton(
                            value: CalendarFirstDayOfWeek.values[index],
                            groupValue: _selectedTheme,
                            onChanged: (value) => setState(() {
                              // TODO: Implement onChanged
                            }),
                            text: CalendarFirstDayOfWeek
                                .values[index].description,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              CalendarAppDivider(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 23.5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('현재 시간 표시', style: AppTextStyles.style15Medium()),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: List.generate(
                        CalendarFontSize.values.length,
                        (index) => Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: SettingRadioButton(
                            value: CalendarFontSize.values[index],
                            groupValue: _selectedTheme,
                            onChanged: (value) => setState(() {
                              // TODO: Implement onChanged
                            }),
                            text: CalendarFontSize.values[index].description,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              CalendarAppDivider(),
            ],
          ),
        ),
      ),
    );
  }
}
