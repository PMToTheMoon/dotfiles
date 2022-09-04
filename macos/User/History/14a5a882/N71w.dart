import 'package:common/common.dart';
import 'package:models/models.dart';
import 'package:quiver/strings.dart';

extension RapportMultiToCard on RapportMulti {
  ObservationCardDataPart? rapport() {
    if (isNotBlank(synthesis)) {
      return ObservationCardDataPart.rapport(observation: synthesis!);
    }
    return null;
  }

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
}
