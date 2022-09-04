import 'package:common/common.dart';
import 'package:flutter/material.dart';

export 'emoji_text.dart';
export 'icon_text.dart';

class PrefixedText extends StatelessWidget {
  const PrefixedText({
    super.key,
    required this.prefix,
    required this.text,
  });

  final Widget prefix;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox.square(dimension: Dimensions.spaceSmall, child: prefix
            // child: FittedBox(
            //   child: prefix,
            // ),
            ),
        const SpaceSmallest.w(),
        Text(text),
      ],
    );
  }
}
