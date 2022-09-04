import 'package:common/common.dart';
import 'package:flutter/material.dart';

class ObservationCard extends StatelessWidget {
  const ObservationCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BorderContainer(
      padding: PaddingSmall.all(),
      child: const Text('ObservationCard'),
    );
  }
}
