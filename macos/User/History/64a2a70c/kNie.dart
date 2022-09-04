import 'package:flutter/material.dart';
import 'package:neat/neat.dart';

class OrangeChip extends StatelessWidget {
  const OrangeChip(
    this.label, {
    super.key,
  });

  final String label;

  @override
  Widget build(BuildContext context) {
    return Chip(
      backgroundColor: context.colorScheme.primaryContainer,
      label: Text(
        label,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          color: context.colorScheme.primary,
        ),
      ),
    );
  }
}
