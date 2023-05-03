import 'package:flutter/material.dart';
import 'colors.dart';

ThemeData theme = ThemeData(
  primaryColor: primaryColor,
  brightness: Brightness.light,
  dividerColor: scaffoldBackgroundColor,
  accentColor: primaryColor,
  indicatorColor: indicatorColor,
  progressIndicatorTheme: ProgressIndicatorThemeData(color: indicatorColor),
  scaffoldBackgroundColor: scaffoldBackgroundColor,
  iconTheme: IconThemeData(color: iconColor),
  appBarTheme: AppBarTheme(
    color: appBarColor,
    iconTheme: IconThemeData(color: appBarIconColor),
  ),
  pageTransitionsTheme: const PageTransitionsTheme(builders: {
    TargetPlatform.android: CupertinoPageTransitionsBuilder(),
    TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
    TargetPlatform.fuchsia: CupertinoPageTransitionsBuilder(),
  }),
  inputDecorationTheme: InputDecorationTheme(
    labelStyle: textStyle,
    focusColor: inputColor,
    hintStyle: textStyle,
    border: outlineInputBorder,
    enabledBorder: outlineInputBorder,
    disabledBorder: outlineInputBorder,
  ),
);

TextStyle textStyle = TextStyle(
  color: inputColor,
  fontWeight: FontWeight.w500,
);

OutlineInputBorder outlineInputBorder = OutlineInputBorder(
  borderSide: BorderSide(
    width: 2,
    color: inputBorderColor,
  ),
);
