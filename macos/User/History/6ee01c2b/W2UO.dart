import 'package:common/src/theme/_app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'theme_data/chip_theme.dart';
import 'theme_data/input_theme.dart';
import 'theme_data/bottom_navigation_bar_theme.dart';
import 'theme_data/tab_bar_theme.dart';
import 'theme_data/app_bar_theme.dart';
import 'theme_data/button_theme.dart';
import 'theme_data/color_scheme.dart';
import 'theme_data/text_theme.dart';

export 'dimensions.dart';
export 'feel.dart';

final zanalysTheme = ThemeData(
  useMaterial3: true,
  scaffoldBackgroundColor: AppColors.backgroundBlue,
  colorScheme: colorScheme,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  textTheme: textTheme(),
  appBarTheme: appBarTheme,
  elevatedButtonTheme: elevatedButtonTheme,
  outlinedButtonTheme: outlinedButtonTheme,
  bottomNavigationBarTheme: bottomNavigationBarTheme,
  tabBarTheme: underlineTabBarTheme,
  inputDecorationTheme: inputTheme,
  chipTheme: chipTheme,
  extensions: const [
    badgeColors,
  ],
);
