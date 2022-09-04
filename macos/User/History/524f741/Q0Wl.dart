import 'package:common/src/theme/app_colors.dart';
import 'package:flutter/material.dart';

const colorScheme = ColorScheme.light(
  primary: TbtAppColors.blue,
  primaryContainer: TbtAppColors.blueContainer,
  onPrimary: TbtAppColors.white,

  secondary: TbtAppColors.orange,
  secondaryContainer: TbtAppColors.orangeContainer,
  onSecondary: TbtAppColors.white,

  // NEUTRALS
  surface: TbtAppColors.white,
  onSurface: TbtAppColors.text,

  surfaceVariant: TbtAppColors.backgroundBlue,
  onSurfaceVariant: TbtAppColors.text,

  background: TbtAppColors.white,
  outline: TbtAppColors.outline,
  shadow: TbtAppColors.shadow,

  error: TbtAppColors.error,
  onError: TbtAppColors.white,
  errorContainer: TbtAppColors.errorContainer,
  onErrorContainer: TbtAppColors.error,

  surfaceTint: TbtAppColors.white,
);
