import 'package:common/common.dart';
import 'package:common/src/widgets/chips/info_chip.dart';
import 'package:flutter/material.dart';
import 'package:neat/neat.dart';

class RectChip extends StatelessWidget {
  const RectChip(
    this.label, {
    super.key,
  });

  final String label;

  @override
  Widget build(BuildContext context) {
    return InfoChip(
      backgroundColor: context.colorScheme.outline,
      padding: const EdgeInsets.symmetric(
        horizontal: Dimensions.paddingSmaller,
        vertical: Dimensions.paddingSmallest,
      ),
      borderRadius: BorderRadius.circular(Dimensions.borderRadiusSmallest),
      child: context.labelMedium(label),
    );
  }
}
