import 'package:flutter/material.dart';

ThemeData theme = ThemeData(
  appBarTheme: const AppBarTheme(
    titleSpacing: 16.0,
    color: Colors.black,
    actionsIconTheme: IconThemeData(color: Colors.white),
    iconTheme: IconThemeData(color: Colors.white),
  ),
  dividerTheme: const DividerThemeData(space: 18),
  textTheme: const TextTheme(
    titleMedium: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)
  ),
  inputDecorationTheme: const InputDecorationTheme(
    labelStyle: TextStyle(fontWeight: FontWeight.w500),
    hintStyle: TextStyle(fontWeight: FontWeight.w500),
  ),
  pageTransitionsTheme: const PageTransitionsTheme(
    builders: {
      TargetPlatform.android: CupertinoPageTransitionsBuilder(),
      TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      TargetPlatform.fuchsia: CupertinoPageTransitionsBuilder(),
    },
  ),
);
