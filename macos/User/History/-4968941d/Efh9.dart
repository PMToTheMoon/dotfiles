import 'package:common/common.dart';
import 'package:common/src/theme/app_colors.dart';
import 'package:common/src/theme/theme_data/text_theme.dart';
import 'package:flutter/material.dart';

final elevatedButtonTheme = ElevatedButtonThemeData(
  style: ButtonStyle(
    backgroundColor: MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.disabled)) {
        return AppColors.lightGray;
      }
      return AppColors.orange;
    }),
    overlayColor: MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.pressed)) {
        return AppColors.white.withAlpha(90);
      }
      if (states.contains(MaterialState.hovered)) {
        return AppColors.orangeAccent;
      }
      return null;
    }),
    foregroundColor: MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.disabled)) {
        return AppColors.darkGray;
      }
      return AppColors.white;
    }),
    textStyle: textTheme.labelLarge.msp,
    elevation: 0.0.msp,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(4),
      ),
    ).msp,
  ),
);

final outlinedButtonTheme = OutlinedButtonThemeData(
  style: ButtonStyle(
    backgroundColor: MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.disabled)) {
        return AppColors.lightGray;
      }
      return null;
    }),
    overlayColor: MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.pressed)) {
        return AppColors.orange;
      }
      if (states.contains(MaterialState.hovered)) {
        return AppColors.lightOrange;
      }
      return null;
    }),
    foregroundColor: MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.disabled)) {
        return AppColors.darkestGray;
      }
      if (states.contains(MaterialState.pressed)) {
        return AppColors.white;
      }
      if (states.contains(MaterialState.hovered)) {
        return AppColors.orangeAccent;
      }
      return AppColors.darkestGray;
    }),
    textStyle: textTheme.labelLarge.msp,
    elevation: 0.0.msp,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(4),
      ),
    ).msp,
  ),
);
