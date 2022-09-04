import 'package:flutter/material.dart';

final switchTheme = ThemeData(
  overlayColor: MaterialStateProperty.resolveWith((states) {
    if (states.contains(MaterialState.selected)) {
      return AppColors.orangeHover;
    }
    return AppColors.blueHover;
  }),
  thumbColor: MaterialStateProperty.resolveWith((states) {
    if (states.contains(MaterialState.disabled)) {
      return AppColors.disabled;
    }
    if (states.contains(MaterialState.selected)) {
      if (states.contains(MaterialState.hovered)) {
        return AppColors.orangeAccent;
      }
      return AppColors.orange;
    }
    if (states.contains(MaterialState.hovered)) {
      return AppColors.lightBlue;
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
