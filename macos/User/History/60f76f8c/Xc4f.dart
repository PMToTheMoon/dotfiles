import 'package:flutter/material.dart';

import 'color_scheme.dart';
import 'text_theme.dart';

final chipTheme = ChipThemeData(
  backgroundColor: colorScheme.secondaryContainer,
  labelStyle: textTheme.labelMedium,
  padding: EdgeInsets.zero,
  labelPadding: const EdgeInsets.symmetric(
    horizontal: 10,
    vertical: 5,
  ),
);
