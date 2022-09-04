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
  surface: TbtColors.white,
  onSurface: TbtColors.text,

  surfaceVariant: TbtColors.backgroundGray,
  onSurfaceVariant: TbtColors.text,

  background: TbtColors.white,
  outline: TbtColors.outline,
  shadow: TbtColors.shadow,

  error: TbtColors.error,
  onError: TbtColors.white,
  errorContainer: TbtColors.errorContainer,
  onErrorContainer: TbtColors.error,

  surfaceTint: TbtColors.white,
);
