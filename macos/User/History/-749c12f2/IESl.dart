import 'package:flutter/material.dart';

const double _kDefaultHeight = 4;
final _kDefaultBorderRadius = BorderRadius.circular(_kDefaultHeight);

class ProgressBar extends StatelessWidget {
  const ProgressBar({
    required this.progress,
    this.backgroundColor,
    this.color,
    this.borderRadius,
    super.key,
  })  : assert(progress >= 0 && progress <= 1),
        _borderRadius = borderRadius ?? _kDefaultBorderRadius;

  /// The advancement of the bar. Should be between 0(0%) and 1(100%) included.
  final double progress;

  /// The color displayed here the progress bar is empty
  final Color? backgroundColor;

  /// The color displayed here the progress bar is filled
  final Color? color;

  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) =>
      LayoutBuilder(builder: (context, constraints) {
        final emptySpace = constraints.maxWidth * (1 - progress);
        final radius = borderRadius ?? _kDefaultBorderRadius;
        return Container(
          padding: EdgeInsets.only(right: emptySpace),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: radius,
          ),
          height: _kStatusBarHeight,
          width: constraints.maxWidth,
          child: value > 0
              ? Container(
                  decoration: BoxDecoration(
                    borderRadius: radius,
                    color: color ?? context.colorScheme.tertiary,
                  ),
                )
              : const SizedBox.shrink(),
        );
      });
}
