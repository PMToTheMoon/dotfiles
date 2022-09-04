import 'package:flutter/material.dart';
import 'package:neat/neat.dart';

enum Gender {
  male,
  female,
}

class GenderField extends StatelessWidget {
  const GenderField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ToggleButtons(
      children: [
        SizedBox.expand(child: Text("Male")),
        Center(child: Text("Female")),
      ],
      selectedColor: context.colorScheme.onPrimary,
      fillColor: context.colorScheme.primary,
      isSelected: [false, true],
      onPressed: (int index) {},
    );
  }
}
