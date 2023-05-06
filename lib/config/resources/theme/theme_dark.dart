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
  textTheme: theme.textTheme.copyWith(
    titleMedium: theme.textTheme.titleMedium?.copyWith(color: Colors.white),
    bodySmall: TextStyle(color: Colors.grey[600]),
  ),
  iconTheme: theme.iconTheme.copyWith(color: darkIconColor),
  inputDecorationTheme: theme.inputDecorationTheme.copyWith(
    labelStyle: theme.inputDecorationTheme.labelStyle?.copyWith(color: darkInputColor),
    hintStyle: theme.inputDecorationTheme.hintStyle?.copyWith(color: darkInputColor),
    border: darkOutlineInputBorder,
    enabledBorder: darkOutlineInputBorder,
    focusedBorder: darkOutlineInputBorder,
    disabledBorder: darkOutlineInputBorder,
    iconColor: Colors.white,
    prefixIconColor: Colors.white,
    suffixIconColor: Colors.white,
  ),
);

OutlineInputBorder darkOutlineInputBorder = OutlineInputBorder(
  borderSide: BorderSide(
    width: 2,
    color: darkInputBorderColor,
  ),
);
