import 'package:common/src/theme/app_colors.dart';
import 'package:flutter/material.dart';

final inputDecorationTheme = InputDecorationTheme(
  floatingLabelBehavior: FloatingLabelBehavior.always,
  focusColor: AppColors.orange,
  enabledBorder: const OutlineInputBorder(
    borderSide: BorderSide(color: AppColors.purple),
  ),
  focusedBorder: const OutlineInputBorder(
    borderSide: BorderSide(color: AppColors.orange),
  ),
  border: OutlineInputBorder(
    borderSide: const BorderSide(color: AppColors.lightGray),
    borderRadius: BorderRadius.circular(6),
  ),
);
