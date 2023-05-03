import 'package:flutter/material.dart';

import 'colors.dart';

ThemeData darkTheme = ThemeData(
  primaryColor: darkPrimaryColor,
  brightness: Brightness.dark,
  dividerColor: darkScaffoldBackgroundColor,
  accentColor: darkPrimaryColor,
  indicatorColor: darkIndicatorColor,
  progressIndicatorTheme: ProgressIndicatorThemeData(color: darkIconColor),
  scaffoldBackgroundColor: darkScaffoldBackgroundColor,
  iconTheme: IconThemeData(color: darkIconColor),
  appBarTheme: AppBarTheme(
    color: darkAppBarColor,
    iconTheme: IconThemeData(color: darkAppBarIconColor),
  ),
  pageTransitionsTheme: const PageTransitionsTheme(
    builders: {
      TargetPlatform.android: CupertinoPageTransitionsBuilder(),
      TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      TargetPlatform.fuchsia: CupertinoPageTransitionsBuilder(),
    },
  ),
  inputDecorationTheme: InputDecorationTheme(
    labelStyle: textStyle,
    hintStyle: textStyle,
    border: darkOutlineInputBorder,
    enabledBorder: darkOutlineInputBorder,
    focusedBorder: darkOutlineInputBorder,
    disabledBorder: darkOutlineInputBorder,
  ),
);

TextStyle textStyle = TextStyle(
  color: darkInputColor,
  fontWeight: FontWeight.w500,
);

OutlineInputBorder darkOutlineInputBorder = OutlineInputBorder(
  borderSide: BorderSide(
    width: 2,
    color: darkInputBorderColor,
  ),
);
