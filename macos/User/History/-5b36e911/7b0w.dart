import 'package:common/common.dart';
import 'package:flutter/material.dart';

class IconTextChip extends StatelessWidget {
  const IconTextChip(
    this.icon,
    this.text, {
    super.key,
  })  : padding = const EdgeInsets.symmetric(
          horizontal: Dimensions.paddingSmaller,
          vertical: 2,
        ),
        borderRadius = const BorderRadius.all(Radius.zero);

  final IconData icon;
  final String text;
  final EdgeInsets padding;
  final BorderRadius borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: borderRadius,
      ),
      padding: padding,
      child: IconTextChip(icon, text),
    );
  }
}
