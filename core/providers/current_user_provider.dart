import 'package:calendar_flutter/domain/entities/current_user.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final currentUserProvider = Provider<CurrentUser>(
  (ref) => throw UnimplementedError(),
  name: 'CurrentUserProvider',
);
