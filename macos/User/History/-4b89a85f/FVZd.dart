import 'package:built_value/built_value.dart';

abstract class NewRecord with Built<> {
    // Reference of patient account
    patient: string;
    // Reference of medecin creator account
    medecin: string;
    // Reference of delegate creator account (maybe null)
    delegue: string;

    type: EnumDossierType;
    motif: EnumDossierMotif;

    accordPatient: boolean;
    accordPersonneConfiance: boolean;
    nomPersConfiance: string;
    prenomPersConfiance: string;
    lienParentePersConfiance: string;

    prestataires: InitDossierPrestataireDto[];
}
