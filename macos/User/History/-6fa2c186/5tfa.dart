import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:neat/neat.dart';

class OverlayLoadingIndicator extends StatelessWidget {
  const OverlayLoadingIndicator({
    required this.child,
    required this.loading,
    super.key,
  });

  final bool loading;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final effectiveChild = loading
        ? Stack(
            children: [
              child,
              Positioned.fill(
                child: AbsorbPointer(
                  child: Container(
                    color: context.colorScheme.surface.withAlpha(128),
                    child: const LoadingIndicator(),
                  ),
                ),
              )
            ],
          )
        : child;

    // return loading ? LoadingIndicator() : child;
    return AnimatedSwitcher(
      duration: Feel.durationMedium,
      child: effectiveChild,
    );
  }
}
