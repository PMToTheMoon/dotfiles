import 'package:flutter/material.dart';

import '_app_colors.dart';

final colorScheme = ColorScheme.fromSeed(
  seedColor: AppColors.blue,
  brightness: Brightness.light,

  primary: AppColors.blue,
  onPrimary: AppColors.white,
  primaryContainer: AppColors.lightBlue,

  secondary: AppColors.salmon,
  onSecondary: AppColors.white,
  secondaryContainer: AppColors.lightSalmon,

  tertiary: AppColors.yellow,
  onTertiary: AppColors.white,
  tertiaryContainer: AppColors.lightYellow,

  // Naturals
  background: AppColors.lightBlue,
  onBackground: AppColors.black,

  surface: AppColors.white,
  onSurface: AppColors.black,
);
