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
  TbtColors();

  final brandBlue = TbtAppColors.brandBlue;

  static const blue = Color(0xff1A70F0);
  static const blueHover = Color(0xff0C54C0);
  static const blueContainer = Color(0xffEBF3FE);

  static const secondary = Color(0xffFD8D35);
  static const orangeHover = Color(0xffED6A03);
  static const secondaryContainer = Color(0xffFFF1E7);

  final iconDarkBlue = TbtAppColors.iconDarkBlue;
  final iconMediumBlue = TbtAppColors.iconMediumBlue;
  final iconLightBlue = TbtAppColors.iconLightBlue;
  final iconDarkPurple = TbtAppColors.iconDarkPurple;
  final iconMediumPurple = TbtAppColors.iconMediumPurple;

  final warning = TbtAppColors.warning;
  final warningContainer = TbtAppColors.warningContainer;

  final success = TbtAppColors.success;
  final successContainer = TbtAppColors.successContainer;

  final error = TbtAppColors.error;
  final errorContainer = TbtAppColors.errorContainer;

  final disabled = TbtAppColors.disabled;
  final onDisabled = TbtAppColors.label;
  final splash = TbtAppColors.splash;

  @override
  TbtColors copyWith() {
    return TbtColors();
  }

  @override
  TbtColors lerp(ThemeExtension<TbtColors>? other, double t) {
    if (other is! TbtColors) {
      return this;
    }
    return TbtColors();
  }
}
