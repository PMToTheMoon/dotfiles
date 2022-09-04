import 'package:common/common.dart';
import 'package:flutter/material.dart';

export 'new_observation_form.dart';

class NewObservationCard extends StatelessWidget {
  const NewObservationCard({
    super.key,
    this.request,
  });

  final Widget? request;

  @override
  Widget build(BuildContext context) {
    return BorderContainer(
      padding: const PaddingSmaller.vertical(),
      borderRadius: Dimensions.borderRadiusSmaller,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (request != null)
            Padding(
              padding: const EdgeInsets.only(
                left: Dimensions.paddingSmaller,
                right: Dimensions.paddingSmaller,
                bottom: Dimensions.paddingMedium,
              ),
              child: request,
            ),
          const NewObservationForm(),
          const SpaceMedium.h(),
          Padding(
            padding: const PaddingSmaller.horizontal(),
            child: ElevatedButton(
              onPressed: () {},
              child: Text("Partager"),
            ),
          ),
        ],
      ),
    );
  }
}
