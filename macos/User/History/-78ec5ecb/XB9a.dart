import 'package:common/common.dart';
import 'package:common/src/theme/app_colors.dart';
import 'package:flutter/material.dart';

@immutable
class TbtColors extends ThemeExtension<TbtColors> {
  const TbtColors({
    required this.brandColor,
    required this.danger,
  });

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
  TbtColors copyWith({Color? brandColor, Color? danger}) {
    return TbtColors(
      brandColor: brandColor ?? this.brandColor,
      danger: danger ?? this.danger,
    );
  }

  @override
  TbtColors lerp(ThemeExtension<TbtColors>? other, double t) {
    if (other is! TbtColors) {
      return this;
    }
    return TbtColors(
      brandColor: Color.lerp(brandColor, other.brandColor, t),
      danger: Color.lerp(danger, other.danger, t),
    );
  }

  // Optional
  @override
  String toString() => 'MyColors(brandColor: $brandColor, danger: $danger)';
}
