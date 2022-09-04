import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:neat/neat.dart';

class OverlayLoadingIndicator extends StatelessWidget {
  const OverlayLoadingIndicator({
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(duration: Feel.durationMedium,)
    return Stack(
      children: [
        child,
        Positioned.fill(
          child: AbsorbPointer(
            child: Container(
              color: context.colorScheme.surface.withAlpha(36),
              child: const LoadingIndicator(),
            ),
          ),
        )
      ],
    );
  }
}
