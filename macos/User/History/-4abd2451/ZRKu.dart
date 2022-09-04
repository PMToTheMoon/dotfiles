import 'package:freezed_annotation/freezed_annotation.dart';

enum RecordStatus {
  @JsonValue('NOUVEAU')
  fresh,

  @JsonValue('BROUILLON')
  draft,

  @JsonValue('EN_ATTENTE_RDV')
  waitingConsultation,

  @JsonValue('EN_ATTENTE_PAIEMENT_FUTUR')
  waitingFuturePayment,

  @JsonValue('EN_ATTENTE_PAIEMENT')
  waitingPayment,

  @JsonValue('EN_ATTENTE_TELECHARGEMENT')
  waitingDownload,

  @JsonValue('EN_ATTENTE_RAPPORT')
  waitingReport,

  @JsonValue('EN_ATTENTE_RAPPORT_COMPLET')
  waitingCompleteReport,

  @JsonValue('EN_ATTENTE_RAPPORT_MEDECIN')
  waitingDoctorReport,

  @JsonValue('EN_ATTENTE_AVIS_MEDECIN')
  waitingDoctorOpinion,

  @JsonValue('CLOTURE')
  closed,

  @JsonValue('CLOTURE_ANOMALIE')
  closedError,

  @JsonValue('ABANDONNE_PRESTATAIRE')
  canceledByProvider,

  @JsonValue('REFUSE_PRESTATAIRE')
  refusedByProvider,

  @JsonValue('REFUSE_MEDECIN')
  canceledByDoctor,

  @JsonValue('DETRUIT')
  deleted,
}

enum RecordPriority {
  @JsonValue('LOWEST')
  low,

  @JsonValue('MEDIUM')
  medium,

  @JsonValue('HIGH')
  hight,
}

@freezed
class Record with _$Record {
  const Record._();

  const factory Record.cspUserRecord({
    RecordStatus status,
    RecordPriority doctorPriority,
    RecordPriority providerPriority,
    String doctorID,
  }) = CspUserRecord;
}
