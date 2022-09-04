import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:models/models.dart';
import 'package:zanalys/auth/auth.dart';
import 'package:zanalys/record/hub/bloc/hub_bloc.dart';
import 'package:zanalys/record/hub/observations/bloc/observations_bloc.dart';

import 'new_complement_form.dart';

class NewComplementFormCard extends StatefulWidget {
  const NewComplementFormCard({
    super.key,
    this.request,
    this.onShared,
  });

  final Widget? request;
  final ValueChanged<NewComplementFormSnapshot>? onShared;

  @override
  State<NewComplementFormCard> createState() => _NewComplementFormCardState();
}

class _NewComplementFormCardState extends State<NewComplementFormCard> {
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
      final recordId = context.read<HubBloc>().recordId;
      final userId = context.read<AuthBloc>().userId;
      final complement = RecordComplement(
        id: 0,
        recordId: recordId,
        patientObservation: snapshot.patientReason,
        hiddenObservation: snapshot.hiddenReason,
        creationDate: null,
        lastModificationDate: null,
        creatorId: userId!,
        type: ComplementType.exam,
      );
      context
          .read<ObservationsBloc>()
          .add(ObservationsEvent.complementFormSubmitted(
            complement: complement,
          ));
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
