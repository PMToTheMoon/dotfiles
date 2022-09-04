import 'package:flutter/material.dart';
import 'package:neat/neat.dart';

class SecondaryButton extends StatelessWidget {
  const SecondaryButton({
    super.key,
    required this.child,
    required this.onPressed,
  });

  final Widget child;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(primary: context.colorScheme.primary),
      onPressed: onPressed,
      child: child,
    );
  }
}
