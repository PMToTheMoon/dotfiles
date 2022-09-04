import 'package:common/common.dart';
import 'package:flutter/material.dart';

export 'new_observation_form.dart';

class NewObservationCard extends StatelessWidget {
  const NewObservationCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const BorderContainer(
      padding: PaddingSmall.vertical(),
      borderRadius: Dimensions.borderRadiusSmaller,
      child: NewObservationForm(),
    );
  }
}
