import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:neat/neat.dart';

class TitledSection extends StatelessWidget {
  const TitledSection({
    super.key,
    required this.title,
    required this.children,
    this.subtitle,
    this.required = false,
  });

  final String title;
  final String? subtitle;
  final List<Widget> children;
  final bool required;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              child: subtitle == null
                  ? context.headlineMedium(title)
                  : RichText(
                      text: TextSpan(
                        text: '$title ',
                        style: context.textTheme.headlineMedium,
                        children: [
                          TextSpan(
                            text: subtitle,
                            style: context.textTheme.labelSmall,
                          ),
                        ],
                      ),
                    ),
            ),
            const SpaceSmallest.w(),
            if (required) const RequiredChip(),
          ],
        ),
        const SpaceSmaller.h(),
        ...children,
      ],
    );
  }
}
