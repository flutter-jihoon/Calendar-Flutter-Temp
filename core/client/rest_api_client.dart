import 'package:calendar_flutter/core/constants/rest_api_constants.dart';
import 'package:calendar_flutter/core/enums/server_type.dart';
import 'package:calendar_flutter/core/providers/current_user_provider.dart';
import 'package:calendar_flutter/core/providers/server_type_provider.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final Provider<Dio> timespreadClientProvider = Provider((ref) {
  final String accessToken = ref.watch(currentUserProvider).accessToken;
  final ServerType serverType = ref.watch(serverTypeProvider);
  return Dio(
    BaseOptions(
      baseUrl: RestApiConstants.getTimespreadUrl(serverType),
      headers: {'Authorization': 'Bearer $accessToken'},
    ),
  )..interceptors.addAll([LogInterceptor()]);
}, name: 'TimespreadClientProvider');
