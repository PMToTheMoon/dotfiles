import 'package:common/common.dart';
import 'package:common/src/widgets/prefixed_text/prefixed_text.dart';
import 'package:flutter/material.dart';

class IconText extends StatelessWidget {
  const IconText(
    this.icon,
    this.text, {
    this.iconColor,
    super.key,
  });

  final IconData icon;
  final Color? iconColor;
  final String text;

  @override
  Widget build(BuildContext context) {
    return PrefixedText(
        prefix: Icon(
          icon,
          color: iconColor,
          size: Dimensions.iconMedium,
        ),
        text: text);
  }
}
