import 'package:common/common.dart';
import 'package:common/src/theme/_app_colors.dart';
import 'package:flutter/material.dart';

final underlineTabBarTheme = TabBarTheme(
  // indicator: BoxDecoration(
  //   borderRadius: BorderRadius.circular(12),
  //   border: Border(
  //     bottom: BorderSide(color: AppColors.blue, width: 3),
  //   ),
  // ),
  indicator: ShapeDecoration(
      shape: _UnderlineIndicatorShape(radius: Radius.circular(3), height: 3),
      color: AppColors.blue),
  labelColor: AppColors.darkGray,
  indicatorSize: TabBarIndicatorSize.tab,
  labelPadding: EdgeInsets.symmetric(horizontal: 5),
);

class _UnderlineIndicatorShape extends ShapeBorder {
  const _UnderlineIndicatorShape({
    required this.radius,
    required this.height,
  });
  final Radius radius;
  final double height;

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.zero;

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    return Path();
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) => Path()
    ..addRRect(RRect.fromRectAndCorners(
      Rect.fromLTWH(0, rect.height - height, rect.width, height),
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
