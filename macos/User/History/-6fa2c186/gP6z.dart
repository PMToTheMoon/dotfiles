import 'package:common/common.dart';
import 'package:flutter/material.dart';

class OverlayLoadingIndicator extends StatelessWidget {
  const OverlayLoadingIndicator({
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        Positioned.fill(
          child: Container(
            child: const LoadingIndicator(),
          ),
        )
      ],
    );
  }
}
