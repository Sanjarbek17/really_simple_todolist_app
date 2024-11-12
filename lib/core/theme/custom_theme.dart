import 'package:flutter/material.dart';
import 'package:really_simple_todolist_app/core/theme/custom_colors.dart';

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: Colors.red,
  colorScheme: ColorScheme.fromSwatch(
    primarySwatch: const MaterialColor(
      0xff24A19C,
      <int, Color>{
        50: Color(0xffE0F7F5),
        100: Color(0xffB3EBE7),
        200: Color(0xff80DED8),
        300: Color(0xff4DD1C9),
        400: Color(0xff26C7BD),
        500: Color(0xff00BDB1),
        600: Color(0xff00B7A9),
        700: Color(0xff00AE9F),
        800: Color(0xff00A696),
        900: Color(0xff009785),
      },
    ),
  ),
  // primarySwatch: const MaterialColor(0xff24A19C, {
  //   50: Color(0xffE0F7F5),
  //   100: Color(0xffB3EBE7),
  //   200: Color(0xff80DED8),
  //   300: Color(0xff4DD1C9),
  //   400: Color(0xff26C7BD),
  //   500: Color(0xff00BDB1),
  //   600: Color(0xff00B7A9),
  //   700: Color(0xff00AE9F),
  //   800: Color(0xff00A696),
  //   900: Color(0xff009785),
  // }),
  scaffoldBackgroundColor: Colors.white,
  // AppBarr
  appBarTheme: const AppBarTheme(
    backgroundColor: CustomColors.lightsecondaryColor,
    centerTitle: true,
  ),
  // BottomNavigationBar
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: CustomColors.lightsecondaryColor,
    // ItemColor
    selectedItemColor: CustomColors.lightPrimaryColor,
    unselectedItemColor: Colors.grey,
    // IconColor
    // selectedIconTheme: IconThemeData(color: Colors.white),
    // unselectedIconTheme: IconThemeData(color: Colors.white),
  ),
);

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: CustomColors.primaryColor,
  scaffoldBackgroundColor: CustomColors.primaryColor,
  // AppBarr
  appBarTheme: const AppBarTheme(
    backgroundColor: CustomColors.primaryColor,
    centerTitle: true,
  ),
  // BottomNavigationBar
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: CustomColors.secondaryColor,
    // ItemColor
    selectedItemColor: Colors.white,
    unselectedItemColor: Colors.grey,
    // IconColor
    // selectedIconTheme: IconThemeData(color: Colors.white),
    // unselectedIconTheme: IconThemeData(color: Colors.white),
  ),
);

const TextTheme textTheme = TextTheme();
