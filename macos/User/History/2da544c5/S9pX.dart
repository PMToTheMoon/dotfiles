import 'package:common/common.dart';
import 'package:common/src/theme/app_colors.dart';
import 'package:common/src/theme/theme_data/text_theme.dart';
import 'package:flutter/material.dart';

final underlineTabBarTheme = TabBarTheme(
  labelStyle: textTheme.titleSmall,
  unselectedLabelStyle: textTheme.titleSmall,
  labelColor: TbtAppColors.label,
  indicatorSize: TabBarIndicatorSize.label,
  labelPadding: EdgeInsets.zero,
  splashFactory: InkRipple.splashFactory,
  overlayColor: TbtAppColors.blueContainer.msp,
);

final highlightTabBarTheme = TabBarTheme(
  indicator: BoxDecoration(
    color: TbtAppColors.blueContainer,
    borderRadius: BorderRadius.circular(Dimensions.borderRadiusSmall),
  ),
  labelColor: TbtAppColors.blue,
  unselectedLabelColor: AppColors.darkGray,
  indicatorSize: TabBarIndicatorSize.tab,
  labelPadding: EdgeInsets.zero,
  splashFactory: InkRipple.splashFactory,
  overlayColor: AppColors.white.msp,
);
