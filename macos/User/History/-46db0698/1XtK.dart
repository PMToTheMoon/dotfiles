import 'package:common/src/theme/app_colors.dart';
import 'package:common/src/theme/theme_data/app_bar_theme.dart';
import 'package:common/src/theme/theme_data/button_them.dart';
import 'package:common/src/theme/theme_data/card_theme.dart';
import 'package:common/src/theme/theme_data/input_theme.dart';
import 'package:common/src/theme/theme_data/switch_theme.dart';
import 'package:flutter/material.dart';

import 'theme_data/checkbox_theme.dart';
import 'theme_data/color_scheme.dart';
import 'theme_data/selection_theme.dart';
import 'theme_data/text_theme.dart';

final lightTheme = ThemeData(
  useMaterial3: true,
  colorScheme: colorScheme,
  textTheme: textTheme,
  inputDecorationTheme: inputDecorationTheme,
  textSelectionTheme: textSelectionTheme,
  scaffoldBackgroundColor: AppColors.white,
  elevatedButtonTheme: elevatedButtonTheme,
  outlinedButtonTheme: outlinedButtonTheme,
  textButtonTheme: textButtonTheme,
  checkboxTheme: checkboxTheme,
  switchTheme: switchTheme,
  appBarTheme: appBarTheme,
  shadowColor: AppColors.shadow,
  cardTheme: cardTheme,
  // visualDensity: VisualDensity.compact,
);
