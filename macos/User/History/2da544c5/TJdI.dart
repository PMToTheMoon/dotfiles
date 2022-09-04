import 'package:common/common.dart';
import 'package:common/src/theme/app_colors.dart';
import 'package:common/src/theme/theme_data/text_theme.dart';
import 'package:flutter/material.dart';

final underlineTabBarTheme = TabBarTheme(
  labelStyle: textTheme.headlineSmall,
  unselectedLabelStyle: textTheme.titleMedium,
  labelColor: TbtAppColors.subtitle,
  unselectedLabelColor: TbtAppColors.text,
  indicatorSize: TabBarIndicatorSize.label,
  overlayColor: TbtAppColors.blueContainer.withAlpha(50).msp,
  indicator: const BoxDecoration(
    border: Border(
      bottom: BorderSide(
        color: TbtAppColors.subtitle,
      ),
    ),
    // splashFactory: InkRipple.splashFactory,
    // overlayColor: TbtAppColors.blueContainer.msp,
  ),
);
