import 'package:common/src/theme/_app_colors.dart';
import 'package:common/src/theme/dimensions.dart';
import 'package:flutter/material.dart';

final inputTheme = InputDecorationTheme(
  border: OutlineInputBorder(
    borderSide: const BorderSide(color: AppColors.lightGray, width: 1),
    borderRadius: BorderRadius.circular(Dimensions.borderRadiusSmall),
  ),
);
