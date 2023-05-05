import 'package:flutter/material.dart';

ThemeData theme = ThemeData(
  appBarTheme: const AppBarTheme(
    titleSpacing: 16.0,
  ),
  dividerTheme: const DividerThemeData(space: 18),
  textTheme: TextTheme(
    titleMedium: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    bodySmall: TextStyle(color: Colors.grey[800]),
  ),
    inputDecorationTheme: const InputDecorationTheme(
      labelStyle: TextStyle(fontWeight: FontWeight.w500),
      hintStyle: TextStyle(fontWeight: FontWeight.w500),
    ),

);
