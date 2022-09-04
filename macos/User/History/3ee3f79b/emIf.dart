import 'package:common/common.dart';
import 'package:common/src/theme/theme_data/color_scheme.dart';
import 'package:flutter/material.dart';

class ColoredChip extends StatelessWidget {
  const ColoredChip.red({super.key}) : color = BadgeColor.red;
  const ColoredChip.blue({super.key}) : color = BadgeColor.blue;
  const ColoredChip.orange({super.key}) : color = BadgeColor.orange;
  const ColoredChip.green({super.key}) : color = BadgeColor.green;

  final BadgeColor color;

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
