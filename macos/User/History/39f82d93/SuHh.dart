import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:models/models.dart';
import 'package:zanalys/record/hub/bloc/hub_bloc.dart';
import 'package:zanalys/record/hub/observations/bloc/observations_bloc.dart';

import 'new_complement_form.dart';

class NewObservationCard extends StatefulWidget {
  const NewObservationCard({
    super.key,
    this.request,
    this.onShared,
  });

  final Widget? request;
  final ValueChanged<NewComplementFormSnapshot>? onShared;

  @override
  State<NewObservationCard> createState() => _NewObservationCardState();
}

class _NewObservationCardState extends State<NewObservationCard> {
  final controller = NewComplementFormController();

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
      final snapshot = controller.snapshot();
      final recordId = context
          .read<HubBloc>().recordId;
      final complemnt = RecordComplement(
        id: 0,
        recordId: ,
        patientObservation: null,
        hiddenObservation: null,
        creationDate: null,
        lastModificationDate: null,
        creatorId: null,
      );
      context
          .read<ObservationsBloc>()
          .add(ObservationsEvent.complementFormSubmitted());
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
          NewComplementForm(
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
