import 'package:common/common.dart';
import 'package:common/src/theme/_app_colors.dart';
import 'package:common/src/theme/theme_data/text_theme.dart';
import 'package:flutter/material.dart';

final underlineTabBarTheme = TabBarTheme(
  indicator: const ShapeDecoration(
    shape: _UnderlineIndicatorShape(
      radius: Radius.circular(10),
      height: 3,
      horizontalOverflow: 10,
    ),
    color: AppColors.blue,
  ),
  labelStyle: textTheme().titleSmall,
  unselectedLabelStyle: textTheme().titleSmall,
  labelColor: AppColors.darkGray,
  indicatorSize: TabBarIndicatorSize.label,
  labelPadding: EdgeInsets.zero,
  splashFactory: InkRipple.splashFactory,
  overlayColor: AppColors.lightBlue.msp,
);

class _UnderlineIndicatorShape extends ShapeBorder {
  const _UnderlineIndicatorShape({
    required this.radius,
    required this.height,
    required this.horizontalOverflow,
  });
  final Radius radius;
  final double height;
  final double horizontalOverflow;

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.zero;

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    return Path();
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    final finalWidth = rect.width + (horizontalOverflow * 2);
    return Path()
      ..addRRect(RRect.fromRectAndCorners(
        Rect.fromLTWH(
          rect.left - horizontalOverflow,
          rect.height - height,
          finalWidth,
          height,
        ),
        topLeft: radius,
        topRight: radius,
      ));
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {}

  @override
  ShapeBorder scale(double t) => _UnderlineIndicatorShape(
        height: height * t,
        radius: radius * t,
        horizontalOverflow: horizontalOverflow,
      );
}

final highlightTabBarTheme = TabBarTheme(
  indicator: BoxDecoration(
    color: AppColors.lightBlue,
    borderRadius: BorderRadius.circular(Dimensions.borderRadiusSmall),
  ),
  labelColor: AppColors.blue,
  unselectedLabelColor: AppColors.darkGray,
  indicatorSize: TabBarIndicatorSize.tab,
  labelPadding: EdgeInsets.zero,
  splashFactory: InkRipple.splashFactory,
  overlayColor: AppColors.white.msp,
);
