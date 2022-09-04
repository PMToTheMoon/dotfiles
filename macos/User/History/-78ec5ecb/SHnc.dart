import 'package:flutter/material.dart';

@immutable
class TbtColors extends ThemeExtension<TbtColors> {
  const TbtColors({
    required this.brandColor,
    required this.danger,
  });

  static const iconDarkBlue = Color(0xff2F80ED);
  static const iconMediumBlue = Color(0xff2D9CDB);
  static const iconLightBlue = Color(0xff56CCF2);
  static const iconDarkPurple = Color(0xff9B51E0);
  static const iconMediumPurple = Color(0xffBB6BD9);

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
