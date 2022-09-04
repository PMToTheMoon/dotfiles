import 'package:flutter/material.dart';

const double _kDefaultHeight = 4;
final _kDefaultBorderRadius = BorderRadius.circular(_kDefaultHeight);

class ProgressBar extends StatelessWidget {
  const ProgressBar({
    required this.progress,
    this.backgroundColor,
    this.color,
    this.borderRadius,
    this.height,
    super.key,
  }) : assert(progress >= 0 && progress <= 1);

  /// The advancement of the bar. Should be between 0(0%) and 1(100%) included.
  final double progress;

  /// The color displayed here the progress bar is empty.
  final Color? backgroundColor;

  /// The color displayed here the progress bar is filled.
  final Color? color;

  /// The height of the progress bar.
  final double? height;

  /// if non-null, corners of the bar ar rounded by this [borderRadius].
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) =>
      LayoutBuilder(builder: (context, constraints) {
        final emptySpace = constraints.maxWidth * (1 - progress);
        return Container(
          padding: EdgeInsets.only(right: emptySpace),
          decoration: BoxDecoration(
            color: backgroundColor ??
                Theme.of(context).colorScheme.primaryContainer,
            borderRadius: borderRadius,
          ),
          height: height ?? _kDefaultHeight,
          width: constraints.maxWidth,
          child: progress > 0
              ? Container(
                  decoration: BoxDecoration(
                    borderRadius: borderRadius,
                    color: color ?? Theme.of(context).colorScheme.primary,
                  ),
                )
              : const SizedBox.shrink(),
        );
      });
}
