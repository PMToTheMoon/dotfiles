import 'package:flutter/material.dart';

class ColoredChip extends StatelessWidget {
  const ColoredChip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InputChip(
      label: Text("Test"),
      disabledColor: Colors.transparent,
      shape: StadiumBorder(),
      backgroundColor: Colors.transparent,
    );
  }
}
