import 'package:flutter/material.dart';

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
      isSelected: [false, true],
    );
  }
}
