import 'package:flutter/material.dart';

import '_app_colors.dart';

const textTheme = TextTheme(
  // DISPLAYS
  displayMedium: TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600, //semi bold
    color: AppColors.black,
  ),
  displaySmall: TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600, //semi bold
    color: AppColors.black,
  ),
  // HEADLINES
  headlineLarge: TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w500, //medium
    letterSpacing: .3,
    color: AppColors.black,
  ),
  headlineMedium: TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppColors.black,
  ),
  bodyMedium: TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: AppColors.darkGray,
  ),
  // Buttons
  labelLarge: TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    color: AppColors.black,
  ),
);
