import 'package:common/common.dart';
import 'package:models/models.dart';
import '../models.dart';

extension RecordComplementToCardData on RecordComplement {
  ObservationCardData toComplementObservationCardData({
    required Record rootRecord,
    required AvatarCacheService cacheService,
  }) {
    late final ObservationCardDoctor doctor;
    if (creatorId == rootRecord.providerId) {
      doctor = rootRecord.provider(cacheService: cacheService);
    } else {
      doctor = rootRecord.creator(cacheService: cacheService);
    }

    final date = dateFromEpochOrPlaceholder(lastModificationDate);
    final List<ObservationCardDataPart> parts = <ObservationCardDataPart?>[
      _hiddenObservation(),
      _patientObservation(),
    ].whereType<ObservationCardDataPart>().toList();

    return ObservationCardData(
      doctor: doctor,
      date: date,
      parts: parts,
    );
  }

  ObservationCardDataPart? _patientObservation() {
    if (patientObservation != null && patientObservation?.isNotEmpty == true) {
      return ObservationCardDataPart.patientObservation(
        observation: patientObservation!,
      );
    }
    return null;
  }

  ObservationCardDataPart? _hiddenObservation() {
    if (hiddenObservation != null && hiddenObservation?.isNotEmpty == true) {
      return ObservationCardDataPart.hiddenObservation(
        observation: hiddenObservation!,
      );
    }
    return null;
  }
}
