import 'package:common/src/theme/app_colors.dart';
import 'package:common/src/theme/theme_data/text_theme.dart';
import 'package:flutter/material.dart';

final inputDecorationTheme = InputDecorationTheme(
  floatingLabelBehavior: FloatingLabelBehavior.always,
  focusColor: AppColors.orange,
  disabledBorder: const OutlineInputBorder(
    borderSide: BorderSide(color: AppColors.gray),
  ),
  enabledBorder: const OutlineInputBorder(
    borderSide: BorderSide(color: AppColors.darkestGray),
  ),
  focusedBorder: const OutlineInputBorder(
    borderSide: BorderSide(color: AppColors.orange),
  ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(6),
  ),
  helperStyle: textTheme.labelLarge,
);
