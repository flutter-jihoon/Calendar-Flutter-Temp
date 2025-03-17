import 'package:calendar_flutter/core/utils/color_util.dart';
import 'package:flutter/material.dart';

abstract final class ThemeUtil {
  static ThemeData appThemeData = ThemeData(
    brightness: Brightness.light,
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(seedColor: AppPalette.primary),
    unselectedWidgetColor: AppPalette.grey300,
    textTheme: TextTheme(
      displayLarge: TextStyle(color: AppPalette.grey700),
      displayMedium: TextStyle(color: AppPalette.grey700),
      displaySmall: TextStyle(color: AppPalette.grey700),
      headlineLarge: TextStyle(color: AppPalette.grey700),
      headlineMedium: TextStyle(color: AppPalette.grey700),
      headlineSmall: TextStyle(color: AppPalette.grey700),
      titleLarge: TextStyle(color: AppPalette.grey700),
      titleMedium: TextStyle(color: AppPalette.grey700),
      titleSmall: TextStyle(color: AppPalette.grey700),
      bodyLarge: TextStyle(color: AppPalette.grey700),
      bodyMedium: TextStyle(color: AppPalette.grey700),
      bodySmall: TextStyle(color: AppPalette.grey700),
      labelLarge: TextStyle(color: AppPalette.grey700),
      labelMedium: TextStyle(color: AppPalette.grey700),
      labelSmall: TextStyle(color: AppPalette.grey700),
    ),
    scaffoldBackgroundColor: AppPalette.grey100,
    canvasColor: AppPalette.grey100,
    dialogTheme: const DialogTheme(
      backgroundColor: AppPalette.grey100,
      surfaceTintColor: Colors.transparent,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppPalette.primary,
      foregroundColor: AppPalette.grey100,
      iconSize: 32,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100),
      ),
      elevation: 0,
      focusElevation: 0,
      hoverElevation: 0,
      disabledElevation: 0,
      highlightElevation: 0,
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppPalette.grey100,
      hoverColor: AppPalette.grey100,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: BorderSide(color: AppPalette.primary),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: BorderSide(color: AppPalette.grey400),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: BorderSide(color: AppPalette.primary, width: 2.0),
      ),
      hintStyle: TextStyle(
        color: AppPalette.grey400,
        fontWeight: FontWeight.normal,
      ),
      labelStyle: TextStyle(color: AppPalette.primary),
      contentPadding: EdgeInsets.zero,
      isDense: true,
    ),
    appBarTheme: AppBarTheme(
      toolbarHeight: 48,
      backgroundColor: AppPalette.grey100,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.black),
      scrolledUnderElevation: 0,
      titleTextStyle: TextStyle(
        color: AppPalette.grey700,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    ),
    radioTheme: RadioThemeData(
      fillColor: WidgetStateProperty.all(AppPalette.primary),
    ),
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: AppPalette.grey100,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
    ),
    drawerTheme: DrawerThemeData(
      elevation: 0,
      backgroundColor: AppPalette.grey100,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.zero,
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(AppPalette.primary),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(AppPalette.primary),
      ),
    ),
    listTileTheme: ListTileThemeData(
      tileColor: AppPalette.grey100,
      selectedColor: AppPalette.grey800,
      selectedTileColor: AppPalette.grey300,
    ),
    datePickerTheme: DatePickerThemeData(
      weekdayStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
      dayBackgroundColor:
          WidgetStateProperty.resolveWith((Set<WidgetState> states) {
        return states.contains(WidgetState.selected) ? AppPalette.bg01 : null;
      }),
      dayForegroundColor:
          WidgetStateProperty.resolveWith((Set<WidgetState> states) {
        return states.contains(WidgetState.selected)
            ? AppPalette.primary
            : null;
      }),
      dayShape: WidgetStateProperty.resolveWith((Set<WidgetState> states) {
        return states.contains(WidgetState.selected)
            ? CircleBorder(
                side: BorderSide(
                  color: AppPalette.primary,
                  width: 2,
                ),
              )
            : null;
      }),
      dayStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
      todayBackgroundColor: WidgetStateProperty.all(AppPalette.primary),
      todayForegroundColor: WidgetStateProperty.all(AppPalette.grey100),
    ),
    dividerColor: AppPalette.divider,
  );
}
