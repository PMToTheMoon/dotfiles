import 'package:flutter/material.dart';

class BorderCard extends StatelessWidget {
  const BorderCard({
    super.key,
    required this.side,
    this.borderRadius,
    this.child,
  });

  final Widget? child;
  final BorderRadiusGeometry? borderRadius;
  final BorderSide side;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        side: side,
        borderRadius: borderRadius ?? BorderRadius.zero,
      ),
      clipBehavior: Clip.hardEdge,
      child: child,
    );
  }
}
