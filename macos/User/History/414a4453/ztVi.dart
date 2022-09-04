import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:neat/neat.dart';

const _kSize = Dimensions.sizeSmallest;

class ZanalysRadio extends StatelessWidget {
  const ZanalysRadio({
    required this.selected,
    super.key,
  });

  final bool selected;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Feel.durationMedium,
      decoration: BoxDecoration(
        color: selected ? context.colorScheme.primary : Colors.transparent,
        border: selected
            ? Border.all(color: context.colorScheme.primary)
            : Border.all(color: context.colorScheme.outline),
        borderRadius: BorderRadius.circular(_kSize),
      ),
      padding: const PaddingSmallest.all(),
      child: Icon(
        Icons.check,
        color: context.colorScheme.surface,
        size: _kSize,
      ),
    );
  }
}
