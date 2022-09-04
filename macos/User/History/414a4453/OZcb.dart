import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:neat/neat.dart';

const _kSize = Dimensions.iconSmall;

class ZanalysRadio extends StatelessWidget {
  const ZanalysRadio({
    required this.selected,
    super.key,
  });

  final bool selected;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      decoration: BoxDecoration(
        color: selected ? context.colorScheme.primary : Colors.transparent,
        border: Border.all(color: context.colorScheme.outline)
      borderRadius: _kSize,
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
