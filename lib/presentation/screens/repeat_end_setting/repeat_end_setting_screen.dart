import 'package:calendar_flutter/core/widgets/calendar_app_main_app_bar.dart';
import 'package:calendar_flutter/core/widgets/calendar_app_divider.dart';
import 'package:flutter/material.dart';

class RepeatEndSettingScreen extends StatelessWidget {
  const RepeatEndSettingScreen({super.key});

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
                // RepeatSettingCheckboxListTile(title: '종료되지 않음'),
                CalendarAppDivider(),
                // RepeatSettingCheckboxListTile(title: '날짜'),
                CalendarAppDivider(),
                // RepeatSettingCheckboxListTile(title: '횟수'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
