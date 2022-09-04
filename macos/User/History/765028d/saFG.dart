import 'package:common/src/theme/app_colors.dart';
import 'package:flutter/material.dart';

const colorScheme = ColorScheme.light(
  primary: AppColors.blue,
  primaryContainer: AppColors.lightBlue,
  secondary: AppColors.orange,
  secondaryContainer: AppColors.lightOrange,

  // NEUTRALS
  surface: Colors.white,
  onSurface: Colors.black,
  onSurfaceVariant: AppColors.darkGray,
  background: AppColors.background,
  surfaceVariant: AppColors.lightGray,

  outline: AppColors.gray,
  shadow: AppColors.shadow,
);
