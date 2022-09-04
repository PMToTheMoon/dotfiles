import 'package:common/common.dart';
import 'package:flutter/material.dart';

export 'new_observation_form.dart';

class NewObservationCard extends StatelessWidget {
  const NewObservationCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BorderContainer(
      padding: const PaddingSmaller.vertical(),
      borderRadius: Dimensions.borderRadiusSmaller,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const NewObservationForm(),
          const SpaceSmall.h(),
          Padding(
            padding: const PaddingSmaller.horizontal(),
            child: ElevatedButton(
              onPressed: () {},
              child: Text("Partager"),
            ),
          )
        ],
      ),
    );
  }
}
