import 'package:flutter/material.dart';

class LightThemeMode {
  static ThemeData theme = ThemeData(
      scaffoldBackgroundColor: const Color(0xffFFFFFF),
      appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          titleTextStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18),
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black)),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xffAA0023))));
}
