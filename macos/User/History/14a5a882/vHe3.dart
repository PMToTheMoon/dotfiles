import 'package:common/common.dart';
import 'package:common/src/widgets/widgets.dart';
import 'package:models/models.dart';

extension RapportMultiToCard on RapportMulti {
  ObservationCardData toObservationCardData({
    required Record record,
    required AvatarCacheService avatarCacheService,
  }) {
    final doctor = record.provider(cacheService: cacheService);
    final date = dateFromEpochOrPlaceholder(sentDate);
    final List<ObservationCardDataPart> parts = <ObservationCardDataPart?>[
      _hiddenObservation(),
      _patientObservation(),
      _medicalHistory(),
      _symptoms(),
      _treatments(),
    ].whereType<ObservationCardDataPart>().toList();

    return ObservationCardData(
      doctor: doctor,
      date: date,
      parts: parts,
    );
  }
}
