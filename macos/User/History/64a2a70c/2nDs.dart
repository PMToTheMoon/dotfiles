import 'package:flutter/material.dart';
import 'package:neat/neat.dart';

class OrangeChip extends StatelessWidget {
  const OrangeChip({
    super.key,
  });

  final String label;

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(label),
    );
  }
}
