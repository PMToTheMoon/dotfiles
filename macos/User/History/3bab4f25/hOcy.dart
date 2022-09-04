// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:models/models.dart';

part 'record.freezed.dart';
part 'record.g.dart';

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
    @JsonKey(name: 'type') required RecordType recordType,
    @JsonKey(name: 'motif') String? recordTypeComplement,
  }) = PatientRecord;

  factory Record.fromJson(Map<String, dynamic> json) => _$RecordFromJson(json);
}

DateTime _dateTimeFromJson(int epoch) =>
    DateTime.fromMillisecondsSinceEpoch(epoch);

DateTime? _nullableDateTimeFromJson(int? epoch) =>
    epoch != null ? DateTime.fromMillisecondsSinceEpoch(epoch) : null;
