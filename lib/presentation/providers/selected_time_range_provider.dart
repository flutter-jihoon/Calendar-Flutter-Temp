import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final selectedTimeRangeProvider = StateProvider.autoDispose<DateTimeRange?>(
  (ref) => null,
  name: 'SelectedTimeRangeProvider',
);
