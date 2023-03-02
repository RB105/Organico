import 'package:flutter/material.dart';

class DarkThemeMode {
  static ThemeData theme = ThemeData(
      scaffoldBackgroundColor: const Color(0xff171725),
      appBarTheme: const AppBarTheme(
        elevation: 0.0,
          backgroundColor: Colors.transparent,
          iconTheme: IconThemeData(color: Colors.white),
          titleTextStyle: TextStyle(color: Colors.white)),
      listTileTheme: const ListTileThemeData(
        
        iconColor: Colors.white,
        textColor: Colors.white
      ),
      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: Colors.white),
        bodyMedium: TextStyle(color: Colors.white),
        bodySmall: TextStyle(color: Colors.white),
        titleLarge: TextStyle(color: Colors.white),
        titleMedium: TextStyle(color: Colors.white),
        titleSmall: TextStyle(color: Colors.white),
      ),
      inputDecorationTheme: const InputDecorationTheme(
          filled: true, fillColor: Color(0xff1D2335)));
}
