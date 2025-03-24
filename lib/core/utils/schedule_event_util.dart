import 'package:calendar_flutter/domain/entities/schedule_event.dart';

extension GroupScheduleEventExtension on List<ScheduleEvent> {
  List<List<ScheduleEvent>> groupEvents() {
    _sort();
    final List<List<ScheduleEvent>> grouped = [];
    List<ScheduleEvent> currentGroup = [];

    for (final event in this) {
      if (currentGroup.isEmpty ||
          _areEventsOverlapping(currentGroup.last, event)) {
        currentGroup.add(event);
      } else {
        grouped.add(currentGroup);
        currentGroup = [event];
      }
    }

    if (currentGroup.isNotEmpty) grouped.add(currentGroup);
    return grouped;
  }

  /// 시작 시간이 빠른 순으로, 종료 시간이 빠른 순으로, 생성 시간이 빠른 이벤트 순으로 정렬
  void _sort() {
    sort((a, b) {
      final aStart = a.originalInstanceStartDate;
      final bStart = b.originalInstanceStartDate;
      if (aStart != bStart) return aStart.compareTo(bStart);

      final aEnd = a.originalInstanceEndDate;
      final bEnd = b.originalInstanceEndDate;
      if (aEnd != bEnd) return aEnd.compareTo(bEnd);

      final aCreatedAt = a.createdAt;
      final bCreatedAt = b.createdAt;
      return aCreatedAt.compareTo(bCreatedAt);
    });
  }

  bool _areEventsOverlapping(ScheduleEvent a, ScheduleEvent b) {
    final aEnd = a.originalInstanceEndDate;
    final bStart = b.originalInstanceStartDate;
    return aEnd.isAfter(bStart);
  }
}
