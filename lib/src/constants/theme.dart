import 'package:flutter/material.dart';

import './colors.dart';

final appTheme = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.fromSwatch(
    primarySwatch: AppColors.primarySwatch,
    accentColor: AppColors.accentColor,
    backgroundColor: AppColors.backgroundColor,
    errorColor: AppColors.errorColor,
  ),
  appBarTheme: const AppBarTheme(
    centerTitle: true,
    titleTextStyle: TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.normal,
    ),
    iconTheme: IconThemeData(size: 20.0),
  ),
);
