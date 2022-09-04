import 'package:common/src/widgets/prefixed_text/prefixed_text.dart';
import 'package:flutter/material.dart';

class IconText extends StatelessWidget {
  const IconText(this.icon, this.text);

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return PrefixedText(prefix: Icon(icon), text: text);
  }
}
