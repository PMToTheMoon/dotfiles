import 'package:flutter/material.dart';
import 'package:neat/neat.dart';

class CandidateBackgroundView extends StatelessWidget {
  static CandidateBackgroundView builder(BuildContext context) =>
      const CandidateBackgroundView();

  const CandidateBackgroundView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        context.headline1(':)'),
      ],
    );
  }
}
