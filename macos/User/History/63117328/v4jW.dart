import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'theme_data/bottom_navigation_bar_theme.dart';
import 'theme_data/tab_bar_theme.dart';
import 'theme_data/app_bar_theme.dart';
import 'theme_data/button_theme.dart';
import 'theme_data/color_scheme.dart';
import 'theme_data/text_theme.dart';

export 'dimensions.dart';

final zanalysTheme = ThemeData(
  useMaterial3: true,
  scaffoldBackgroundColor: Colors.white,
  colorScheme: colorScheme,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  textTheme: GoogleFonts.poppinsTextTheme(textTheme),
  appBarTheme: appBarTheme,
  elevatedButtonTheme: elevatedButtonTheme,
  bottomNavigationBarTheme: bottomNavigationBarTheme,
  tabBarTheme: underlineTabBarTheme,
  extensions: const [
    badgeColors,
  ],
);
