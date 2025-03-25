import 'package:calendar_flutter/core/constants/route_path.dart';
import 'package:calendar_flutter/core/utils/color_util.dart';
import 'package:calendar_flutter/core/utils/text_style_util.dart';
import 'package:calendar_flutter/core/widgets/calendar_app_button.dart';
import 'package:calendar_flutter/core/widgets/calendar_app_square_icons.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class AddEventBottomSheet extends StatefulWidget {
  final DateTime startTime;
  final DateTime endTime;

  const AddEventBottomSheet({
    required this.startTime,
    required this.endTime,
    super.key,
  });

  @override
  State<AddEventBottomSheet> createState() => _AddEventBottomSheetState();
}

class _AddEventBottomSheetState extends State<AddEventBottomSheet> {
  late TextEditingController _titleController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController();
  }

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppPalette.grey100,
        borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
        boxShadow: [
          BoxShadow(
            color: AppPalette.grey800.withOpacity(0.25),
            blurRadius: 4,
            spreadRadius: 0,
          )
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 28),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: CalendarAppSquareIcon.closeNavigation(24),
                onPressed: context.pop,
              ),
              GestureDetector(
                onTap: () {
                  final String title = _titleController.text;
                  context.goNamed(
                    RoutePath.addScheduleScreenRoute,
                    extra: title.isNotEmpty ? (title: title) : null,
                  );
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CalendarAppSquareIcon.keyboard(24),
                    SizedBox(width: 5),
                    Text('상세 입력', style: AppTextStyles.style15Medium()),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 28),
          TextField(
            controller: _titleController,
            style: AppTextStyles.style18Bold(),
            decoration: InputDecoration(
              hintText: '제목',
              hintStyle: AppTextStyles.style18Bold(),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppPalette.transparent),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppPalette.transparent),
              ),
              contentPadding: EdgeInsets.all(0),
              isDense: true,
            ),
          ),
          SizedBox(height: 16),
          Row(
            children: [
              CalendarAppSquareIcon.clock(20),
              SizedBox(width: 6),
              Text(
                '${DateFormat('M월 d일 a hh:mm', 'ko').format(widget.startTime)} ~ ${DateFormat('a hh:mm', 'ko').format(widget.endTime)}',
                style: AppTextStyles.style16Medium(),
              ),
            ],
          ),
          SizedBox(height: 28),
          CalendarAppButton(text: '저장', onPressed: () {}),
        ],
      ),
    );
  }
}
