import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:neat/neat.dart';

export 'emoji_text.dart';
export 'icon_text.dart';

class PrefixedText extends StatelessWidget {
  const PrefixedText({
    super.key,
    required this.prefix,
    required this.text,
    this.style,
  });

  final Widget prefix;
  final String text;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        prefix,
        const SpaceSmallest.w(),
        context.labelMedium(text, style: style),
      ],
    );
  }
}
