// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:models/models.dart';

export 'csp_user_record_view_child_record.dart';

part 'record_view.freezed.dart';
part 'record_view.g.dart';

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
    @JsonKey(name: 'dateCreation', fromJson: dateTimeFromJson)
        required DateTime dateCreated,
    @JsonKey(name: 'dateMiseAJour', fromJson: nullableDateTimeFromJson)
        required DateTime? lastModified,
    @JsonKey(name: 'patient') required String patientId,
    @JsonKey(name: 'patientNom') required String patientLastName,
    @JsonKey(name: 'patientPrenom') required String patientFirstName,
    @JsonKey(name: 'type') required RecordType recordType,
    @JsonKey(name: 'motif') String? recordTypeComplement,
    @JsonKey(name: 'dossiersEnfants', toJson: anyListToJson)
        List<CspUserRecordViewChildRecord>? childRecords,
  }) = CspUserRecordView;

  const factory RecordView.patientRecord({
    @JsonKey(name: 'dossierReference') required String id,
    @JsonKey(name: 'statut') required RecordStatus status,
    @JsonKey(name: 'prioriteMedecin') required RecordPriority doctorPriority,
    @JsonKey(name: 'prioritePrestataire')
        required RecordPriority providerPriority,
    @JsonKey(name: 'medecin') required String doctorId,
    @JsonKey(name: 'dateCreation', fromJson: dateTimeFromJson)
        required DateTime dateCreated,
    @JsonKey(name: 'dateMiseAJour', fromJson: nullableDateTimeFromJson)
        required DateTime? lastModified,
    @JsonKey(name: 'type') required RecordType recordType,
    @JsonKey(name: 'motif') String? recordTypeComplement,
  }) = PatientRecordView;

  factory RecordView.fromJson(Map<String, dynamic> json) =>
      _$RecordViewFromJson(json);
}

DateTime dateTimeFromJson(int epoch) =>
    DateTime.fromMillisecondsSinceEpoch(epoch);

DateTime? nullableDateTimeFromJson(int? epoch) =>
    epoch != null ? DateTime.fromMillisecondsSinceEpoch(epoch) : null;
