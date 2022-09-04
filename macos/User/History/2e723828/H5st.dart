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

class BadgeColors extends ThemeExtension<BadgeColors> {
  final Color red;
  final Color redContainer;

  final Color green;
  final Color greenContainer;

  final Color orange;
  final Color orangeContainer;

  @override
  ThemeExtension<BadgeColors> copyWith() {
    // TODO: implement copyWith
    throw UnimplementedError();
  }

  @override
  ThemeExtension<BadgeColors> lerp(
      ThemeExtension<BadgeColors>? other, double t) {
    // TODO: implement lerp
    throw UnimplementedError();
  }
}
