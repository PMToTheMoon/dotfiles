enum RecordStatus {
  @JsonValue('NOUVEAU')
  fresh,
  @JsonValue('BROUILLON')
  draft,
  @JsonValue('EN_ATTENTE_RDV')
  waitingConsultation,
  
  @JsonValue('EN_ATTENTE_PAIEMENT_FUTUR'),
  waitingFuturePayment,

  @JsonValue('EN_ATTENTE_PAIEMENT'),
  waitingPayment,

  @JsonValue('EN_ATTENTE_TELECHARGEMENT'),
  waitingDownload,

  @JsonValue('EN_ATTENTE_RAPPORT'),
  waitingReport,

  @JsonValue('EN_ATTENTE_RAPPORT_COMPLET'),
  waitingCompleteReport,

  @JsonValue('EN_ATTENTE_RAPPORT_MEDECIN'),
  waitingDoctorReport,

  @JsonValue('EN_ATTENTE_AVIS_MEDECIN'),
  waitingDoctorOpinion,

  @JsonValue('CLOTURE'),
  closed,

  @JsonValue('CLOTURE_ANOMALIE')

  @JsonValue('ABANDONNE_PRESTATAIRE')

  @JsonValue('REFUSE_PRESTATAIRE')

  @JsonValue('REFUSE_MEDECIN')

  @JsonValue('DETRUIT')

}

@freezed
class Record with _$Record {
  const Record._();

  const factory Record.cspUserRecord({
    RecordStatus status,
  }) = CspUserRecord;
}
