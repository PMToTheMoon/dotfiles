import 'package:common/common.dart';
import 'package:models/models.dart';
import '../models.dart';

extension RecordComplementToCardData on RecordComplement {
  ObservationCardData toClotureCardData({
    required Record parentRecord,
    required AvatarCacheService cacheService,
  }) {
    late final ObservationCardDoctor doctor;
    if (creatorId == parentRecord.providerId) {
      doctor = parentRecord.provider(cacheService: cacheService);
    } else {
      doctor = parentRecord.creator(cacheService: cacheService);
    }

    final date = dateFromEpochOrPlaceholder(lastModificationDate);
    final List<ObservationCardDataPart> parts = <ObservationCardDataPart?>[
      _conclusion(),
    ].whereType<ObservationCardDataPart>().toList();

    return ObservationCardData(
      doctor: doctor,
      date: date,
      parts: parts,
    );
  }

  ObservationCardDataPart? _conclusion() {
    if (patientObservation != null && patientObservation?.isNotEmpty == true) {
      return ObservationCardDataPart.patientObservation(
        observation: patientObservation!,
      );
    }
    return null;
  }
}
