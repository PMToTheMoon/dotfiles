import 'package:common/common.dart';
import 'package:flutter/material.dart';

class IconTextChip extends StatelessWidget {
  const IconTextChip(
    this.icon,
    this.text, {
    super.key,
  }):

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      child: IconTextChip(icon, text),
    );
  }
}
