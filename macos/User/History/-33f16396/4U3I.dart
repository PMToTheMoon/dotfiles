import 'package:common/common.dart';
import 'package:common/src/theme/_app_colors.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart' as ext;

class ShimmerData extends InheritedWidget {
  static ShimmerData of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<ShimmerData>() as ShimmerData;

  const ShimmerData({
    super.key,
    required super.child,
    this.enabled = true,
  });

  final bool enabled;

  @override
  bool updateShouldNotify(ShimmerData oldWidget) =>
      oldWidget.enabled != enabled;
}

class SharedShimmer extends StatelessWidget {
  const SharedShimmer({
    required this.child,
    super.key,
    this.enabled = true,
  });

  final bool enabled;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ShimmerData(
      enabled: enabled,
      child: AnimatedSwitcher(
        duration: Feel.durationMedium,
        switchInCurve: Feel.curveMedium,
        switchOutCurve: Feel.curveMedium,
        child: enabled
            ? ext.Shimmer.fromColors(
                baseColor: AppColors.lightGray,
                highlightColor: AppColors.white,
                period: Feel.durationLong,
                enabled: enabled,
                child: child,
              )
            : child,
      ),
    );
  }
}

class ShimmerText extends StatelessWidget {
  const ShimmerText({
    super.key,
    required this.fontSize,
    required this.child,
    this.width = double.infinity,
  });

  final double fontSize;
  final Widget child;
  final double width;

  @override
  Widget build(BuildContext context) {
    final enabled = ShimmerData.of(context).enabled;
    if (!enabled) return child;
    final h = fontSize;
    final m = fontSize * .3;
    return Container(
      color: AppColors.lightGray,
      height: h,
      width: width,
      margin: EdgeInsets.symmetric(vertical: m),
    );
  }
}
