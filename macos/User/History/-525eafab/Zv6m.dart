import 'package:flutter/material.dart';

class BorderCard extends StatelessWidget {
  const BorderCard({super.key, required this.child});

  final Widget? child;
  final BorderRadiusGeometry? borderRadius;
  final Color? borderColor;
  final double? borderWidth;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: borderColor ?? Theme.of(context).colorScheme.primary,
          width: borderWidth ?? 1,
        ),
        borderRadius: borderRadius,
      ),
      child: child,
    );
  }
}
