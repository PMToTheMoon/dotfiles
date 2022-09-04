import 'package:common/common.dart';
import 'package:common/src/theme/app_colors.dart';
import 'package:common/src/theme/theme_data/app_bar_theme.dart';
import 'package:common/src/theme/theme_data/button_them.dart';
import 'package:common/src/theme/theme_data/card_theme.dart';
import 'package:common/src/theme/theme_data/chip_theme.dart';
import 'package:common/src/theme/theme_data/input_theme.dart';
import 'package:common/src/theme/theme_data/switch_theme.dart';
import 'package:common/src/theme/theme_data/tab_bar_theme.dart';
import 'package:flutter/material.dart';

import 'theme_data/checkbox_theme.dart';
import 'theme_data/color_scheme.dart';
import 'theme_data/selection_theme.dart';
import 'theme_data/text_theme.dart';

export 'extensions/extensions.dart';
export 'dimensions.dart';
export 'feel.dart';

final lightTheme = ThemeData(
  fontFamily: 'Poppins',
  useMaterial3: true,
  colorScheme: colorScheme,
  textTheme: textTheme,
  inputDecorationTheme: inputDecorationTheme,
  textSelectionTheme: textSelectionTheme,
  scaffoldBackgroundColor: TbtAppColors.white,
  elevatedButtonTheme: elevatedButtonTheme,
  outlinedButtonTheme: outlinedButtonTheme,
  textButtonTheme: textButtonTheme,
  checkboxTheme: checkboxTheme,
  switchTheme: switchTheme,
  appBarTheme: appBarTheme,
  shadowColor: TbtAppColors.shadow,
  cardTheme: cardTheme,
  tabBarTheme: underlineTabBarTheme,
  chipTheme: chipTheme,
  extensions: const [
    TbtColors(),
  ],
);
