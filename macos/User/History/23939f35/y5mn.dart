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
      transitionBuilder: (child, animation) => SizeTransition(
        sizeFactor: animation,
        axis: Axis.vertical,
        axisAlignment: -1,
        child: child,
      ),
      layoutBuilder: (currentChild, previousChildren) => Stack(
        children: [
          if (previousChildren.isNotEmpty) previousChildren.last,
          if (currentChild != null) currentChild,
        ],
      ),
      child: effectiveWidget,
    );
  }
}

class UnfoldableCard extends StatelessWidget {
  const UnfoldableCard({
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
      switchInCurve: Curves.easeIn,
      switchOutCurve: Curves.easeIn,
      transitionBuilder: (child, animation) => SizeTransition(
        sizeFactor: animation,
        axis: Axis.vertical,
        axisAlignment: -1,
        child: child,
      ),
      layoutBuilder: (currentChild, previousChildren) => Stack(
        children: [
          if (previousChildren.isNotEmpty) previousChildren.last,
          if (currentChild != null) currentChild,
        ],
      ),
      child: effectiveWidget,
    );
  }
}
