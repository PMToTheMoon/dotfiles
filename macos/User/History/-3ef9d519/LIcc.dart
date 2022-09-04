import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:neat/neat.dart';

class MenuButton extends StatelessWidget {
  const MenuButton({
    super.key,
    required this.onPressed,
    required this.child,
  });

  final VoidCallback onPressed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: child,
      style: ButtonStyle(
        padding: EdgeInsets.symmetric(
          vertical: Dimensions.paddingSmallest,
          horizontal: Dimensions.paddingMedium,
        ).msp,
        foregroundColor: context.colorScheme.onSurface.msp,
        overlayColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.pressed)) {
            return context.colorScheme.secondary;
          }
          if (states.contains(MaterialState.hovered)) {
            return context.colorScheme.secondaryContainer;
          }
        }),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Dimensions.borderRadiusMedium),
        ).msp,
      ),
    );
  }
}
