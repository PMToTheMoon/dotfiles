import 'package:common/common.dart';
import 'package:flutter/material.dart';

class Unfoldable extends StatelessWidget {
  const Unfoldable({
    super.key,
    required this.unfold,
    required this.folded,
    required this.unfolded,
  });

  final bool unfold;
  final Widget folded;
  final Widget unfolded;

  @override
  Widget build(BuildContext context) {
    final effectiveWidget = unfold ? unfolded : folded;

    return AnimatedSwitcher(
      duration: Feel.durationMedium,
      child: effectiveWidget,
    );
  }
}
