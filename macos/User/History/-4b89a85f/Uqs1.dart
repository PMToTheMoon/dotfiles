import 'package:built_value/built_value.dart';

part 'new_record.freezed.dart';
part 'new_record.g.dart';

@freezed
class NewRecord with _$NewRecord {
  const NewRecord._();

  const factory NewRecord({
        // Reference of patient account
    // patient: string;
    final String patientId,

    // Reference of medecin creator account
    // medecin: string;
    final String creatorId,
    
    // Reference of delegate creator account (maybe null)
    // delegue: string;
    final String? delegateId,

    type: EnumDossierType;
    motif: EnumDossierMotif;

    // accordPatient: boolean;
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
