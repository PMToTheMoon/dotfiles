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
      data: context.theme.copyWith(
        hoverColor: Colors.red,
        highlightColor: Colors.green,
        focusColor: Colors.amber,
      ),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: context.colorScheme.secondary.msp,
          overlayColor: context.tbtColors.blueHover.msp,
        ),
        onPressed: onPressed,
        child: child,
      ),
    );
  }
}
