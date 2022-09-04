import 'package:common/common.dart';
import 'package:common/src/widgets/chips/info_chip.dart';
import 'package:flutter/material.dart';
import 'package:neat/neat.dart';

class SquareChip extends StatelessWidget {
  const SquareChip(
    this.label, {
    super.key,
  });

  final String label;

  @override
  Widget build(BuildContext context) {
    return InfoChip(
      backgroundColor: context.colorScheme.surfaceVariant,
      padding: const EdgeInsets.symmetric(
        horizontal: Dimensions.paddingSmaller,
        vertical: Dimensions.paddingSmallest,
      ),
      borderRadius: BorderRadius.circular(Dimensions.borderRadiusSmallest),
      child: context.labelMedium(label),
    );
  }
}
