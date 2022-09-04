extension RecordComplementToCardData on RecordComplement {
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
}
