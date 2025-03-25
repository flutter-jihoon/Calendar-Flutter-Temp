import 'package:calendar_flutter/core/utils/text_style_util.dart';
import 'package:calendar_flutter/core/widgets/calendar_app_dialog.dart';
import 'package:calendar_flutter/core/widgets/calendar_app_input_dialog.dart';
import 'package:calendar_flutter/core/widgets/calendar_app_list_tile.dart';
import 'package:calendar_flutter/core/widgets/calendar_app_main_app_bar.dart';
import 'package:calendar_flutter/core/widgets/calendar_app_square_icons.dart';
import 'package:calendar_flutter/domain/entities/calendar.dart';
import 'package:calendar_flutter/presentation/providers/calendar_list_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter/material.dart';

class CalendarManageScreen extends ConsumerStatefulWidget {
  const CalendarManageScreen({super.key});

  @override
  ConsumerState<CalendarManageScreen> createState() =>
      _TimetableManageScreenState();
}

class _TimetableManageScreenState extends ConsumerState<CalendarManageScreen> {
  @override
  Widget build(BuildContext context) {
    final AsyncValue<List<Calendar>> timetables =
        ref.watch(calendarListProvider);
    return Scaffold(
      appBar: CalendarAppMainAppBar(title: '캘린더 관리'),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 24, 16, 8),
              child: Text('캘린더 리스트', style: AppTextStyles.style13Medium()),
            ),
            timetables.when(
              data: (data) {
                return Expanded(
                  child: ReorderableListView.builder(
                    onReorder: (oldIndex, newIndex) {
                      ref
                          .read(calendarListProvider.notifier)
                          .rearrangeCalendar(oldIndex, newIndex);
                    },
                    proxyDecorator: (child, index, animation) =>
                        Material(child: child),
                    shrinkWrap: true,
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      final Calendar timetable = data[index];
                      return CalendarAppListTile(
                        padding: const EdgeInsets.fromLTRB(16, 12, 8, 12),
                        borderRadius: BorderRadius.zero,
                        key: ValueKey(timetable.title),
                        title: Text(
                          timetable.title,
                          style: AppTextStyles.style15Medium(),
                        ),
                        onTap: () {},
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            InkWell(
                              child: Padding(
                                padding: const EdgeInsets.all(8),
                                child: CalendarAppSquareIcon.edit(20),
                              ),
                              onTap: () async {
                                final TextEditingController
                                    textEditingController =
                                    TextEditingController(
                                        text: timetable.title);
                                final bool? result = await showDialog<bool>(
                                  context: context,
                                  builder: (context) {
                                    return CalendarAppInputDialog(
                                      title: '캘린더 이름 수정',
                                      hintText: '캘린더 이름',
                                      primaryButtonText: '확인',
                                      secondaryButtonText: '취소',
                                    );
                                  },
                                );
                                final String name = textEditingController.text;
                                if (result == true && name.isNotEmpty) {
                                  ref
                                      .read(calendarListProvider.notifier)
                                      .renameCalendar(timetable, name);
                                }
                              },
                            ),
                            InkWell(
                              customBorder: CircleBorder(),
                              child: Padding(
                                padding: const EdgeInsets.all(8),
                                child: CalendarAppSquareIcon.delete(20),
                              ),
                              onTap: () async {
                                final bool? result = await showDialog<bool>(
                                  context: context,
                                  builder: (context) {
                                    return CalendarAppDialog(
                                      title: '캘린더 삭제',
                                      subtitle: '정말 삭제하시겠습니까?',
                                      primaryButtonText: '확인',
                                      secondaryButtonText: '취소',
                                    );
                                  },
                                );
                                if (result == true) {
                                  ref
                                      .read(calendarListProvider.notifier)
                                      .removeCalenar(timetable);
                                }
                              },
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8),
                              child: ReorderableDragStartListener(
                                index: index,
                                child: CalendarAppSquareIcon.move(20),
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                );
              },
              loading: () {
                return const Center(child: CircularProgressIndicator());
              },
              error: (error, stackTrace) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('에러가 발생했습니다'),
                      ElevatedButton(
                        onPressed: () {
                          ref.invalidate(calendarListProvider);
                        },
                        child: const Text('다시 시도'),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
