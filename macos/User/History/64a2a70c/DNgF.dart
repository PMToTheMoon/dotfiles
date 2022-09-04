import 'package:flutter/material.dart';
import 'package:neat/neat.dart';

class OrangeAccentTextChip extends StatelessWidget {
  const OrangeAccentTextChip(
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

class TextChip extends StatelessWidget {
  const TextChip(
    this.text, {
    super.key,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Chip(label: Text(text));
  }
}
