import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:models/models.dart';
import 'package:neat/neat.dart';

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
    final borderRadius = BorderRadius.circular(Dimensions.borderRadiusSmaller);
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: context.colorScheme.outline),
        borderRadius: borderRadius,
      ),
      child: ClipRRect(
        borderRadius: borderRadius,
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
