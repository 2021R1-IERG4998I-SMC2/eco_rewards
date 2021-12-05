import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

final appTheme = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.fromSwatch(
    primarySwatch: AppColors.primarySwatch,
    accentColor: AppColors.accentColor,
    backgroundColor: AppColors.backgroundColor,
    errorColor: AppColors.errorColor,
  ),
  appBarTheme: AppBarTheme(
    centerTitle: true,
    backgroundColor: AppColors.primarySwatch.shade700,
    titleTextStyle: const TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.normal,
    ),
    iconTheme: const IconThemeData(size: 20.0),
  ),
  textTheme: GoogleFonts.latoTextTheme(),
);
