

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
  
    // accordPersonneConfiance: boolean;
    final bool  trustedPersonConsent,
    
    //nomPersConfiance: string;
    final String trustedPersonfisrtName,

    //nomPersConfiance: string;
    final String trustedPersonLastName,

    // lienParentePersConfiance: string;
    final String trustedPersonFamilyLink,

    prestataires: InitDossierPrestataireDto[];
  }) = _NewRecord;
}
