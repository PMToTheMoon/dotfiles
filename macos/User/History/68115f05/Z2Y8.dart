// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:models/models.dart';

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
    @JsonKey(name: 'dossierReference') required String id,
    @JsonKey(name: 'statut') required RecordStatus status,
    @JsonKey(name: 'prioriteMedecin') required RecordPriority doctorPriority,
    @JsonKey(name: 'prioritePrestataire')
        required RecordPriority providerPriority,
    @JsonKey(name: 'medecin') required String doctorId,
    @JsonKey(name: 'dateCreation', fromJson: _dateTimeFromJson)
        required DateTime dateCreated,
    @JsonKey(name: 'dateMiseAJour', fromJson: _nullableDateTimeFromJson)
        required DateTime? lastModified,
    @JsonKey(name: 'patient') required String patientId,
    @JsonKey(name: 'patientNom') required String patientLastName,
    @JsonKey(name: 'patientPrenom') required String patientFirstName,
    @JsonKey(name: 'type') required RecordType recordType,
    @JsonKey(name: 'motif') String? recordTypeComplement,
  }) = CspUserRecord;

  const factory Record.patientRecord({
    @JsonKey(name: 'dossierReference') required String id,
    @JsonKey(name: 'statut') required RecordStatus status,
    @JsonKey(name: 'prioriteMedecin') required RecordPriority doctorPriority,
    @JsonKey(name: 'prioritePrestataire')
        required RecordPriority providerPriority,
    @JsonKey(name: 'medecin') required String doctorId,
    @JsonKey(name: 'dateCreation', fromJson: _dateTimeFromJson)
        required DateTime dateCreated,
    @JsonKey(name: 'dateMiseAJour', fromJson: _nullableDateTimeFromJson)
        required DateTime? lastModified,
    @JsonKey(name: 'type') required String recordType,
    @JsonKey(name: 'motif') String? recordTypeComplement,
  }) = PatientRecord;

  factory Record.fromJson(Map<String, dynamic> json) => _$RecordFromJson(json);
}

DateTime _dateTimeFromJson(int epoch) =>
    DateTime.fromMillisecondsSinceEpoch(epoch);

DateTime? _nullableDateTimeFromJson(int? epoch) =>
    epoch != null ? DateTime.fromMillisecondsSinceEpoch(epoch) : null;
