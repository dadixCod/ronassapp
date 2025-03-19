import 'package:flutter/material.dart';
import 'package:ronasapp/core/core.dart';

@immutable
class AppTheme {
  const AppTheme._();

  static final dark = ThemeData(
    fontFamily: 'Poppins',
    splashColor: Colors.transparent,
    colorScheme: const ColorScheme(
      brightness: Brightness.dark,
      primary: AppColors.lightenBlueColor,
      onPrimary: AppColors.lightenBlueColor,
      secondary: AppColors.secondaryColor,
      onSecondary: AppColors.secondaryColor,
      tertiary: AppColors.blueColor,
      onTertiary: AppColors.blueColor,
      outline: Color.fromARGB(255, 100, 98, 130),
      error: Colors.red,
      onError: Colors.red,
      background: AppColors.backgroundColor,
      onBackground: AppColors.backgroundColor,
      surface: AppColors.backgroundColor,
      onSurface: AppColors.whiteColor,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.backgroundColor,
      selectedItemColor: AppColors.lightenBlueColor,
      elevation: 0,
    ),
    scaffoldBackgroundColor: AppColors.backgroundColor,
  );
}
