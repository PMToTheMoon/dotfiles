import 'package:common/common.dart';
import 'package:models/models.dart';
import 'package:quiver/strings.dart';
import '../models.dart';

extension RecordToConclusionCardData on Record {
  ObservationCardData? toConclusionCardData({
    // required Record effectiveRecord,
    required AvatarCacheService avatarCacheService,
  }) {
    final conclusion = conclusionPart();

    if (conclusion == null) return null;

    late final ObservationCardDoctor doctor;
    if (creatorId == providerId) {
      doctor = provider(cacheService: avatarCacheService);
    } else {
      doctor = creator(cacheService: avatarCacheService);
    }

    return ObservationCardData(
      doctor: doctor,
      date: dateFromEpochOrPlaceholder(closingDate),
      parts: [conclusion],
    );
  }

  ObservationCardDataPart? conclusionPart() {
    if (isNotBlank(doctorAdvice)) {
      return ObservationCardDataPart.close(
        text: doctorAdvice!,
      );
    }
    return null;
  }
}
