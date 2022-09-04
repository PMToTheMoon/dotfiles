import 'package:common/common.dart';
import 'package:common/src/theme/app_colors.dart';
import 'package:flutter/material.dart';

import 'text_theme.dart';

final chipTheme = ChipThemeData(
  backgroundColor: TbtAppColors.blueContainer,
  labelStyle: textTheme.labelMedium,
  padding: EdgeInsets.zero,
  labelPadding: const EdgeInsets.symmetric(
    horizontal: Dimensions.paddingSmaller,
  ),
);
