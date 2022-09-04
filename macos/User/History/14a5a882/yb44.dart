import 'package:common/src/widgets/widgets.dart';
import 'package:models/models.dart';

extension RapportMultiToCard on RapportMulti {
  ObservationCardData toObservationCardData({
    required Record record,
  }) {
    final doctor = creator(cacheService: cacheService);
    final date = _date();
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
