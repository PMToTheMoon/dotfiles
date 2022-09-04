import 'package:common/common.dart';
import 'package:models/models.dart';
import 'package:quiver/strings.dart';

import '../models.dart';

extension RapportMultiToCard on RapportGeneral {
  ObservationCardData toObservationCardData({
    required Record record,
    required AvatarCacheService avatarCacheService,
  }) {
    final doctor = record.provider(cacheService: avatarCacheService);
    final date = dateFromEpochOrPlaceholder(sentDate);
    final List<ObservationCardDataPart> parts = <ObservationCardDataPart?>[
      rapport(),
    ].whereType<ObservationCardDataPart>().toList();

    return ObservationCardData(
      doctor: doctor,
      date: date,
      parts: parts,
    );
  }

  ObservationCardDataPart? rapport() {
    if (isNotBlank(synthesis)) {
      return ObservationCardDataPart.hiddenObservation(
        observation: synthesis ?? teleExpertiseSynthesis,
      );
    }
    return null;
  }

  ObservationCardDataPart? appointment() {
    if (sentDate != null && teleExpertiseSentDate == null) {
      return const ObservationCardDataPart.appointment(
          type: ServiceType.inPerson);
    } else {
      return const ObservationCardDataPart.appointment(
          type: ServiceType.teleExpertise);
    }
  }
}
