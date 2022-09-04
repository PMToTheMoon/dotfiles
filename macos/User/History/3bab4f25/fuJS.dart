// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:models/models.dart';

part 'record.freezed.dart';
part 'record.g.dart';

@freezed
class RecordView with _$RecordView {
  const RecordView._();

  const factory RecordView.cspUserRecord({
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
  }) = CspUserRecordView;

  const factory RecordView.patientRecord({
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
  }) = PatientRecordView;

  factory Record.fromJson(Map<String, dynamic> json) => _$RecordFromJson(json);
}

DateTime _dateTimeFromJson(int epoch) =>
    DateTime.fromMillisecondsSinceEpoch(epoch);

DateTime? _nullableDateTimeFromJson(int? epoch) =>
    epoch != null ? DateTime.fromMillisecondsSinceEpoch(epoch) : null;
