import 'package:calendar_flutter/core/providers/go_router_provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:calendar_flutter/core/utils/theme_util.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CalendarApp extends ConsumerWidget {
  const CalendarApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final GoRouter goRouter = ref.watch(goRouterProvider);
    return MaterialApp.router(
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [Locale('ko', 'KR')],
      locale: const Locale('ko', 'KR'),
      theme: ThemeUtil.appThemeData,
      routeInformationProvider: goRouter.routeInformationProvider,
      routeInformationParser: goRouter.routeInformationParser,
      routerDelegate: goRouter.routerDelegate,
      builder: (context, child) {
        return GestureDetector(
          onTap: () {
            final FocusScopeNode currentFocus = FocusScope.of(context);
            if (!currentFocus.hasPrimaryFocus &&
                currentFocus.focusedChild != null) {
              currentFocus.focusedChild!.unfocus();
            }
          },
          child: MediaQuery(
            data: MediaQuery.of(context).copyWith(
              textScaler: TextScaler.linear(1.0),
            ),
            child: child!,
          ),
        );
      },
    );
  }
}
