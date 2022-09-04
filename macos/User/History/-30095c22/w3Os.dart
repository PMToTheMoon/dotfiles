import 'package:flutter/material.dart';
import 'package:neat/neat.dart';

class BorderContainer extends StatelessWidget {
  const BorderContainer({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(),
        color: context.colorScheme.surface,
      ),
      child: child,
    );
  }
}
