import 'package:calendar_flutter/core/utils/text_style_util.dart';
import 'package:calendar_flutter/core/widgets/calendar_app_app_bar.dart';
import 'package:calendar_flutter/core/widgets/calendar_app_divider.dart';
import 'package:calendar_flutter/core/widgets/calendar_app_list_tile.dart';
import 'package:flutter/material.dart';

class RepeatEndSettingScreen extends StatelessWidget {
  const RepeatEndSettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CalendarAppAppBar(title: '반복'),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: Column(
              children: [
                SizedBox(height: 4),
                CalendarAppListTile(
                  title: Text('종료되지 않음', style: AppTextStyles.style16Medium()),
                  padding: EdgeInsets.symmetric(vertical: 20),
                  borderRadius: BorderRadius.circular(0),
                ),
                CalendarAppDivider(),
                CalendarAppListTile(
                  title: Text('날짜', style: AppTextStyles.style16Medium()),
                  padding: EdgeInsets.symmetric(vertical: 20),
                  borderRadius: BorderRadius.circular(0),
                ),
                CalendarAppDivider(),
                CalendarAppListTile(
                  title: Text('횟수', style: AppTextStyles.style16Medium()),
                  padding: EdgeInsets.symmetric(vertical: 20),
                  borderRadius: BorderRadius.circular(0),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
