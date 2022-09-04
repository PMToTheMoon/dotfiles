import 'package:common/common.dart';
import 'package:common/src/theme/_app_colors.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart' as ext;

class Shimmer extends StatelessWidget {
  const Shimmer({
    super.key,
  }) : baseColor = AppColors.lightGray;

  final Color baseColor;
  final Color highlightColor;

  @override
  Widget build(BuildContext context) {
    return ext.Shimmer.fromColors(
      baseColor: 
      highlightColor: AppColors.white,
      period: Feel.durationLong,
      enabled: enabled,
      child: child,
    );
  }
}
