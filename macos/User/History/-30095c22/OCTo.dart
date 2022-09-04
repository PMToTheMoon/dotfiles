import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:neat/neat.dart';

class BorderContainer extends StatelessWidget {
  const BorderContainer({
    super.key,
    required this.child,
  });

  final EdgeInsets? padding;
  final double? borderRadius;
  final Widget child;

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
        color: context.colorScheme.surface,
      ),
      child: child,
    );
  }
}
