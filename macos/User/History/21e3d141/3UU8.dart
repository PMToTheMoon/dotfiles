import 'package:flutter/material.dart';
import 'package:zanalys/record/hub/observations/bloc/observations_bloc.dart';

class ObservationCards extends StatelessWidget {
  const ObservationCards({
    super.key,
  });

  Future<void> _onCompleteRecordPressed() async {
    final ObservationsBloc bloc = context.read();

    // context.read<HubBloc>().add(const HubEvent.fetchRequested());

    await context.showCompleteRecordBottomSheet(
      onConsultationRapportPressed: () => bloc.add(
        const ObservationsEvent.addComplementButtonPressed(
            complementType: ComplementType.crConsultation),
      ),
      onExamRapportPressed: () => bloc.add(
        const ObservationsEvent.addComplementButtonPressed(
            complementType: ComplementType.exam),
      ),
      onFollowUpPressed: () => bloc.add(
        const ObservationsEvent.addComplementButtonPressed(
            complementType: ComplementType.recordFollowup),
      ),
      onCloseRecordPressed: () {},
    );
  }

  ObservationCardData? _buildRapportForRecord(Record record) {
    return record.rapportGeneral?.toObservationCardData(
      record: record,
      avatarCacheService: avatarCacheService,
    );
  }

  Iterable<ObservationCardData>? _buildComplementsForRecord(Record record) {
    return record.complements?.map(
      (complement) => complement.toComplementObservationCardData(
        parentRecord: widget.hubState.record,
        cacheService: GetIt.I.get(),
        // record: widget.hubState.record,
      ),
    );
  }

  Iterable<ObservationCardData> _buildObservationsDataFromRecord(
    Record record,
  ) {
    final rapport = _buildRapportForRecord(record);
    final complements = _buildComplementsForRecord(record);
    return [
      if (rapport != null) rapport,
      ...?complements,
      for (final Record child in record.childRecords ?? [])
        ...?_buildComplementsForRecord(child)
    ];
  }

  Iterable<Widget> _buildObservationCardsFromData(
    List<ObservationCardData> data,
  ) {
    data.sort((a, b) => a.date.compareTo(b.date));
    return data.map((d) => ObservationCard(d));
  }

  @override
  Widget build(BuildContext context) {
    final recordCards = _buildObservationCardsFromData(observationsData)
        .intersperse(const SpaceSmaller.h());
    if (observationsData.isEmpty) return const SizedBox.shrink();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SpaceSmaller(),
        ...recordCards,
      ],
    );
  }
}
