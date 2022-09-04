import 'package:common/common.dart';
import 'package:flutter/material.dart';

class PrefixedText extends StatelessWidget {
  const PrefixedText({
    super.key,
    required this.text,
    required this.prefix,
  });

  final Widget prefix;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox.square(
          dimension: Dimensions.spaceSmallest,
          child: prefix,
        ),
        const SpaceSmallest.w(),
        Text(text),
      ],
    );
  }
}
