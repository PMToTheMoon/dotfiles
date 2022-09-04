import 'package:common/src/theme/_app_colors.dart';
import 'package:flutter/material.dart';

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
  surfaceVariant: AppColors.lighterGray,

  // Others
  outline: AppColors.lightGray,
);

const badgeColors = BadgeColors();

class BadgeColors extends ThemeExtension<BadgeColors> {
  final Color alert;

  final Color red;
  final Color redContainer;

  final Color green;
  final Color greenContainer;

  final Color orange;
  final Color orangeContainer;

  final Color blue;
  final Color blueContainer;

  const BadgeColors({
    Color? alert,
    Color? red,
    Color? redContainer,
    Color? green,
    Color? greenContainer,
    Color? orange,
    Color? orangeContainer,
    Color? blue,
    Color? blueContainer,
  })  : alert = alert ?? AppColors.brightSalmon,
        red = red ?? AppColors.red,
        redContainer = redContainer ?? AppColors.lightRed,
        green = green ?? AppColors.green,
        greenContainer = greenContainer ?? AppColors.lightGreen,
        orange = orange ?? AppColors.orange,
        orangeContainer = orangeContainer ?? AppColors.lightOrange,
        blue = blue ?? AppColors.blue,
        blueContainer = blueContainer ?? AppColors.blueContainer;

  @override
  BadgeColors copyWith({
    Color? alert,
    Color? red,
    Color? redContainer,
    Color? green,
    Color? greenContainer,
    Color? orange,
    Color? orangeContainer,
  }) =>
      BadgeColors(
        alert: alert ?? this.alert,
        red: red ?? this.red,
        redContainer: redContainer ?? this.redContainer,
        green: green ?? this.green,
        greenContainer: greenContainer ?? this.greenContainer,
        orange: orange ?? this.orange,
        orangeContainer: orangeContainer ?? this.orangeContainer,
      );

  @override
  ThemeExtension<BadgeColors> lerp(
      ThemeExtension<BadgeColors>? other, double t) {
    if (other is! BadgeColors) return this;

    return BadgeColors(
      alert: Color.lerp(alert, other.alert, t),
      red: Color.lerp(red, other.red, t),
      redContainer: Color.lerp(redContainer, other.redContainer, t),
      green: Color.lerp(green, other.green, t),
      greenContainer: Color.lerp(greenContainer, other.greenContainer, t),
      orange: Color.lerp(orange, other.orange, t),
      orangeContainer: Color.lerp(orangeContainer, other.orangeContainer, t),
    );
  }
}
