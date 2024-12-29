import 'package:delivery_pda/data/tools/styles/res_colors.dart';
import 'package:delivery_pda/data/tools/styles/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



class MyCustomMode {
  ThemeData lightTheme = ThemeData(
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: ResColors.white,
    ),

    textTheme:
    theme.apply(displayColor: ResColors.black, bodyColor: ResColors.black),
    dividerColor: ResColors.colorBlack,
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: ResColors.black,
    ),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: theme.displayMedium?.copyWith(color: ResColors.grey),
      filled: true,
      fillColor: ResColors.white,
    ),
    appBarTheme: const AppBarTheme(color: ResColors.white),
    scaffoldBackgroundColor: ResColors.backgroundColor,
    colorScheme: ColorScheme.fromSeed(
      primary: ResColors.white,
      seedColor: ResColors.white,
    ),
    datePickerTheme: DatePickerThemeData(
      headerBackgroundColor: ResColors.appColorDark,
      dayStyle: TextStyle(color: ResColors.appColorDark),
      todayBorder: BorderSide(color: ResColors.blue, width: 1.w,),
      todayBackgroundColor: WidgetStatePropertyAll(ResColors.appColor),
      rangeSelectionBackgroundColor: ResColors.blue,
      rangeSelectionOverlayColor: const WidgetStatePropertyAll(ResColors.blue),
      rangePickerHeaderBackgroundColor: ResColors.blue,
      dayBackgroundColor: const WidgetStatePropertyAll(ResColors.greyLight,),
    ),
    timePickerTheme: TimePickerThemeData(
      dayPeriodColor: ResColors.appColorLight,
      backgroundColor: ResColors.appColorLight,
      hourMinuteColor: ResColors.colorAppBarText,
      hourMinuteTextColor: ResColors.appColorLight,
      dialBackgroundColor: ResColors.colorAppBarText,
      dialHandColor: ResColors.blackWithOpacity,
      dialTextColor: ResColors.appColorLight,
      helpTextStyle: theme.displayLarge?.copyWith(color: ResColors.black),
      entryModeIconColor: ResColors.colorAppBarText,
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: Colors.black, // This is a custom color variable
      ),
    ),
  );
}
