import 'package:common/src/theme/app_colors.dart';
import 'package:flutter/material.dart';

const colorScheme = ColorScheme.light(
  primary: TbtColors.orange,
  primaryContainer: TbtColors.orangeContainer,
  onPrimary: TbtColors.white,
  secondary: TbtColors.blue,
  secondaryContainer: TbtColors.blueContainer,
  onSecondary: TbtColors.white,

  // NEUTRALS
  surface: Colors.white,
  onSurface: Colors.black,
  surfaceVariant: AppColors.lighterGray,
  onSurfaceVariant: AppColors.darkerGray,
  background: AppColors.background,
  outline: AppColors.outline,
  shadow: AppColors.shadow,
  error: AppColors.red,
  onError: AppColors.white,
  surfaceTint: AppColors.white,
);
