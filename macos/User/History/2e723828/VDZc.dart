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
    Color? red,
    Color? redContainer,
    Color? green,
    Color? greenContainer,
    Color? orange,
    Color? orangeContainer,
  })  : red = red ?? AppColors.red,
        redContainer = redContainer ?? AppColors.lightRed,
        green = green ?? AppColors.green,
        greenContainer = greenContainer ?? AppColors.lightGreen,
        orange = orange ?? AppColors.orange,
        orangeContainer = orangeContainer ?? AppColors.lightOrange;

  @override
  BadgeColors copyWith({
    Color? red,
    Color? redContainer,
    Color? green,
    Color? greenContainer,
    Color? orange,
    Color? orangeContainer,
  }) =>
      BadgeColors(
        red: red ?? AppColors.red,
        redContainer: redContainer ?? AppColors.lightRed,
        green: green ?? AppColors.green,
        greenContainer: greenContainer ?? AppColors.lightGreen,
        orange: orange ?? AppColors.orange,
        orangeContainer: orangeContainer ?? AppColors.lightOrange,
      );

  @override
  ThemeExtension<BadgeColors> lerp(
      ThemeExtension<BadgeColors>? other, double t) {
    if (other is! BadgeColors) return this;

    return BadgeColors(
      red: Color.lerp(red, other.red, t),
      redContainer: Color.lerp(redContainer, other.redContainer, t),
      green: Color.lerp(green, other.green, t),
      greenContainer: Color.lerp(greenContainer, other.greenContainer, t),
      orange: Color.lerp(orange, other.orange, t),
      orangeContainer: Color.lerp(orangeContainer, other.orangeContainer, t),
    );
  }
}
