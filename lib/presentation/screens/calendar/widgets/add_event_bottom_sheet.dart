import 'package:calendar_flutter/core/constants/route_path.dart';
import 'package:calendar_flutter/core/utils/color_util.dart';
import 'package:calendar_flutter/core/utils/text_style_util.dart';
import 'package:calendar_flutter/core/widgets/calendar_app_bottom_button.dart';
import 'package:calendar_flutter/core/widgets/calendar_app_square_icons.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class AddEventBottomSheet extends StatefulWidget {
  final DateTime? startTime;
  final DateTime? endTime;

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
    if (widget.startTime == null || widget.endTime == null) {
      return SizedBox.shrink();
    }
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          // decoration: BoxDecoration(
          //   color: AppPalette.grey100,
          //   borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
          //   boxShadow: [
          //     BoxShadow(
          //       color: AppPalette.grey800.withOpacity(0.25),
          //       blurRadius: 4,
          //       spreadRadius: 0,
          //     )
          //   ],
          // ),
          padding: const EdgeInsets.fromLTRB(9, 21, 16, 28),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Material(
                    color: AppPalette.transparent,
                    child: InkWell(
                      customBorder: const CircleBorder(),
                      onTap: context.pop,
                      child: Padding(
                        padding: const EdgeInsets.all(7),
                        child: CalendarAppSquareIcon.closeNavigation(24),
                      ),
                    ),
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
              Padding(
                padding: const EdgeInsets.only(left: 9),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
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
                          '${DateFormat('M월 d일 a hh:mm', 'ko').format(widget.startTime!)} ~ '
                          '${DateFormat('a hh:mm', 'ko').format(widget.endTime!)}',
                          style: AppTextStyles.style16Medium(),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        CalendarAppBottomButton(text: '저장', onPressed: () {}),
      ],
    );
  }
}
