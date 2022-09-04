import 'package:common/src/theme/app_colors.dart';
import 'package:flutter/material.dart';

final switchTheme = SwitchThemeData(
  overlayColor: MaterialStateProperty.resolveWith((states) {
    if (states.contains(MaterialState.selected)) {
      return AppColors.orangeHover;
    }
    return AppColors.blueHover;
  }),
  thumbColor: MaterialStateProperty.resolveWith((states) {
    if (states.contains(MaterialState.disabled)) {
      if (states.contains(MaterialState.selected)) {
        return AppColors.onDisabled;
      }
      return AppColors.disabled;
    }
    if (states.contains(MaterialState.selected)) {
      if (states.contains(MaterialState.hovered)) {
        return AppColors.orangeAccent;
      }
      return AppColors.orange;
    }
    if (states.contains(MaterialState.hovered)) {
      return AppColors.backgroundBlue;
    }
    return AppColors.white;
  }),
  trackColor: MaterialStateProperty.resolveWith((states) {
    if (states.contains(MaterialState.disabled)) {
      return AppColors.onDisabled;
    }
    if (states.contains(MaterialState.selected)) {
      return AppColors.white;
    }
    return AppColors.lightGray;
  }),
);
