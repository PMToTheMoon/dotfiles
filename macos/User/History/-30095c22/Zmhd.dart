import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:neat/neat.dart';

class BorderContainer extends StatelessWidget {
  const BorderContainer({
    required this.child,
    this.padding,
    this.borderRadius,
    this.backgroundColor,
    super.key,
  });

  final EdgeInsets? padding;
  final double? borderRadius;
  final Widget child;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          borderRadius ?? Dimensions.borderRadiusMedium,
        ),
        border: Border.all(
          color: context.colorScheme.outline,
        ),
        color: backgroundColor ?? context.colorScheme.surface,
      ),
      child: child,
    );
  }
}
