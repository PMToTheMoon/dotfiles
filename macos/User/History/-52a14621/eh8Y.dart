import 'package:flutter/material.dart';

class HighlightedOutlinedButton extends StatelessWidget {
  const HighlightedOutlinedButton({
    super.key,
    required this.onPressed,
    required this.text,
  });

  final String text;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(onPressed: onPressed, child: child);
  }
}
