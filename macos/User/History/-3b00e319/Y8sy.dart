import 'package:flutter/material.dart';
import 'package:neat/neat.dart';

enum Gender {
  male,
  female,
}

class GenderField extends StatelessWidget {
  const GenderField({
    super.key,
    required this.gender,
    required this.onChanged,
  });

  final Gender gender;
  final ValueChanged<Gender> onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: Gender.values.map((e) => _Option()).toList(),
    );
  }
}

class _Option extends StatelessWidget {
  const _Option({
    super.key,
    required this.isSelected,
    required this.onTap,
  });

  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: isSelected
          ? context.colorScheme.primary
          : context.colorScheme.surface,
      child: InkWell(
        onTap: onTap,
        child: Center(
          child: Text("male"),
        ),
      ),
    );
  }
}
