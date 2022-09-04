import 'package:flutter/material.dart';

import 'color_scheme.dart';
import 'text_theme.dart';

final chipTheme = ChipThemeData(
  backgroundColor: colorScheme.secondaryContainer,
  labelStyle: textTheme.labelLarge,
  labelPadding: const EdgeInsets.symmetric(
    horizontal: 8,
    vertical: 6,
  ),
);
