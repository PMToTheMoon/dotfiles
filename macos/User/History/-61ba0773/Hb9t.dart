import 'package:common/src/theme/_app_colors.dart';
import 'package:flutter/material.dart';

final buttonTheme = ButtonThemeData(
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
