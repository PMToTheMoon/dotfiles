import 'package:common/common.dart';
import 'package:flutter/material.dart';

class Unfoldable extends StatelessWidget {
  const Unfoldable({
    super.key,
    required this.extension,
    required this.header,
    required this.unfolded,
  });

  final bool extension;
  final Widget header;
  final Widget unfolded;

  @override
  Widget build(BuildContext context) {
    final effectiveExtension = extension ? unfolded : header;

    return Column(
      children: [
        fold
        AnimatedSwitcher(
          switchInCurve: Curves.easeInOut,
          switchOutCurve: Curves.easeInOut,
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
          child: effectiveExtension,
        ),
      ],
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
      switchOutCurve: Curves.easeOut,
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
