import 'package:common/common.dart';
import 'package:common/theme/theme_data/tab_bar_theme.dart';
import 'package:flutter/material.dart';

import 'button_theme.dart';
import 'input_theme.dart';
import 'colors_scheme.dart';
import 'text_theme.dart';
import 'app_bar_theme.dart';
import 'package:common/theme/colors.dart' as ub;

final lightTheme = ThemeData(
  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
  colorScheme: colorScheme,
  outlinedButtonTheme: outlinedButtonTheme,
  elevatedButtonTheme: elevatedButtonTheme,
  inputDecorationTheme: inputDecorationTheme,
  dividerColor: ub.Colors.mediumGray,
  textTheme: textTheme,
  appBarTheme: appBarTheme,
  tabBarTheme: tabBarTheme,
  radioTheme: radioThemeData,
);
