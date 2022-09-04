import 'package:common/common.dart';
import 'package:flutter/material.dart';

class PrefixedText extends StatelessWidget {
  const PrefixedText({
    super.key,
    required this.text,
  });

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon),
        const SpaceSmallest.w(),
        Text(text),
      ],
    );
  }
}
