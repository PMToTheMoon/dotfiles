import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:neat/neat.dart';

class FormSection extends StatelessWidget {
  const FormSection({
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
              child: context.headlineMedium(title),
            ),
            if (subtitle != null) ...[
              const SpaceSmallest.w(),
              Expanded(
                child: context.labelSmall('$subtitle'),
              ),
            ],
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
