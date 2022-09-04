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

class Shimmer extends InheritedWidget {
  static Shimmer of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<Shimmer>() as Shimmer;

  const Shimmer({
    super.key,
  });

  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return;
  }

  @override
  bool updateShouldNotify(Shimmer oldWidget) => oldWidget.enabled != enabled;
}
