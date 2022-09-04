import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:neat/neat.dart';

class TitledSection extends StatelessWidget {
  const TitledSection({
    super.key,
    required this.title,
    required this.child,
    this.subtitle,
    this.required = false,
  });

  final String title;
  final String? subtitle;
  final Widget child;
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
              child: RichText(
                text: TextSpan(
                  text: '$title ',
                  style: context.textTheme.headlineMedium?.copyWith(
                    color: context.colorScheme.onSurfaceVariant,
                  ),
                  children: [
                    if (subtitle != null)
                      TextSpan(
                        text: subtitle,
                        style: context.textTheme.bodySmall?.copyWith(
                          color: context.colorScheme.onSurfaceVariant,
                        ),
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
        child,
      ],
    );
  }
}
