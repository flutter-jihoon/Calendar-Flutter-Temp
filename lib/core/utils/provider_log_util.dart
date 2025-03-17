import 'package:calendar_flutter/core/utils/log_util.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProviderLogger implements ProviderObserver {
  @override
  void didAddProvider(
    ProviderBase<Object?> provider,
    Object? value,
    ProviderContainer container,
  ) {
    logger.i('Provider ${provider.name} was initialized with $value');
  }

  @override
  void didDisposeProvider(
    ProviderBase<Object?> provider,
    ProviderContainer container,
  ) {
    logger.i('Provider ${provider.name} was disposed');
  }

  @override
  void didUpdateProvider(
    ProviderBase<Object?> provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    logger.i(
        'Provider ${provider.name} updated from $previousValue to $newValue');
  }

  @override
  void providerDidFail(
    ProviderBase<Object?> provider,
    Object error,
    StackTrace stackTrace,
    ProviderContainer container,
  ) {
    logger.i('Provider ${provider.name} threw $error at $stackTrace');
  }
}
