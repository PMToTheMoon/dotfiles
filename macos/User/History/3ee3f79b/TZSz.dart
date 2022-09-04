import 'package:flutter/material.dart';

class ColoredChip extends StatelessWidget {
  const ColoredChip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        shape: StadiumBorder(
          side: BorderSide(),
        ),
      ),
      // backgroundColor: Colors.transparent,
      child: Text("Test"),
      // onPressed: () {},
    );
  }
}
