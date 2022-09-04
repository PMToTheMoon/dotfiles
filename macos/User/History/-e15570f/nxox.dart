import 'package:flutter/material.dart';
import 'package:neat/neat.dart';

class CandidateEducationsView extends StatelessWidget {
  static CandidateEducationsView builder(BuildContext context) =>
      const CandidateEducationsView();

  const CandidateEducationsView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        context.headline1('Background'),
      ],
    );
  }
}
