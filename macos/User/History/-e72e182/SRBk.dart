import 'package:common/common.dart';
import 'package:models/models.dart';
import '../models.dart';

extension RecordToObservationCard on Record {
  bool isCreator(String userId) {
    return doctorId == userId;
  }

  ObservationCardDoctor creator({
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

  ObservationCardDoctor provider({
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
    return dateFromEpochOrPlaceholder(lastModificationTimestamp);
  }

  ObservationCardDataPart? medicalInformation() {
    final Set<String?> items = {
      medicalInformationGeneral?.weight?.unit('Kg'),
      medicalInformationGeneral?.height?.unit('cm'),
      medicalInformationGeneral?.arterialPressurePas?.unit('PAS'),
      medicalInformationGeneral?.arterialPressurePad?.unit('PAD'),
      medicalInformationGeneral?.temperature?.unit('°c'),
      medicalInformationGeneral?.heartRate?.unit('bpm'),
    };
    if (reasonText != null) {
      return ObservationCardDataPart.medicalInformation(
        items: items.whereType<String>().toSet(),
      );
    }
    return null;
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
    required AvatarCacheService cacheService,
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

extension _DisplayWithUnit on num {
  String unit(String unit) => '${this} $unit';
  // String get kg => '$this kg';
  // String get cm => '$this cm';
  // String get bpm => '$this bpm';
}
