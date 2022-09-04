import 'package:common/common.dart';
import 'package:common/src/theme/_app_colors.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

extension MakeShimmer on BuildContext {
  Shimmer shimmer(
    Widget child, {
    Key? key,
    bool enabled = true,
  }) =>
      Shimmer.fromColors(
        key: key,
        baseColor: AppColors.lightGray,
        highlightColor: AppColors.white,
        period: Feel.durationLong,
        enabled: enabled,
        child: child,
      );

  Shimmer textShimmerWrapper(
    double fontSize,
    Widget child, {
    Key? key,
    bool enabled = true,
  }) {
    final h = fontSize * 0.8;
    final m = fontSize - h;
    return DecoratedBox(
          decoration: BoxDecoration(
            color: Colors.black,
          ),
          child: child,
        );
}
