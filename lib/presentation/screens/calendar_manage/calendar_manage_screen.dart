import 'package:calendar_flutter/core/utils/color_util.dart';
import 'package:calendar_flutter/core/utils/text_style_util.dart';
import 'package:calendar_flutter/core/widgets/calendar_app_dialog.dart';
import 'package:calendar_flutter/core/widgets/calendar_app_input_dialog.dart';
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
      appBar: AppBar(title: Text('캘린더 관리'), centerTitle: true),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 6,
                ),
                child: Text(
                  '캘린더 리스트',
                  style: AppTextStyles.style12Regular(
                    color: AppPalette.grey500,
                  ),
                ),
              ),
              timetables.when(
                data: (data) {
                  return ReorderableListView.builder(
                    onReorder: (oldIndex, newIndex) {
                      ref
                          .read(calendarListProvider.notifier)
                          .rearrangeCalendar(oldIndex, newIndex);
                    },
                    shrinkWrap: true,
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      final Calendar timetable = data[index];
                      return ListTile(
                        key: ValueKey(timetable.title),
                        title: Text(timetable.title),
                        onTap: () {},
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: Icon(Icons.edit_outlined),
                              onPressed: () async {
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
                            IconButton(
                              icon: Icon(Icons.delete_outlined),
                              onPressed: () async {
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
                            ReorderableDragStartListener(
                              index: index,
                              child: Icon(Icons.drag_handle),
                            )
                          ],
                        ),
                      );
                    },
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
      ),
    );
  }
}
