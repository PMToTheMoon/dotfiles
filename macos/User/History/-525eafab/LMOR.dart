import 'package:flutter/material.dart';

class BorderCard extends StatelessWidget {
  const BorderCard({
    super.key,
    this.borderRadius,
    this.borderColor,
    this.borderWidth,
    this.child,
  });

  final Widget? child;
  final BorderRadiusGeometry? borderRadius;
  final BorderSide border;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: borderColor ?? Theme.of(context).colorScheme.primary,
          width: borderWidth ?? 1,
        ),
        borderRadius: borderRadius ?? BorderRadius.zero,
      ),
      child: child,
    );
  }
}
