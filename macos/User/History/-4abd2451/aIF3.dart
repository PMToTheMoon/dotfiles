enum RecordStatus {
  @JsonValue('NOUVEAU')
  fresh,
  @JsonValue('BROUILLON')
  draft,
  @JsonValue('EN_ATTENTE_RDV')

  @JsonValue('EN_ATTENTE_PAIEMENT_FUTUR')

  @JsonValue('EN_ATTENTE_PAIEMENT')

  @JsonValue('EN_ATTENTE_TELECHARGEMENT')

  @JsonValue('EN_ATTENTE_RAPPORT')

  @JsonValue('EN_ATTENTE_RAPPORT_COMPLET')

  @JsonValue('EN_ATTENTE_RAPPORT_MEDECIN')

  @JsonValue('EN_ATTENTE_AVIS_MEDECIN')

  @JsonValue('CLOTURE')

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
