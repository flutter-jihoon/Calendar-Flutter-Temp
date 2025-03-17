import 'package:flutter_riverpod/flutter_riverpod.dart';

final nowProvider = Provider.autoDispose<DateTime>((ref) => DateTime.now(),
    name: 'NowProvider');

/// 지난 주 일요일 ~ 이번 주 토요일까지의 날짜를 반환합니다.
final currentWeekProvider = Provider.autoDispose<List<DateTime>>((ref) {
  final DateTime now = ref.watch(nowProvider);
  final DateTime lastSunday = now.subtract(Duration(days: now.weekday % 7));
  return List.generate(7, (i) => lastSunday.add(Duration(days: i)));
}, name: 'CurrentWeekProvider');
