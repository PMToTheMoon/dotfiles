import 'package:common/common.dart';
import 'package:common/src/theme/app_colors.dart';
import 'package:common/src/theme/theme_data/text_theme.dart';
import 'package:flutter/material.dart';

const underlineTabBarTheme = TabBarTheme(
  // labelStyle: textTheme.titleSmall,
  // unselectedLabelStyle: textTheme.titleSmall,
  // labelColor: TbtAppColors.label,
  indicatorSize: TabBarIndicatorSize.label,
  indicator: BoxDecoration(
    color: TbtAppColors.label,
    border: Border(
      bottom: BorderSide(),
    ),
    // splashFactory: InkRipple.splashFactory,
    // overlayColor: TbtAppColors.blueContainer.msp,
  ),
);
