import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:neat/neat.dart';

class ColoredChip extends StatelessWidget {
  const ColoredChip.red(this.text, {super.key}) : color = BadgeColor.red;
  const ColoredChip.blue(this.text, {super.key}) : color = BadgeColor.blue;
  const ColoredChip.orange(this.text, {super.key}) : color = BadgeColor.orange;
  const ColoredChip.green(this.text, {super.key}) : color = BadgeColor.green;

  final String text;
  final BadgeColor color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: Dimensions.paddingSmaller,
        vertical: Dimensions.paddingSmallest,
      ),
      decoration: ShapeDecoration(
        shape: StadiumBorder(
          side: BorderSide(
            color: color.color(context),
          ),
        ),
      ),
      child: context.labelMedium(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: color.color(context),
        ),
      ),
    );
  }
}
