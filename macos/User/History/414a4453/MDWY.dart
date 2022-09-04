import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:neat/neat.dart';

const _kSize = 12.0; //Dimensions.sizeSmallest;

class ZanalysRadio extends StatelessWidget {
  const ZanalysRadio({
    required this.selected,
    this.onTap,
    super.key,
  });

  final bool selected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(_kSize)),
      child: InkWell(
        onTap: onTap,
        child: AnimatedContainer(
          duration: Feel.durationMedium,
          decoration: BoxDecoration(
            color: selected ? context.colorScheme.primary : Colors.transparent,
            border: selected
                ? Border.all(color: context.colorScheme.primary)
                : Border.all(color: context.colorScheme.outline),
            borderRadius: BorderRadius.circular(_kSize),
          ),
          padding: const EdgeInsets.all(3),
          child: Visibility(
            visible: selected,
            maintainSize: true,
            maintainAnimation: true,
            maintainState: true,
            child: Icon(
              Icons.check,
              color: context.colorScheme.surface,
              size: _kSize,
            ),
          ),
        ),
      ),
    );
  }
}
