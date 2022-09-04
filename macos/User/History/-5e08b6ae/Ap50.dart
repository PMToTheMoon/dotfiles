import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:neat/neat.dart';

class ExperienceContextualMenu extends StatelessWidget {
  const ExperienceContextualMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ContextualMenu(
        icon: const Icon(Icons.more_horiz),
        builder: (context, hideMenu) => Column(
              ContextualMenuBoutton(),
            ));
  }
}

class ExperienceHeader extends StatelessWidget {
  const ExperienceHeader({
    super.key,
    required this.jobTitle,
    required this.company,
    required this.location,
    required this.period,
  });

  final String jobTitle;
  final String company;
  final String location;
  final String period;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(children: [
          Expanded(child: context.headlineMedium(jobTitle)),
        ]),
        Wrap(
          children: [
            ColoredIconText.lightBlue(Icons.business_center, company),
            ColoredIconText.darkBlue(Icons.place, location),
            ColoredIconText.darkBlue(Icons.calendar_month, period),
          ],
        )
      ],
    );
  }
}
