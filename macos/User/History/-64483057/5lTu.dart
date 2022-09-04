import 'package:common/src/theme/_app_colors.dart';

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
    style: OutlinedButton.styleFrom(
  primary: AppColors.blue,
  // onPrimary: AppColors.white,
  surfaceTintColor: AppColors.lightBlue,

  elevation: 0,
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(8),
    ),
  ),
));
