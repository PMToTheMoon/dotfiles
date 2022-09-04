import 'package:flutter/material.dart';

class ProgressBar extends StatelessWidget {
  const ProgressBar({
    required this.value,
    this.backgroundColor,
    this.color,
    super.key,
  }) : assert(value >= 0 && value <= 1);

  /// A progress ration between 0 and 1 included.
  /// 0 represent 0% advancement while 1 is 100%.
  final double value;
  final Color? backgroundColor;
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
