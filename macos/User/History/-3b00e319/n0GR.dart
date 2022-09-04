import 'package:flutter/material.dart';
import 'package:neat/neat.dart';

enum Gender {
  male,
  female,
}

class GenderField extends StatelessWidget {
  const GenderField({
    super.key,
    required this.selected,
    required this.onChanged,
  });

  final Gender selected;
  final ValueChanged<Gender>? onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: Gender.values
          .map((gender) => _Option(
                text: gender.name,
                onTap: onChanged != null ? () => onChanged!(gender) : null,
                isSelected: selected == gender,
              ))
          .toList(),
    );
  }
}

class _Option extends StatelessWidget {
  const _Option({
    required this.text,
    required this.isSelected,
    required this.onTap,
  });

  final String text;
  final bool isSelected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: isSelected
          ? context.colorScheme.primary
          : context.colorScheme.surface,
      child: InkWell(
        onTap: onTap,
        child: Center(
          child: Text(text),
        ),
      ),
    );
  }
}
