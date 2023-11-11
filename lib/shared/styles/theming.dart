import 'package:flutter/material.dart';
import 'package:todo_application/shared/styles/colors.dart';

class MyThemeData {
  static ThemeData lightTheme = ThemeData(
      scaffoldBackgroundColor: mintGreen,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: primary,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.white,
      ));
  static ThemeData darkTheme = ThemeData(
      scaffoldBackgroundColor: dark,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: primary,
        unselectedItemColor: Colors.white,
        backgroundColor: Colors.white,
      ));
}
