import 'package:common/src/theme/app_colors.dart';
import 'package:flutter/material.dart';

import 'theme_data/color_scheme.dart';
import 'theme_data/text_theme.dart';

final lightTheme = ThemeData(
  useMaterial3: true,
  colorScheme: colorScheme,
  textTheme: textTheme,
  scaffoldBackgroundColor: AppColors.white,
);
