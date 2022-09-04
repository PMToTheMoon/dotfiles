import 'package:flutter/material.dart';
import 'package:neat/neat.dart';

class GenderField extends StatelessWidget {
  const GenderField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ToggleButtons(
      children: [
        Text("Male"),
        Text("Female"),
      ],
      selectedColor: context.colorScheme.primaryContainer,
      isSelected: [false, true],
    );
  }
}
