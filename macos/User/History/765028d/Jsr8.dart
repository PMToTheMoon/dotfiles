import 'package:common/src/theme/app_colors.dart';
import 'package:flutter/material.dart';

const colorScheme = ColorScheme.light(
  primary: AppColors.orange,
  primaryContainer: AppColors.lightOrange,
  onPrimary: AppColors.white,

  secondary: AppColors.blue,
  secondaryContainer: AppColors.lightBlue,
  onSecondary: AppColors.white,

  // NEUTRALS
  surface: Colors.white,
  onSurface: Colors.black,
  surfaceVariant: AppColors.lightGray,
  onSurfaceVariant: AppColors.darkerGray,
  background: AppColors.background,

  outline: AppColors.gray,
  shadow: AppColors.shadow,

  error: AppColors.red,
  onError: AppColors.white,
);
