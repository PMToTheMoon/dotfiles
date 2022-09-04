import 'package:common/common.dart';
import 'package:models/models.dart';
import '../models.dart';

extension RecordToConclusionCardData on Record {
  ObservationCardData toConclusionCardData({
    required Record effectiveRecord,
    required AvatarCacheService cacheService,
  }) {
    late final ObservationCardDoctor doctor;
    if (creatorId == effectiveRecord.providerId) {
      doctor = effectiveRecord.provider(cacheService: cacheService);
    } else {
      doctor = effectiveRecord.creator(cacheService: cacheService);
    }

    final List<ObservationCardDataPart> parts = <ObservationCardDataPart?>[
      _conclusion(),
    ].whereType<ObservationCardDataPart>().toList();

    return ObservationCardData(
      doctor: doctor,
      date: displayedDate(),
      parts: parts,
    );
  }

  ObservationCardDataPart? _conclusion() {
    if (doctorAdvice != null) {
      return ObservationCardDataPart.patientObservation(
        observation: doctorAdvice!,
      );
    }
    return null;
  }
}
