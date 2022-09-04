import 'package:flutter/material.dart';

class BorderCard extends StatelessWidget {
  const BorderCard({super.key, required this.child});

  final Widget? child;
  final BorderRadius? borderRadius;
  final Color? borderColor;
  final double borderWidth;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: borderColor,
          width: borderWidth,
        ),
        borderRadius: radius,
      ),
      child: child,
    );
  }
}
