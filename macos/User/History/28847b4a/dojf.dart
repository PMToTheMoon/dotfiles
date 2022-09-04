import 'package:common/common.dart';
import 'package:common/src/theme/_app_colors.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart' as ext;

// Shimmer shimmer(
//   Widget child, {
//   Key? key,
//   bool enabled = true,
// }) =>
//     Shimmer.fromColors(
//       key: key,
//       baseColor: AppColors.lightGray,
//       highlightColor: AppColors.white,
//       period: Feel.durationLong,
//       enabled: enabled,
//       child: child,
//     );

// Widget textShimmerWrapper(
//   double fontSize,
//   Widget child, {
//   Key? key,
//   bool enabled = true,
//   double width = double.infinity,
// }) {
//   if (!enabled) return child;
//   final h = fontSize;
//   final m = fontSize * .3;
//   return Container(
//     color: AppColors.lightGray,
//     height: h,
//     width: width,
//     margin: EdgeInsets.symmetric(vertical: m),
//   );
// }

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

class Shimmer extends StatelessWidget {
  const Shimmer({
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
      child: ext.Shimmer.fromColors(
        baseColor: AppColors.lightGray,
        highlightColor: AppColors.white,
        period: Feel.durationLong,
        enabled: enabled,
        child: child,
      ),
    );
  }
}

class ShimmerText extends StatelessWidget {
  const ShimmerText({
    super.key,
  });

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
