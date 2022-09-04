import 'package:common/src/theme/app_colors.dart';
import 'package:flutter/material.dart';

final checkboxTheme =
    CheckboxThemeData(fillColor: MaterialStateProperty.resolveWith((states) {
  if (states.contains(MaterialState.disabled)) return AppColors.disabled;
  return null;
}));
