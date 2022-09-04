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
  deleted;

  RecordStatus(int step);

  final step;

  double get priority => 
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
