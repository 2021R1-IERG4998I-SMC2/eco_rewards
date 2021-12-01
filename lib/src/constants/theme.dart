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
);
