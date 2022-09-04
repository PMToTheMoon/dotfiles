import 'package:common/common.dart';
import 'package:models/models.dart';
import '../models.dart';

extension RecordToConclusionCardData on Record {
  ObservationCardData? toConclusionCardData({
    // required Record effectiveRecord,
    required AvatarCacheService avatarCacheService,
  }) {
    final conclusion = conclusionPart();

    late final ObservationCardDoctor doctor;
    if (creatorId == providerId) {
      doctor = provider(cacheService: avatarCacheService);
    } else {
      doctor = creator(cacheService: avatarCacheService);
    }

    return ObservationCardData(
      doctor: doctor,
      date: displayedDate(),
      parts: parts,
    );
  }

  ObservationCardDataPart? conclusionPart() {
    if (doctorAdvice != null) {
      return ObservationCardDataPart.patientObservation(
        observation: doctorAdvice!,
      );
    }
    return null;
  }
}
