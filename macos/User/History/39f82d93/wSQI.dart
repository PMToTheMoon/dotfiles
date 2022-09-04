import 'package:common/common.dart';
import 'package:flutter/material.dart';

export 'new_observation_form.dart';

class NewObservationCard extends StatelessWidget {
  NewObservationCard({
    super.key,
    this.request,
    this.onShared,
  });

  final Widget? request;
  final ValueChanged<NewObservationFormSnapshot>? onShared;
  final NewObservationFormController controller =
      NewObservationFormController();

  void _onSharePressed() {
    if (controller.validate()) {
      onShared?.call(controller.snapshot());
    }
  }

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
              onPressed: _onSharePressed,
              child: Text("Partager"),
            ),
          ),
        ],
      ),
    );
  }
}
