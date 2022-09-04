import 'package:common/common.dart';
import 'package:flutter/material.dart';

class IconTextChip extends StatelessWidget {
  const IconTextChip(
    this.icon,
    this.text, {
    super.key,
  }) : padding = const EdgeInsets.symmetric(
          horizontal: Dimensions.paddingSmaller,
          vertical: 2,
        );

  final IconData icon;
  final String text;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      child: IconTextChip(icon, text),
    );
  }
}
