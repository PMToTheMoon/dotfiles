import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

final theme = ThemeData(
  scaffoldBackgroundColor: Colors.white,
  primarySwatch: AppColors.primary.toMaterialColor(),
  visualDensity: VisualDensity.adaptivePlatformDensity,
  textTheme: GoogleFonts.poppinsTextTheme(
    Theme.of(context).textTheme,
  ),
  appBarTheme: Theme.of(context)
      .appBarTheme
      .copyWith(systemOverlayStyle: SystemUiOverlayStyle.dark),
);
