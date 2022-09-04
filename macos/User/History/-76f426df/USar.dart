import 'package:common/src/theme/_app_colors.dart';
import 'package:common/src/theme/dimensions.dart';
import 'package:flutter/material.dart';

final inputTheme = InputDecorationTheme(
  filled: true,
  fillColor: AppColors.white,
  enabledBorder: OutlineInputBorder(
    borderSide: const BorderSide(color: AppColors.lightGray, width: 1),
    borderRadius: BorderRadius.circular(Dimensions.borderRadiusSmaller),
  ),
  border: OutlineInputBorder(
    borderSide: const BorderSide(color: AppColors.lightGray, width: 1),
    borderRadius: BorderRadius.circular(Dimensions.borderRadiusSmaller),
  ),
  hintStyle: const TextStyle(color: AppColors.darkGray),
  isDense: true,
);
