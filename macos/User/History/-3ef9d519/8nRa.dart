import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:neat/neat.dart';

class MenuButton extends StatelessWidget {
  const MenuButton({
    super.key,
    required this.onPressed,
    required this.child,
  });

  final VoidCallback? onPressed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        padding: const EdgeInsets.symmetric(
          vertical: Dimensions.paddingSmaller,
          horizontal: Dimensions.paddingLarge,
        ).msp,
        foregroundColor: context.colorScheme.onSurface.msp,
        overlayColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.pressed)) {
            return context.colorScheme.primary;
          }
          if (states.contains(MaterialState.hovered)) {
            return context.colorScheme.primaryContainer;
          }
          return Colors.transparent;
        }),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Dimensions.borderRadiusMedium),
        ).msp,
      ),
      child: child,
    );
  }
}
