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
      style: ElevatedButton.styleFrom(primary: context.colorScheme.primary),
      onPressed: onPressed,
      child: child,
    );
  }
}
