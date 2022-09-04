// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'record.freezed.dart';
part 'record.g.dart';

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

  final step;

  double get priority => step / 6;
}

enum RecordPriority {
  @JsonValue('LOWEST')
  low,

  @JsonValue('MEDIUM')
  medium,

  @JsonValue('HIGH')
  hight;

  bool get isHightPriority => this != RecordPriority.low;
}

@freezed
class Record with _$Record {
  const Record._();

  const factory Record.cspUserRecord({
    @JsonKey(name: 'statut') required RecordStatus status,
    @JsonKey(name: 'prioriteMedecin') required RecordPriority doctorPriority,
    @JsonKey(name: 'prioritePrestataire')
        required RecordPriority providerPriority,
    @JsonKey(name: 'medecin') required String doctorID,
    @JsonKey(name: 'dateMiseAJour') required DateTime lastModified,
  }) = CspUserRecord;

  factory Record.fromJson(Map<String, dynamic> json) => _$RecordFromJson(json);
}
