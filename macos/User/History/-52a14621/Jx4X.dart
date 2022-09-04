import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:neat/neat.dart';

class HighlightedOutlinedButton extends StatelessWidget {
  const HighlightedOutlinedButton({
    super.key,
    required this.onPressed,
    required this.child,
  });

  final Widget child;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: ButtonStyle(
        foregroundColor: context.colorScheme.primary.msp,
        side: BorderSide(color: context.colorScheme.primary).msp,
      ),
      onPressed: onPressed,
      child: child,
    );
  }
}
