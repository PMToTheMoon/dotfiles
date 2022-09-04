import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:models/models.dart';
import 'package:zanalys/auth/auth.dart';
import 'package:zanalys/record/hub/bloc/hub_bloc.dart';
import 'package:zanalys/record/hub/observations/widgets/close_complement_card/close_complement_card.dart';
import 'package:zanalys/record/hub/observations/widgets/close_complement_card/close_complement_form.dart';

import '../bloc/observations_bloc.dart';
import 'new_complement_card/new_complement_form.dart';
import 'new_complement_card/new_complement_form_card.dart';

class ComplementFormCard extends StatelessWidget {
  const ComplementFormCard({
    required this.complementType,
    super.key,
  });

  final ComplementType complementType;

  void onSubmitted(BuildContext context, NewComplementFormSnapshot snapshot) {
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

  void onCloseComplementSubmitted(
    BuildContext context,
    CloseComplementFormSnapshot snapshot,
  ) {
    final recordId = context.read<HubBloc>().recordId;
    final userId = context.read<AuthBloc>().userId;
    context
        .read<ObservationsBloc>()
        .add(ObservationsEvent.complementFormSubmitted(
          complement: com,
        ));
  }

  @override
  Widget build(BuildContext context) {
    late final Widget card;
    if (complementType == ComplementType.close)
      // ignore: curly_braces_in_flow_control_structures
      card = CloseComplementFormCard();
    else {
      card = NewComplementFormCard(
        onFormSubmitted: (snapshot) => onSubmitted(context, snapshot),
      );
    }

    return Padding(
      padding: const PaddingSmaller.top(),
      child: card,
    );
  }
}
