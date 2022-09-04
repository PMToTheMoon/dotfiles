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
      synthesisPart(),
      commentPart(),
    ].whereType<ObservationCardDataPart>().toList();

    return ObservationCardData(
      doctor: doctor,
      date: date,
      parts: parts,
    );
  }

  ObservationCardData toCloseCardData({
    required Record record,
    required AvatarCacheService avatarCacheService,
  }) {
    final doctor = record.provider(cacheService: avatarCacheService);
    final date = dateFromEpochOrPlaceholder(sentDate);
    final List<ObservationCardDataPart> parts = <ObservationCardDataPart?>[
      synthesisPart(),
      commentPart(),
    ].whereType<ObservationCardDataPart>().toList();

    return ObservationCardData(
      doctor: doctor,
      date: date,
      parts: parts,
    );
  }

  ObservationCardDataPart? conclusion() {
    if (isNotBlank(text)) {
      return ObservationCardDataPart.hiddenObservation(
        observation: text!,
      );
    }
    return null;
  }

  ObservationCardDataPart? synthesisPart() {
    final text = synthesis ?? teleExpertiseSynthesis;
    if (isNotBlank(text)) {
      return ObservationCardDataPart.hiddenObservation(
        observation: text!,
      );
    }
    return null;
  }

  ObservationCardDataPart? commentPart() {
    final text = comment ?? teleExpertiseComment;
    if (isNotBlank(text)) {
      return ObservationCardDataPart.patientObservation(
        observation: text!,
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
