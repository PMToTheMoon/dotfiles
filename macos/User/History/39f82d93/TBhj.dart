import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zanalys/record/hub/observations/bloc/observations_bloc.dart';
import 'new_observation_form.dart';

export 'new_observation_form.dart';

class NewObservationCard extends StatefulWidget {
  const NewObservationCard({
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

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Scrollable.ensureVisible(
        context,
        alignment: .125,
        curve: Feel.curveMedium,
        duration: Feel.durationMedium,
      );
    });
  }

  void _onSharePressed() {
    if (controller.validate()) {
      context
          .read<ObservationsBloc>()
          .add(const ObservationsEvent.newObservationShared());
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
