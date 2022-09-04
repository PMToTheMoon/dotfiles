import 'package:common/common.dart';
import 'package:common/src/theme/app_colors.dart';
import 'package:flutter/material.dart';

extension TbtColorsExtension on BuildContext {
  TbtColors get tbtColors => Theme.of(this).extension<TbtColors>()!;
}

@immutable
class TbtColors extends ThemeExtension<TbtColors> {
  const TbtColors();

  final brandBlue = TbtAppColors.brandBlue;

  final iconDarkBlue = TbtAppColors.iconDarkBlue;
  final iconMediumBlue = TbtAppColors.iconMediumBlue;
  final iconLightBlue = TbtAppColors.iconLightBlue;
  final iconDarkPurple = TbtAppColors.iconDarkPurple;
  final iconMediumPurple = TbtAppColors.iconMediumPurple;

  final warning = TbtAppColors.warning;
  final warningContainer = TbtAppColors.warningContainer;
  final success = TbtAppColors.success;
  final successContainer = TbtAppColors.successContainer;

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
