import 'package:bonemeal/bonemeal.dart';
import 'package:model_generators/model_generators.dart';

class RecordBase extends Seed {
  @override
  MetaObject grow(BuildContext context) {
    return Freezed(className: 'RecordBase', types: {
    '': {
    dossierReference: string;
    dossierParentReference: string;
    type: EnumDossierType;
    motif: EnumDossierMotif;
    dateCreation: number; // Unix timestamp
    dateMiseAJour: number; // Unix timestamp
    prioriteMedecin: EnumDossierPriorite;
    prioritePrestataire: EnumDossierPriorite;
    typePrestation: EnumPrestationType;
    statut: EnumDossierStatut;
    medecin: string;
    medecinNom: string;
    medecinPrenom: string;
    prestataire: string;
    prestataireNom: string;
    prestatairePrenom: string;
    dateEnvoiPrestataireMedecin: number; // Unix timestamp
    rdvDateRdv: number; // Unix timestamp
    rdvHeureDebut: number; // Minutes since midnight
    rdvDateHeureDebut: number; // Unix timestamp
    dossiersEnfants: BaseDossierDto[];

    },

    });
  }
}
