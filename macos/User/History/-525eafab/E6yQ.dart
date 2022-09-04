import 'package:flutter/material.dart';

class BorderCard extends StatelessWidget {
  const BorderCard({super.key, required this.child});

  final Widget? child;
  final BorderRadius? borderRadius;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(
        side: BorderSide(),
        borderRadius: radius,
      ),
      child: child,
    );
  }
}
