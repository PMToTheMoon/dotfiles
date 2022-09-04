import 'package:common/common.dart';
import 'package:models/models.dart';

extension RecordToObservationCard on Record {
  bool isCreator(String userId) {
    return doctorId == userId;
  }

  ObservationCardDoctor _doctor({
    required String userId,
    required AvatarCacheService cacheService,
  }) {
    if (isCreator(userId)) {
      return ObservationCardDoctor(
        avatar: cacheService.avatar(userId),
        firstName: doctorFirstName ?? 'unknown',
        lastName: doctorLastName ?? 'unknown',
        subtitle: establishmentId ?? 'unknown',
        specialty: 'unknown',
      );
    } else {
      return ObservationCardDoctor(
        avatar: cacheService.avatar(providerId ?? 'unknown'),
        firstName: providerFirstName ?? 'unknown',
        lastName: providerLastName ?? 'unknown',
        subtitle: establishmentId ?? 'unknown',
        specialty: providerSpecialty?.displayFr ?? 'unknown',
      );
    }
  }

  DateTime _date() {
    final int? lastModificationTimestamp = lastModifiedDate;
    if (lastModificationTimestamp != null) {
      return DateTime.fromMillisecondsSinceEpoch(lastModificationTimestamp);
    }
    return DateTime(404);
  }

  ObservationCardDataPart? _hiddenObservation() {
    if (reasonText != null) {
      return ObservationCardDataPart.hiddenObservation(
        observation: reasonText!,
      );
    }
    return null;
  }

  ObservationCardDataPart? _patientObservation() {
    if (medicalInformationMulti != null &&
        medicalInformationMulti?.comment != null) {
      return ObservationCardDataPart.patientObservation(
        observation: medicalInformationMulti!.comment!,
      );
    }
    return null;
  }

  ObservationCardDataPart? _medicalHistory() {
    if (medicalInformationMulti?.medicalContext?.medicalHistory != null) {
      return ObservationCardDataPart.medicalHistory(
        items:
            medicalInformationMulti?.medicalContext?.medicalHistory?.toSet() ??
                {},
      );
    }
    return null;
  }

  ObservationCardData toInitialObservationCardData({
    required String userId,
    required AvatarCacheService cacheService,
  }) {
    final doctor = _doctor(cacheService: cacheService, userId: userId);
    final date = _date();
    final List<ObservationCardDataPart> parts = <ObservationCardDataPart?>[
      _hiddenObservation(),
      _patientObservation(),
      _medicalHistory()
    ].whereType<ObservationCardDataPart>().toList();

    return ObservationCardData(
      doctor: doctor,
      date: date,
      parts: parts,
    );
  }

  ObservationCardData toObservationCardData({
    required String userId,
    required AvatarCacheService cacheService,
  }) {
    final doctor = _doctor(cacheService: cacheService, userId: userId);
    final date = _date();
    final parts = <ObservationCardDataPart>[];

    return ObservationCardData(doctor: doctor, date: date, parts: parts);
  }
}
