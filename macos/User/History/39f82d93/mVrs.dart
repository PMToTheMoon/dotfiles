import 'package:common/common.dart';
import 'package:flutter/material.dart';

export 'new_observation_form.dart';

class NewObservationCard extends StatefulWidget {
  NewObservationCard({
    super.key,
    this.request,
    this.onShared,
  });

  final Widget? request;
  final ValueChanged<NewObservationFormSnapshot>? onShared;

  @override
  State<NewObservationCard> createState() => _NewObservationCardState();
}

class _NewObservationCardState extends State<NewObservationCard> {
  final NewObservationFormController controller =
      NewObservationFormController();

  void _onSharePressed() {
    if (controller.validate()) {
      widget.onShared?.call(controller.snapshot());
    }
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Scrollable.ensureVisible(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BorderContainer(
      padding: const PaddingSmaller.vertical(),
      borderRadius: Dimensions.borderRadiusSmaller,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (widget.request != null)
            Padding(
              padding: const EdgeInsets.only(
                left: Dimensions.paddingSmaller,
                right: Dimensions.paddingSmaller,
                bottom: Dimensions.paddingMedium,
              ),
              child: widget.request,
            ),
          NewObservationForm(
            controller: controller,
          ),
          const SpaceMedium.h(),
          Padding(
            padding: const PaddingSmaller.horizontal(),
            child: ElevatedButton(
              onPressed: _onSharePressed,
              child: Text(context.l10n.obs_share_button),
            ),
          ),
        ],
      ),
    );
  }
}
