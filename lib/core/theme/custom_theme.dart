import 'package:flutter/material.dart';
import 'package:really_simple_todolist_app/core/theme/custom_colors.dart';

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: Colors.red,
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.light,
    seedColor: CustomColors.lightPrimaryColor,
    primary: CustomColors.lightPrimaryColor,
    secondary: CustomColors.lightsecondaryColor,
    surface: CustomColors.lightsecondaryColor,
  ),
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: const AppBarTheme(
    backgroundColor: CustomColors.lightsecondaryColor,
    centerTitle: true,
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: CustomColors.lightsecondaryColor,
    selectedItemColor: CustomColors.lightPrimaryColor,
    unselectedItemColor: Colors.grey,
  ),
);

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: CustomColors.purple,
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: CustomColors.purple,
    primary: CustomColors.purple,
    onPrimary: Colors.white,
    secondary: CustomColors.purple,
    surface: CustomColors.purple,
    onSurface: Colors.white,
  ),
  scaffoldBackgroundColor: CustomColors.primaryColor,
  appBarTheme: const AppBarTheme(
    backgroundColor: CustomColors.primaryColor,
    centerTitle: true,
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: CustomColors.secondaryColor,
    selectedItemColor: Colors.white,
    unselectedItemColor: Colors.grey,
  ),
);

const TextTheme textTheme = TextTheme();
