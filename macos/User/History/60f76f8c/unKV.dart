import 'package:flutter/material.dart';

import 'color_scheme.dart';
import 'text_theme.dart';

final chipTheme = ChipThemeData(
  backgroundColor: colorScheme.secondaryContainer,
  labelStyle: textTheme.labelMedium,
  // padding: EdgeInsets.zero,
  padding: const EdgeInsets.symmetric(
    horizontal: 8,
    vertical: 6,
  ),
  labelPadding: EdgeInsets.zero,
  // labelPadding: const EdgeInsets.only(
  //   horizontal: 8,
  //   vertical: 6,
  // ),
);
