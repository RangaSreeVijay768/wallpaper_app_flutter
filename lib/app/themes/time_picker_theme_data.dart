import 'package:flutter/material.dart';
import 'edge_insets.dart';
import 'app_colors.dart';
import 'fonts.dart';
import 'borders.dart';


abstract class TimeData{
  static TimePickerThemeData timePickerThemeData = TimePickerThemeData(
    backgroundColor: AppColors.grey2,
    cancelButtonStyle: TextButton.styleFrom(backgroundColor: Colors.red),
    hourMinuteShape: RoundedRectangleBorder(
      borderRadius: borderRadius.br_10,
      side: BorderSide(color: AppColors.bgPrimary, width: 4),
    ),
    dayPeriodBorderSide: const BorderSide(color: AppColors.bgPrimary, width: 4),
    dayPeriodColor: Colors.green.shade600,
    shape: RoundedRectangleBorder(
      borderRadius: borderRadius.br_30,
      side: const BorderSide(color: AppColors.bgPrimary, width: 4),
    ),
    dayPeriodTextColor: Colors.green,
    dayPeriodShape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      side: BorderSide(color: AppColors.bgPrimary, width: 4),
    ),
    hourMinuteColor: MaterialStateColor.resolveWith((states) =>
    states.contains(MaterialState.selected) ? AppColors.bgPrimary : Colors.blueGrey.shade800),
    hourMinuteTextColor: MaterialStateColor.resolveWith(
            (states) => states.contains(MaterialState.selected) ? Colors.white : AppColors.bgPrimary),
    dialHandColor: AppColors.bgPrimary,
    dialBackgroundColor: AppColors.primary,
    hourMinuteTextStyle: const TextStyle(fontSize: Fonts.fontSize32, fontWeight: Fonts.f700),
    dayPeriodTextStyle: const TextStyle(fontSize: Fonts.fontSize32, fontWeight: Fonts.f700),
    helpTextStyle: const TextStyle(fontSize: Fonts.fontSize24, fontWeight: Fonts.f700, color: AppColors.bgPrimary2),
    inputDecorationTheme: const InputDecorationTheme(
      border: InputBorder.none,
      contentPadding: edge_insets_0,
    ),
    dialTextColor: MaterialStateColor.resolveWith(
            (states) => states.contains(MaterialState.selected) ? Colors.white : Colors.white),
    entryModeIconColor: AppColors.bgPrimary,
  );
}