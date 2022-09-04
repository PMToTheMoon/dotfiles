import 'package:flutter/material.dart';
import 'package:neat/neat.dart';

class FullScreenLoader extends StatelessWidget {
  final Widget? child;
  final bool isLoading;

  const FullScreenLoader({Key? key, required this.isLoading, this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        if (child != null) child!,
        if (isLoading) const _Loader(),
      ],
    );
  }
}

class _Loader extends StatelessWidget {
  final Color? valueColor;
  final Color? backgroundColor;

  const _Loader({
    Key? key,
    this.valueColor,
    this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      child: Container(
        constraints: const BoxConstraints.expand(),
        child: Center(
          child: CircularProgressIndicator(
            backgroundColor: backgroundColor,
            valueColor: AlwaysStoppedAnimation(
              context.colorScheme.primary,
            ),
          ),
        ),
      ),
    );
  }
}
