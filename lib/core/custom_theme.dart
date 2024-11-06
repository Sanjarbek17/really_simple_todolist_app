import 'package:flutter/material.dart';
import 'package:really_simple_todolist_app/core/custom_colors.dart';

final ThemeData lightTheme = ThemeData(
  primarySwatch: Colors.blue,
  appBarTheme: const AppBarTheme(
    centerTitle: true,
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
