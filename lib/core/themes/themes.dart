import 'package:flutter/material.dart';

final lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: Color(0xFF2EE6C5), 
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFF54BBF5), 
    foregroundColor: Colors.white,
  ),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: Colors.black),
    bodyMedium: TextStyle(color: Colors.black),
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Color(0xFF2EE6C5),
  ),
);

final darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: Color(0xFF54BBF5), 
  scaffoldBackgroundColor: Color(0xFF121826), 
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFF2EE6C5), 
    foregroundColor: Colors.white,
  ),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: Colors.white),
    bodyMedium: TextStyle(color: Colors.white70), 
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Color(0xFF2EE6C5), 
  ),
);
