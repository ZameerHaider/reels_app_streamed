import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  primaryColor: Colors.orange,
  secondaryHeaderColor: const Color(0xFF000743),
  disabledColor: Colors.grey[200],
  brightness: Brightness.light,
  hintColor: const Color(0xFF9F9F9F),
  cardColor: Colors.white,
  textButtonTheme: TextButtonThemeData(style: TextButton.styleFrom(foregroundColor: const Color(0xFFFF5400))),
  colorScheme: const ColorScheme.light(primary: Color(0xFFFF5400), secondary: Color.fromARGB(255, 255, 167, 123)).copyWith(error: Colors.red),
);
