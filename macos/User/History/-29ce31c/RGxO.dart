import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:neat/neat.dart';

class SecondaryButton extends StatelessWidget {
  const SecondaryButton({
    super.key,
    required this.onPressed,
    required this.child,
  });

  final VoidCallback? onPressed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: context.colorScheme.primary.msp,
        overlayColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.pressed)) {
            return Colors.white.withAlpha(67);
          } else if (states.contains(MaterialState.hovered) ||
              states.contains(MaterialState.focused)) {
            return context.tbtColors.blueHover;
          }
          return context.colorScheme.primary;
        }),
      ),
      onPressed: onPressed,
      child: child,
    );
  }
}
