import 'package:flutter/material.dart';

class ProgressBar extends StatelessWidget {
  const ProgressBar({
    required this.value,
    this.backgroundColor,
    this.color,
    super.key,
  }) : assert(value >= 0 && value <= 1);

  /// The advancement of the bar. Should be between 0(0%) and 1(100%) included.
  final double value;

  /// The color displayed here the progress bar is empty
  final Color? backgroundColor;

  /// The color displayed here the progress bar is filled
  final Color? color;

  @override
  Widget build(BuildContext context) =>
      LayoutBuilder(builder: (context, constraints) {
        final emptySpace = constraints.maxWidth * (1 - value);
        final borderRadius = BorderRadius.circular(_kStatusBarHeight);
        return Container(
          padding: EdgeInsets.only(right: emptySpace),
          decoration: BoxDecoration(
            color: backgroundColor ?? context.colorScheme.tertiaryContainer,
            borderRadius: borderRadius,
          ),
          height: _kStatusBarHeight,
          width: constraints.maxWidth,
          child: value > 0
              ? Container(
                  decoration: BoxDecoration(
                    borderRadius: borderRadius,
                    color: color ?? context.colorScheme.tertiary,
                  ),
                )
              : const SizedBox.shrink(),
        );
      });
}
