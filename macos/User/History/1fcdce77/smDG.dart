import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:models/models.dart';
import 'package:zanalys/auth/auth.dart';
import 'package:zanalys/record/hub/bloc/hub_bloc.dart';

import '../bloc/observations_bloc.dart';
import 'new_complement_card/new_complement_form.dart';
import 'new_complement_card/new_complement_form_card.dart';

class ComplementFormCard extends StatelessWidget {
  const ComplementFormCard({
    super.key,
  });

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

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const PaddingSmaller.top(),
      child: NewComplementFormCard(
        onFormSubmitted: onSubmitted,
      ),
    );
  }
}
