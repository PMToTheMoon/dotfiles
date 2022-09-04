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
      color: context.colorScheme.primary,
      padding: const PaddingSmallest.all(),
      child: context.labelSmall("Requis"),
    );
  }
}
