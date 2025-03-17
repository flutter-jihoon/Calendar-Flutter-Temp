import 'package:calendar_flutter/core/constants/host_api_method.dart';
import 'package:calendar_flutter/data/datasources/host/host_datasource.dart';
import 'package:calendar_flutter/data/models/host/host_api_response.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final hostRepositoryProvider = Provider<HostRepository>(
  (ref) => HostRepositoryImpl(ref.watch(hostDatasourceProvider)),
  name: 'HostRepositoryProvider',
);

abstract interface class HostRepository {
  Future<bool> connectToGoogleCalendar();
}

class HostRepositoryImpl implements HostRepository {
  final HostDatasource _hostDatasource;

  HostRepositoryImpl(this._hostDatasource);

  @override
  Future<bool> connectToGoogleCalendar() {
    final Future<HostApiResponse?> response =
        _hostDatasource.invokeMethodWithTimeout(
      HostApiMethod.connectToGoogleCalendar,
    );
    return response.then((value) => value?.result as bool);
  }
}
