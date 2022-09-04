import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:neat/neat.dart';
import 'package:collection/collection.dart';

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
        backgroundColor: context.colorScheme.secondary.msp,
        overlayColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.pressed)) {
            return context.tbtColors.blueHover;
          } else if (const UnorderedIterableEquality().equals(states, {
            MaterialState.hovered,
            MaterialState.focused,
          })) {
            return context.tbtColors.blueHover;
          }
          return context.colorScheme.secondary;
        }),
      ),
      onPressed: onPressed,
      child: child,
    );
  }
}
