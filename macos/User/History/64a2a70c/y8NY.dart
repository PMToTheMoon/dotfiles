import 'package:flutter/material.dart';
import 'package:neat/neat.dart';

class OrangeChip extends StatelessWidget {
  const OrangeChip({
    required this.label,
    super.key,
  });

  final String label;
  final bool accent;

  TextStyle _textStyle(BuildContext context) => accent ? TextStyle(
          fontWeight: FontWeight.w600,
          color: context.colorScheme.primary,
        ) : context.textTheme.labelMedium;

  @override
  Widget build(BuildContext context) {
    return Chip(
      backgroundColor: context.colorScheme.primaryContainer,
      label: Text(
        label,
        style: 
      ),
    );
  }
}
