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
    return Theme(
      data: ThemeData(hoverColor: context.tbtColors.blueHover),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: context.colorScheme.secondary.msp,
        ),
        onPressed: onPressed,
        child: child,
      ),
    );
  }
}
