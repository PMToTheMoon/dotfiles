import 'package:common/src/theme/app_colors.dart';
import 'package:flutter/material.dart';

const colorScheme = ColorScheme.light(
  primary: AppColors.blue,
  primaryContainer: AppColors.lightBlue,
  onPrimary: AppColors.white,

  secondary: AppColors.orange,
  secondaryContainer: AppColors.lightOrange,

  // NEUTRALS
  surface: Colors.white,
  onSurface: Colors.black,
  surfaceVariant: AppColors.lightGray,
  onSurfaceVariant: AppColors.darkGray,
  background: AppColors.background,

  outline: AppColors.gray,
  shadow: AppColors.shadow,
);
