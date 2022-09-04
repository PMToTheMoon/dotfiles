import 'package:common/common.dart';
import 'package:flutter/material.dart';

class Unfoldable extends StatelessWidget {
  const Unfoldable({
    super.key,
    required this.uunfolded,
    required this.folded,
    required this.unfolded,
  });

  final bool uunfolded;
  final Widget folded;
  final Widget unfolded;

  @override
  Widget build(BuildContext context) {
    final effectiveWidget = uunfolded ? unfolded : folded;

    return AnimatedSwitcher(
      duration: Feel.durationMedium,
      child: effectiveWidget,
    );
  }
}
