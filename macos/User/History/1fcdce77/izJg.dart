class ComplementFormCard extends StatelessWidget {
  const ComplementFormCard({
    super.key,
});

  @override
  Widget build(BuildContext context) {
    return     void onSubmitted(NewComplementFormSnapshot snapshot) {
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

    return Padding(
      padding: const PaddingSmaller.top(),
      child: NewComplementFormCard(
        onFormSubmitted: onSubmitted,
      ),
    );
  }
}