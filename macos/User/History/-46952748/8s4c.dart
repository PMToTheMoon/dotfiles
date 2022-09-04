import 'package:common/src/theme/app_colors.dart';
import 'package:flutter/material.dart';

final inputDecorationTheme = InputDecorationTheme(
  floatingLabelBehavior: FloatingLabelBehavior.always,
  hoverColor: AppColors.darkestGray,
  focusColor: AppColors.orange,
  focusedBorder: OutlineInputBorder(
      // borderRadius: BorderRadius.circular(6),
      borderSide: BorderSide(color: AppColors.orange)),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(6),
  ),
);
