import 'package:flutter/material.dart';
import 'dart:ui';
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

  const BadgeColors({
    required this.red,
    required this.redContainer,
    required this.green,
    required this.greenContainer,
    required this.orange,
    required this.orangeContainer,
  });

  @override
  ThemeExtension<BadgeColors> copyWith() {
    // TODO: implement copyWith
    throw UnimplementedError();
  }

  @override
  ThemeExtension<BadgeColors> lerp(
      ThemeExtension<BadgeColors>? other, double t) {
    if (other is! BadgeColors) return this;

    return BadgeColors(
      red: Color.lerp(red, other.red, t) ?? red,
      redContainer:
          Color.lerp(redContainer, other.redContainer, t) ?? redContainer,
      green: Color.lerp(green, other.green, t) ?? green,
      greenContainer:
          Color.lerp(greenContainer, other.greenContainer, t) ?? greenContainer,
      orange: Color.lerp(orange, other.orange, t) ?? orange,
      orangeContainer: Color.lerp(orangeContainer, other.orangeContainer, t) ??
          orangeContainer,
    );
    throw UnimplementedError();
  }
}
