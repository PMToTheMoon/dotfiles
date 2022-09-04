import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:models/models.dart';
import 'package:models/src/utils/utils.dart';

part 'csp_user_record_view_child_record.freezed.dart';
part 'csp_user_record_view_child_record.g.dart';

@freezed
class CspUserRecordViewChildRecord with _$CspUserRecordViewChildRecord {
  const CspUserRecordViewChildRecord._();

  const factory CspUserRecordViewChildRecord({
    @JsonKey(name: 'dossierReference') required String id,
    @JsonKey(name: 'dossierParentReference') String? parentRecordId,
    @JsonKey(name: 'type') required RecordType type,
    @JsonKey(name: 'motif') RecordReason? reason,
    @JsonKey(name: 'prioriteMedecin') required RecordPriority priorityForDoctor,
    @JsonKey(name: 'prioritePrestataire') RecordPriority? priorityForProvider,
    @JsonKey(name: 'dateCreation') int? creationDate,
    @JsonKey(name: 'dateMiseAJour') int? lastModifiedDate,
    @JsonKey(name: 'typePrestation') ServiceType? serviceType,
    @JsonKey(name: 'statut') required RecordStatus status,
    @JsonKey(name: 'medecin') String? doctorId,
    @JsonKey(name: 'medecinNom') String? doctorLastName,
    @JsonKey(name: 'medecinPrenom') String? doctorFirstName,
    @JsonKey(name: 'prestataire') String? providerId,
    @JsonKey(name: 'prestataireNom') String? providerLastName,
    @JsonKey(name: 'prestatairePrenom') String? providerFirstName,
    @JsonKey(name: 'dossiersEnfants', toJson: anyListToJson)
        List<CspUserRecordViewChildRecord>? childRecords,
  }) = _CspUserRecordViewChildRecord;

  factory CspUserRecordViewChildRecord.fromJson(Map<String, dynamic> json) =>
      _$CspUserRecordViewChildRecordFromJson(json);
}
