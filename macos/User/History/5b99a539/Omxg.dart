import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:neat/neat.dart';

class FormSection extends StatelessWidget {
  const FormSection({
    super.key,
    required this.title,
    required this.children,
    this.required = false,
  });

  final String title;
  final List<Widget> children;
  final bool required;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Expanded(
              child: context.headlineMedium(title),
            ),
            if (required) const RequiredChip(),
          ],
        ),
        const SpaceSmall.h(),
        ...children,
      ],
    );
  }
}
