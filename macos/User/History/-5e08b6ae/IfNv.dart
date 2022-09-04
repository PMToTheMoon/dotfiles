import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:neat/neat.dart';

class ExperienceFold extends StatelessWidget {
  const ExperienceFold({
    super.key,
  });

  final String jobTitle;
  final String company;
  final String location;
  final String period;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        context.headlineMedium(jobTitle),
        Wrap(
          children: [
            ColoredIconText.lightBlue(Icons.business_center, company),
            ColoredIconText.darkBlue(Icons.place, company),
          ],
        )
      ],
    );
  }
}
