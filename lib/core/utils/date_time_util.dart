extension DateTimeExtension on DateTime {
  bool get isToday {
    final DateTime now = DateTime.now();
    return year == now.year && month == now.month && day == now.day;
  }

  bool isSameDay(DateTime other) {
    return year == other.year && month == other.month && day == other.day;
  }

  DateTime get firstDayOfWeek {
    return subtract(Duration(days: weekday % 7));
  }
}
