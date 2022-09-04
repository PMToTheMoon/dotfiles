import 'package:common/src/theme/_app_colors.dart';
import 'package:flutter/material.dart';

const textTheme = () {
return TextTheme(
  // DISPLAYS
  displayLarge: TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600, //semi bold
    color: AppColors.black,
  ),
  displayMedium: TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600, //semi bold
    color: AppColors.black,
  ),
  displaySmall: TextStyle(
    fontSize: 14,
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
    fontSize: 16,
    fontWeight: FontWeight.w500, //medium
    letterSpacing: .3,
    color: AppColors.black,
  ),
  headlineSmall: TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500, //medium
    letterSpacing: .3,
    color: AppColors.black,
  ),
  // TITLES
  titleLarge: TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500, //medium
    color: AppColors.black,
  ),
  titleMedium: TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500, //medium
    color: AppColors.black,
  ),
  titleSmall: TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500, //medium
    color: AppColors.black,
  ),
  // BODIES
  bodyLarge: TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500, //medium
    color: AppColors.darkGray,
  ),
  bodyMedium: TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500, //medium
    color: AppColors.darkGray,
  ),
  bodySmall: TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w500, //medium
    color: AppColors.darkGray,
  ),
  // Labels
  labelLarge: TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    color: AppColors.black,
  ),
  labelMedium: TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: AppColors.black,
  ),
  labelSmall: TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w400,
    color: AppColors.darkGray,
  ),
);
}