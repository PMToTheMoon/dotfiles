

// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:models/models.dart';
import 'package:models/src/record/record_reason.dart';

part 'new_record.freezed.dart';
part 'new_record.g.dart';

@freezed
class NewRecord with _$NewRecord {
  const NewRecord._();

  const factory NewRecord({
    /// Reference of patient account
    @JsonKey(name: 'patient')
    final String patientId,

    /// Reference of medecin creator account
    @JsonKey(name: 'medecin')
    final String creatorId,
    
    /// Reference of delegate creator account (maybe null)
    @JsonKey(name: 'delegue')
    final String? delegateId,

    final RecordType type,
    
    @JsonKey(name: 'motif')
    final RecordReason reason,
    
    @JsonKey(name: 'accordPatient')
    final bool patientConsent,
  
    @JsonKey(name: 'accordPersonneConfiance')
    final bool  trustedPersonConsent,
    
    //prenomPersConfiance: string;
    @JsonKey(name: 'prenomPersConfiance')
    final String trustedPersonFirstName,

    //nomPersConfiance: string;
    @JsonKey(name: 'nomPersConfiance')
    final String trustedPersonLastName,

    // lienParentePersConfiance: string;
    @JsonKey(name: '')
    final String trustedPersonFamilyLink,

    @JsonKey(name: '')
    prestataires: InitDossierPrestataireDto[];
  }) = _NewRecord;
}
