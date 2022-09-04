import 'package:flutter/material.dart';

class InfoChip extends StatelessWidget {
  const InfoChip({
    super.key,
    required this.backgroundColor,
    required this.padding,
    required this.borderRadius,
    this.width,
    this.height,
    required this.child,
  });

  final double? width;
  final double? height;
  final Widget child;
  final Color backgroundColor;
  final EdgeInsets padding;
  final BorderRadius borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: borderRadius,
      ),
      padding: padding,
      child: child,
    );
  }
}
