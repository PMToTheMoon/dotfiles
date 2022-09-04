import 'package:common/src/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final textTheme = TextTheme(
  displayLarge: TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 45,
    color: TbtAppColors.text,
  ),
  displayMedium: TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 26,
    color: TbtAppColors.text,
  ),
  displaySmall: GoogleFonts.crimsonPro(
    fontWeight: FontWeight.w600,
    fontSize: 24,
    color: TbtAppColors.text,
  ),

  // Headlines
  headlineLarge: TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 18,
    color: TbtAppColors.text,
  ),
  headlineMedium: TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 16,
    color: TbtAppColors.text,
  ),
  headlineSmall: TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 14,
    color: TbtAppColors.text,
  ),

  // Title
  titleLarge: TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 16,
    color: TbtAppColors.text,
  ),
  titleMedium: TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 14,
    color: TbtAppColors.text,
  ),
  titleSmall: TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 12,
    color: TbtAppColors.text,
  ),

  // BODY
  bodyLarge: TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 14,
    color: TbtAppColors.text,
  ),
  bodyMedium: TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 12,
    color: TbtAppColors.subtitle,
  ),
  bodySmall: TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 10,
    color: TbtAppColors.label,
  ),

  // labels
  labelLarge: TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 14,
    color: TbtAppColors.text,
  ),
  labelMedium: TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 12,
    color: TbtAppColors.text,
  ),
  labelSmall: TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 10,
    color: TbtAppColors.text,
  ),
);
