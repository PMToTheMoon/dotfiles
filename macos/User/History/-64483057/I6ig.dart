import 'package:common/src/theme/_app_colors.dart';
import 'package:common/src/theme/theme_data/color_scheme.dart';
import 'package:common/src/utils/msp.dart';

import 'package:flutter/material.dart';

final elevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
  primary: AppColors.blue,
  onPrimary: AppColors.white,
  elevation: 0,
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(8),
    ),
  ),
));

final outlinedButtonTheme = OutlinedButtonThemeData(
  style: ButtonStyle(
    foregroundColor: colorScheme.onSurface.msp,
    backgroundColor: Colors.transparent.msp,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ).msp,
    overlayColor: AppColors.lightBlue.msp,
    splashFactory: InkRipple.splashFactory,
  ),
);
