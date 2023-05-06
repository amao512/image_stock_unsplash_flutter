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
  iconTheme: theme.iconTheme.copyWith(color: iconColor),
  textTheme: theme.textTheme.copyWith(
    titleMedium: theme.textTheme.titleMedium?.copyWith(color: Colors.black),
    bodySmall: TextStyle(color: Colors.grey[800]),
  ),
  inputDecorationTheme: theme.inputDecorationTheme.copyWith(
    labelStyle: theme.inputDecorationTheme.labelStyle?.copyWith(color: inputColor),
    hintStyle: theme.inputDecorationTheme.hintStyle?.copyWith(color: inputColor),
    focusColor: inputColor,
    border: outlineInputBorder,
    enabledBorder: outlineInputBorder,
    disabledBorder: outlineInputBorder,
    iconColor: Colors.black,
    prefixIconColor: Colors.black,
    suffixIconColor: Colors.black,
    focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.black)
    ),
  ),
);

OutlineInputBorder outlineInputBorder = OutlineInputBorder(
  borderSide: BorderSide(
    width: 2,
    color: inputBorderColor,
  ),
);
