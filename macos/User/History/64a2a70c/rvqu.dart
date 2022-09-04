import 'package:flutter/material.dart';
import 'package:neat/neat.dart';

class OrangeAccentChip extends StatelessWidget {
  const OrangeAccentChip({
    required this.label,
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
    return const Text('TextChip');
  }
}
