import 'package:flutter/material.dart';
import 'package:neat/neat.dart';

class TechByTechLogo extends StatelessWidget {
  const TechByTechLogo({
    super.key,
    this.inverted = false,
  });

  /// Determine if the logo should be painted on inverse surface
  final bool inverted;

  @override
  Widget build(BuildContext context) {
    return context.displayMedium(
      'TechByTech',
      style: TextStyle(
        color: inverted
            ? context.colorScheme.onInverseSurface
            : context.colorScheme.onSurface,
      ),
    );
  }
}
