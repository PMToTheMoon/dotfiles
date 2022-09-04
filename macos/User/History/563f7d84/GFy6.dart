import 'package:common/src/theme/app_colors.dart';
import 'package:common/src/theme/theme_data/text_theme.dart';
import 'package:flutter/material.dart';

final inputDecorationTheme = InputDecorationTheme(
  floatingLabelBehavior: FloatingLabelBehavior.always,
  disabledBorder: const OutlineInputBorder(
    borderSide: BorderSide(color: AppColors.gray),
  ),
  enabledBorder: const OutlineInputBorder(
    borderSide: BorderSide(color: AppColors.darkGray),
  ),
  focusedBorder: const OutlineInputBorder(
    borderSide: BorderSide(color: AppColors.orange),
  ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(6),
  ),
  hintStyle: textTheme.titleMedium?.copyWith(color: AppColors.darkGray),
  focusColor: TbtAppColors.text,
  hoverColor: TbtAppColors.text,
  isDense: true,
  labelStyle: TextStyle(color: TbtAppColors.orange),
);
