import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:neat/neat.dart';

class RequiredChip extends StatelessWidget {
  const RequiredChip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const PaddingSmallest.all(),
      decoration: BoxDecoration(
        color: context.colorScheme.primary,
        borderRadius: BorderRadius.circular(Dimensions.borderRadiusSmallest),
      ),
      child: context.labelSmall(
        context.l10n.required_chip,
        style: TextStyle(
          color: context.colorScheme.onPrimary,
        ),
      ),
    );
  }
}
