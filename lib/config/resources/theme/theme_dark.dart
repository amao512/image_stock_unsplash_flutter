import 'package:flutter/material.dart';
import 'package:image_stock_unsplash_flutter/config/resources/theme/theme.dart';

import '../colors.dart';

ThemeData darkTheme = theme.copyWith(
  primaryColor: darkPrimaryColor,
  brightness: Brightness.dark,
  dividerColor: darkScaffoldBackgroundColor,
  accentColor: darkPrimaryColor,
  indicatorColor: darkIndicatorColor,
  progressIndicatorTheme: ProgressIndicatorThemeData(color: darkIconColor),
  scaffoldBackgroundColor: darkScaffoldBackgroundColor,
  colorScheme: ColorScheme.fromSwatch(
    accentColor: darkPrimaryColor,
  ),
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
    labelStyle: TextStyle(color: darkInputColor),
    hintStyle: TextStyle(color: darkInputColor),
    border: darkOutlineInputBorder,
    enabledBorder: darkOutlineInputBorder,
    focusedBorder: darkOutlineInputBorder,
    disabledBorder: darkOutlineInputBorder,
  ),
);

OutlineInputBorder darkOutlineInputBorder = OutlineInputBorder(
  borderSide: BorderSide(
    width: 2,
    color: darkInputBorderColor,
  ),
);
