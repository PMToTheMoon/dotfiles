import 'package:flutter/material.dart';

class ColoredChip extends StatelessWidget {
  const ColoredChip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: InputChip(
        label: Text("Test"),
        disabledColor: Colors.transparent,
        shape: StadiumBorder(
          side: BorderSide(),
        ),
        backgroundColor: Colors.transparent,
        // onPressed: () {},
      ),
    );
  }
}
