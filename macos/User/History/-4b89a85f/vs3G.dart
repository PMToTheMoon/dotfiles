// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:models/models.dart';
import 'package:models/src/record/record_reason.dart';

import 'doctor_service_request.dart';

part 'new_record.freezed.dart';
part 'new_record.g.dart';

@freezed
class NewRecord with _$NewRecord {
  const NewRecord._();

  const factory NewRecord({
    /// Reference of patient account
    @JsonKey(name: 'patient') required String patientId,

    /// Reference of medecin creator account
    @JsonKey(name: 'medecin') required String creatorId,

    /// Reference of delegate creator account (maybe null)
    @JsonKey(name: 'delegue') String? delegateId,
    required RecordType type,
    @JsonKey(name: 'motif') required RecordReason reason,
    @JsonKey(name: 'accordPatient') required bool patientConsent,
    @JsonKey(name: 'accordPersonneConfiance')
        required bool trustedPersonConsent,

    //prenomPersConfiance: string;
    @JsonKey(name: 'prenomPersConfiance')
        required String trustedPersonFirstName,

    //nomPersConfiance: string;
    @JsonKey(name: 'nomPersConfiance') required String trustedPersonLastName,

    // lienParentePersConfiance: string;
    @JsonKey(name: 'lienParentePersConfiance')
        required String trustedPersonFamilyLink,
    @JsonKey(name: 'prestataires')
        required List<DoctorServiceRequest> serviceRequests,
  }) = _NewRecord;

  Map<String, dynamic> toJson() => _$NewRecordToJson(this);
}
