import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'fonts.dart';

abstract class Themes {
  static ThemeData lightTheme = ThemeData.light(useMaterial3: true).copyWith(
    // fontFamily: Fonts.fontNunito,
      colorScheme: const ColorScheme.light(
        primary: AppColors.bgPrimary,
      ),
      textTheme: Typography().black.apply(fontFamily: Fonts.fontNunito));

  static ThemeData darkTheme = ThemeData.dark(useMaterial3: true).copyWith(
    // fontFamily: Fonts.fontNunito,
      colorScheme: const ColorScheme.light(
        primary: AppColors.bgPrimary,
      ),
      textTheme: Typography().white.apply(fontFamily: Fonts.fontNunito));
}
