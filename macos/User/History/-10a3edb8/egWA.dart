import 'package:common/common.dart';
import 'package:common/src/theme/_app_colors.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart' as ext;

class Shimmer extends StatelessWidget {
  const Shimmer({
    super.key,
    required this.child,
  })  : baseColor = AppColors.lightGray,
        highlightColor = AppColors.white;

  final Color baseColor;
  final Color highlightColor;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ext.Shimmer.fromColors(
      baseColor: baseColor,
      highlightColor: highlightColor,
      period: Feel.durationLong,
      child: child,
    );
  }
}
