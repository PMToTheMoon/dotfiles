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
    final doctor = _doctor(cacheService: cacheService, userId: userId);
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

extension RecordComplementToCardData on RecordComplement {
  ObservationCardDataPart? _patientObservation() {
    if (patientObservation != null && patientObservation?.isNotEmpty == true) {
      return ObservationCardDataPart.patientObservation(
        observation: patientObservation!,
      );
    }
    return null;
  }

  ObservationCardDataPart? _hiddenObservation() {
    if (hiddenObservation != null && hiddenObservation?.isNotEmpty == true) {
      return ObservationCardDataPart.hiddenObservation(
        observation: hiddenObservation!,
      );
    }
    return null;
  }

  ObservationCardData toComplementObservationCardData({
    required AvatarCacheService cacheService,
  }) {
    final doctor = ObservationCardDoctor(
      avatar: cacheService.avatar(creatorId),
      firstName: 'unknown',
      lastName: 'unknown',
      subtitle: 'unknown',
      specialty: 'unknown',
    );
    final date = _dateFromEpochOrPlaceholder(lastModificationDate);
    final List<ObservationCardDataPart> parts = <ObservationCardDataPart?>[
      _hiddenObservation(),
      _patientObservation(),
    ].whereType<ObservationCardDataPart>().toList();

    return ObservationCardData(doctor: doctor, date: date, parts: parts);
  }
}

DateTime _dateFromEpochOrPlaceholder(int? timestamp) {
  if (timestamp != null) {
    return DateTime.fromMillisecondsSinceEpoch(timestamp);
  }
  return DateTime(404);
}
