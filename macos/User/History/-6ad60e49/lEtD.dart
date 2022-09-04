import 'package:bonemeal/bonemeal.dart';
import 'package:model_generators/model_generators.dart';

class RecordBase extends Seed {
  @override
  MetaObject grow(BuildContext context) {
    return Freezed(className: 'RecordBase', types: {
      '': {
        jsonField('dossierReference', refer('String')),
        jsonField('dossierParentReference', refer('String')),
        jsonField('type', refer('EnumDossierType')),
        jsonField('motif', refer('EnumDossierMotif')),
        jsonField('dateCreation', refer('int?')),
        jsonField('dateMiseAJour', refer('int?')),
        jsonField('prioriteMedecin', refer('EnumDossierPriorite')),
        jsonField('prioritePrestataire', refer('EnumDossierPriorite')),
        jsonField('typePrestation', refer('EnumPrestationType')),
        jsonField('statut', refer('EnumDossierStatut')),
        jsonField('medecin', refer('String')),
        jsonField('medecinNom', refer('String')),
        jsonField('medecinPrenom', refer('String')),
        jsonField('prestataire', refer('String')),
        jsonField('prestataireNom', refer('String')),
        jsonField('prestatairePrenom', refer('String')),
        jsonField('dateEnvoiPrestataireMedecin', refer('Number')),
        jsonField('rdvDateRdv', refer('Number')),
        jsonField('rdvHeureDebut', refer('Number')),
        jsonField('rdvDateHeureDebut', refer('Number')),
        jsonField('dossiersEnfants', refer('BaseDossierDto')),
      },
    });
  }
}
