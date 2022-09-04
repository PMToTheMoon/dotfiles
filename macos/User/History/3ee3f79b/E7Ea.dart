import 'package:common/common.dart';
import 'package:flutter/material.dart';

class ColoredChip extends StatelessWidget {
  const ColoredChip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: Dimensions.paddingSmaller,
        vertical: Dimensions.paddingSmallest,
      ),
      decoration: const ShapeDecoration(
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
