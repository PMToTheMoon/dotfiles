import 'package:common/common.dart';
import 'package:models/models.dart';

extension RecordToObservationCard on Record {
  bool isCreator(String userId) {
    return doctorId == userId;
  }

  ObservationCardDoctor _creator({
    required String userId,
    required AvatarCacheService cacheService,
  }) {
    final userId = delegateDoctor ?? doctorId ?? creatorId;
    return ObservationCardDoctor(
      avatar: cacheService.avatar(userId),
      firstName: delegateDoctorFirstName ?? doctorFirstName ?? 'unknown',
      lastName: delegateDoctorLastName ?? doctorLastName ?? 'unknown',
      subtitle: establishmentId ?? 'unknown',
      specialty: doctorSpecialty?.displayFr ?? 'unknown',
    );
  }

  ObservationCardDoctor _provider({
    required String userId,
    required AvatarCacheService cacheService,
  }) {
    return ObservationCardDoctor(
      avatar: cacheService.avatar(providerId ?? 'unknown'),
      firstName: providerFirstName ?? 'unknown',
      lastName: providerLastName ?? 'unknown',
      subtitle: establishmentId ?? 'unknown',
      specialty: providerSpecialty?.displayFr ?? 'unknown',
    );
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
    if (medicalInformationGeneral != null &&
        medicalInformationGeneral?.comment != null) {
      return ObservationCardDataPart.patientObservation(
        observation: medicalInformationGeneral!.comment!,
      );
    }
    return null;
  }

  ObservationCardDataPart? _medicalHistory() {
    final items = medicalInformationGeneral?.medicalContext?.medicalHistoryText;
    if (items?.isNotEmpty == true) {
      return ObservationCardDataPart.medicalHistory(
        items: items!.toSet(),
      );
    }
    return null;
  }

  ObservationCardDataPart? _symptoms() {
    final items = medicalInformationGeneral?.medicalContext?.symptomsText;
    if (items?.isNotEmpty == true) {
      return ObservationCardDataPart.symptoms(
        items: items!.toSet(),
      );
    }
    return null;
  }

  ObservationCardDataPart? _treatments() {
    final items = medicalInformationGeneral?.treatments;
    if (items?.isNotEmpty == true) {
      return ObservationCardDataPart.treatments(
        items: items!.toSet(),
      );
    }
    return null;
  }

  ObservationCardData toInitialObservationCardData({
    required String userId,
    required AvatarCacheService cacheService,
  }) {
    final doctor = _creator(cacheService: cacheService, userId: userId);
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
