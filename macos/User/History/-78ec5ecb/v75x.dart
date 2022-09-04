import 'dart:math';

import 'package:common/src/theme/app_colors.dart';
import 'package:flutter/material.dart';

extension TbtColorsExtension on BuildContext {
  TbtColors get tbtColors {
    final ext = Theme.of(this).extension<TbtColors>();
    if (ext == null) {
      throw "You should register TbtColors class inside theme's extensions in order to access tbtColors extension";
    }
    return ext;
  }
}

enum TbtIconColor {
  darkBlue,
  mediumBlue,
  lightBlue,
  darkPurple,
  mediumPurple;

  Color color(BuildContext context) {
    final ext = context.tbtColors;
    switch (this) {
      case TbtIconColor.darkBlue:
        return ext.iconDarkBlue;
      case TbtIconColor.mediumBlue:
        return ext.iconMediumBlue;
      case TbtIconColor.lightBlue:
        return ext.iconLightBlue;
      case TbtIconColor.darkPurple:
        return ext.iconDarkPurple;
      case TbtIconColor.mediumPurple:
        return ext.iconMediumPurple;
    }
  }
}

@immutable
class TbtColors extends ThemeExtension<TbtColors> {
  const TbtColors();

  final brandBlue = TbtAppColors.brandBlue;

  final blueHover = TbtAppColors.blueHover;

  final orangeHover = TbtAppColors.orangeHover;

  final iconDarkBlue = TbtAppColors.iconDarkBlue;
  final iconMediumBlue = TbtAppColors.iconMediumBlue;
  final iconLightBlue = TbtAppColors.iconLightBlue;
  final iconDarkPurple = TbtAppColors.iconDarkPurple;
  final iconMediumPurple = TbtAppColors.iconMediumPurple;

  final warning = TbtAppColors.warning;
  final warningContainer = TbtAppColors.warningContainer;

  final success = TbtAppColors.success;
  final successContainer = TbtAppColors.successContainer;

  static const error = Color(0xffE00D33);
  static const errorContainer = Color(0xffFDEEEE);

  final disabled = TbtAppColors.disabled;
  final onDisabled = TbtAppColors.label;

  static const highlight = TbtAppColors.highlight;

  @override
  TbtColors copyWith() {
    return const TbtColors();
  }

  @override
  TbtColors lerp(ThemeExtension<TbtColors>? other, double t) {
    if (other is! TbtColors) {
      return this;
    }
    return const TbtColors();
  }
}
