import 'package:calendar_flutter/core/utils/log_util.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProviderLogger implements ProviderObserver {
  @override
  void didAddProvider(
    ProviderBase<Object?> provider,
    Object? value,
    ProviderContainer container,
  ) {
    logger.d('[ADD] ${provider.name}: $value');
  }

  @override
  void didDisposeProvider(
    ProviderBase<Object?> provider,
    ProviderContainer container,
  ) {
    logger.d('[DISPOSE] ${provider.name}');
  }

  @override
  void didUpdateProvider(
    ProviderBase<Object?> provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    logger.d('[UPDATE] ${provider.name} $previousValue → $newValue');
  }

  @override
  void providerDidFail(
    ProviderBase<Object?> provider,
    Object error,
    StackTrace stackTrace,
    ProviderContainer container,
  ) {
    logger.e('[ERROR] ${provider.name}');
  }
}
