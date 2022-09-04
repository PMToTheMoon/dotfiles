import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:intersperse/intersperse.dart';
import 'package:models/models.dart';
import 'package:zanalys/record/hub/bloc/hub_bloc.dart';
import 'package:zanalys/record/hub/observations/bloc/observations_bloc.dart';
import 'package:zanalys/record/hub/observations/widgets/complete_record_bottom_sheet.dart';

import 'observation_card/observation_card.dart';

class ObservationCards extends StatelessWidget {
  const ObservationCards({
    required this.hub,
    required this.avatarCacheService,
    super.key,
  });

  final HubReady hub;
  final AvatarCacheService avatarCacheService;

  ObservationCardData? _buildRapportFromRecord(Record record) {
    return record.rapportGeneral?.toObservationCardData(
      record: record,
      avatarCacheService: avatarCacheService,
    );
  }

  ObservationCardData? _buildConclusionFormRecord(Record effectiveRecord) {
    return effectiveRecord.toConclusionCardData(
      avatarCacheService: avatarCacheService,
    );
  }

  Iterable<ObservationCardData>? _buildComplementsForRecord(Record record) {
    return record.complements?.map(
      (complement) => complement.toComplementObservationCardData(
        rootRecord: hub.rootRecord,
        cacheService: GetIt.I.get(),
        // record: hub.record,
      ),
    );
  }

  Iterable<ObservationCardData> _buildObservationCardDataFromRecord(
    Record record,
  ) {
    return <ObservationCardData?>[
      _buildRapportFromRecord(record),
      ...?_buildComplementsForRecord(record),
      for (final Record child in record.childRecords ?? [])
        ..._buildObservationCardDataFromRecord(child)
    ].whereType<ObservationCardData>();
  }

  Iterable<Widget> _buildObservationCardsFromData(
    List<ObservationCardData> data,
  ) {
    data.sort((a, b) => a.date.compareTo(b.date));
    return data.map((d) => ObservationCard(d));
  }

  @override
  Widget build(BuildContext context) {
    final observationsData = _buildObservationsDataFromRecord(hub.rootRecord);
    final recordCards =
        _buildObservationCardsFromData(observationsData.toList())
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
