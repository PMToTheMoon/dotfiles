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
    return BorderContainer(
      borderRadius: _kSize,
      backgroundColor: selected ? context.colorScheme.primary : null,
      child: Icon(
        Icons.check,
        color: context.colorScheme.surface,
        size: _kSize,
      ),
    );
  }
}
