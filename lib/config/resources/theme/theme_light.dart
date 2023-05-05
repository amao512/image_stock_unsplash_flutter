import 'package:flutter/material.dart';
import 'package:image_stock_unsplash_flutter/config/resources/theme/theme.dart';
import '../colors.dart';

ThemeData lightTheme = theme.copyWith(
  primaryColor: primaryColor,
  brightness: Brightness.light,
  dividerColor: scaffoldBackgroundColor,
  accentColor: primaryColor,
  indicatorColor: indicatorColor,
  colorScheme: ColorScheme.fromSwatch(
    accentColor: primaryColor,
  ),
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
    labelStyle: TextStyle(color: inputColor),
    hintStyle: TextStyle(color: inputColor),
    focusColor: inputColor,
    border: outlineInputBorder,
    enabledBorder: outlineInputBorder,
    disabledBorder: outlineInputBorder,
  ),
);

OutlineInputBorder outlineInputBorder = OutlineInputBorder(
  borderSide: BorderSide(
    width: 2,
    color: inputBorderColor,
  ),
);