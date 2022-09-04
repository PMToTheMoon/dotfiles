import 'package:common/src/theme/app_bar.dart';
import 'package:common/src/theme/color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final zanalysTheme = ThemeData(
  useMaterial3: true,
  scaffoldBackgroundColor: Colors.white,
  colorScheme: colorScheme,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  textTheme: GoogleFonts.poppinsTextTheme(),
  appBarTheme: appBarTheme,
  extensions: const [
    badgeColors,
  ],
);
