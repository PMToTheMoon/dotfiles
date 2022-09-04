enum RecordStatus {
  NOUVEAU,
  BROUILLON,
  EN_ATTENTE_RDV,
  EN_ATTENTE_PAIEMENT_FUTUR,
  EN_ATTENTE_PAIEMENT,
  EN_ATTENTE_TELECHARGEMENT,
  EN_ATTENTE_RAPPORT,
  EN_ATTENTE_RAPPORT_COMPLET,
  EN_ATTENTE_RAPPORT_MEDECIN,
  EN_ATTENTE_AVIS_MEDECIN,
  CLOTURE,
  CLOTURE_ANOMALIE,
  ABANDONNE_PRESTATAIRE,
  REFUSE_PRESTATAIRE,
  REFUSE_MEDECIN,
  DETRUIT,
}

@freezed
class Record with _$Record {
  const Record._();

  const factory Record.cspUserRecord({
    RecordStatus status,
  }) = CspUserRecord;
}