import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:neat/neat.dart';

enum Gender {
  male,
  female;

  String display(BuildContext context) {
    switch (this) {
      case Gender.male:
        return 'Homme';
      case Gender.female:
        return 'Femme';
    }
  }
}

class GenderField extends StatelessWidget {
  const GenderField({
    super.key,
    required this.selected,
    this.onChanged,
  });

  final Gender selected;
  final ValueChanged<Gender>? onChanged;

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(Dimensions.borderRadiusSmall);
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: context.colorScheme.outline),
        borderRadius: BorderRadius.circular(Dimensions.borderRadiusSmall),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(Dimensions.borderRadiusSmall),
        child: Row(
          children: Gender.values
              .map((gender) => Expanded(
                    child: _Option(
                      text: gender.display(context),
                      onTap:
                          onChanged != null ? () => onChanged!(gender) : null,
                      isSelected: selected == gender,
                    ),
                  ))
              .toList(),
        ),
      ),
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
        child: Padding(
          padding: const PaddingSmall(),
          child: Center(
            child: context.labelLarge(
              text,
              style: isSelected
                  ? TextStyle(color: context.colorScheme.onPrimary)
                  : TextStyle(color: context.colorScheme.onSurface),
            ),
          ),
        ),
      ),
    );
  }
}
