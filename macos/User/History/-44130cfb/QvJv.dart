import 'package:common/common.dart';
import 'package:common/src/theme/_app_colors.dart';
import 'package:flutter/material.dart';

const underlineTabBarTheme = TabBarTheme(
  indicator: ShapeDecoration(
    shape: _UnderlineIndicatorShape(radius: Radius.circular(10), height: 3),
    color: AppColors.blue,
  ),
  labelColor: AppColors.darkGray,
  indicatorSize: TabBarIndicatorSize.label,
  labelPadding: EdgeInsets.symmetric(horizontal: 15),
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
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) => Path()
    ..addRRect(RRect.fromRectAndCorners(
      Rect.fromLTWH(rect.left, rect.height - height, rect.width, height),
      topLeft: radius,
      topRight: radius,
    ));

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {}

  @override
  ShapeBorder scale(double t) => _UnderlineIndicatorShape(
        height: height * t,
        radius: radius * t,
      );
}

final highlightTabBarTheme = TabBarTheme(
  indicator: BoxDecoration(
    color: AppColors.lightBlue,
    borderRadius: BorderRadius.circular(Dimensions.borderRadiusSmall),
  ),
  labelColor: AppColors.darkGray,
  indicatorSize: TabBarIndicatorSize.tab,
  labelPadding: const EdgeInsets.all(5),
);
