import 'package:common/common.dart';
import 'package:models/models.dart';
import '../models.dart';

extension RecordToConclusionCardData on Record {
  ObservationCardData? toConclusionCardData({
    // required Record effectiveRecord,
    required AvatarCacheService avatarCacheService,
  }) {
    late final ObservationCardDoctor doctor;
    if (creatorId == providerId) {
      doctor = provider(cacheService: avatarCacheService);
    } else {
      doctor = creator(cacheService: avatarCacheService);
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

  ObservationCardDataPart? conclusion() {
    if (doctorAdvice != null) {
      return ObservationCardDataPart.patientObservation(
        observation: doctorAdvice!,
      );
    }
    return null;
  }
}
