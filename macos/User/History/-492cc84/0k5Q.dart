import 'package:freezed_annotation/freezed_annotation.dart';

part 'record_status.g.dart';

@JsonEnum()
enum RecordStatus {
  @JsonValue('NOUVEAU')
  fresh(1),

  @JsonValue('BROUILLON')
  draft(0),

  @JsonValue('EN_ATTENTE_RDV')
  waitingConsultation(2),

  @JsonValue('EN_ATTENTE_PAIEMENT_FUTUR')
  waitingFuturePayment(3),

  @JsonValue('EN_ATTENTE_PAIEMENT')
  waitingPayment(3),

  @JsonValue('EN_ATTENTE_TELECHARGEMENT')
  waitingDownload(4),

  @JsonValue('EN_ATTENTE_RAPPORT')
  waitingReport(5),

  @JsonValue('EN_ATTENTE_RAPPORT_COMPLET')
  waitingCompleteReport(5),

  @JsonValue('EN_ATTENTE_RAPPORT_MEDECIN')
  waitingDoctorReport(5),

  @JsonValue('EN_ATTENTE_AVIS_MEDECIN')
  waitingDoctorOpinion(5),

  @JsonValue('CLOTURE')
  closed(6),

  @JsonValue('CLOTURE_ANOMALIE')
  closedError(6),

  @JsonValue('ABANDONNE_PRESTATAIRE')
  canceledByProvider(6),

  @JsonValue('REFUSE_PRESTATAIRE')
  refusedByProvider(6),

  @JsonValue('REFUSE_MEDECIN')
  canceledByDoctor(6),

  @JsonValue('DETRUIT')
  deleted(6);

  const RecordStatus(this.step);

  final int step;

  double get progress => step / 6;

  bool get isDraft => this == RecordStatus.fresh || this == RecordStatus.draft;

  bool get isDone =>
      this == RecordStatus.deleted ||
      this == RecordStatus.canceledByDoctor ||
      this == RecordStatus.canceledByProvider ||
      this == RecordStatus.closedError ||
      this == RecordStatus.closed;
}
