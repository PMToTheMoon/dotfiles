import 'package:flutter/material.dart';
import 'package:neat/neat.dart';

class TechByTechLogo extends StatelessWidget {
  const TechByTechLogo({
    super.key,
    this.color,
  });

  final Color? color;

  @override
  Widget build(BuildContext context) {
    return context.displayLarge(
      'TechByTech',
      style: TextStyle(
        color: color ?? context.colorScheme.onSurface,
      ),
    );
  }
}
