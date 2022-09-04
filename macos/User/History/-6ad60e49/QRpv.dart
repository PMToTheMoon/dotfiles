import 'package:bonemeal/bonemeal.dart';
import 'package:model_generators/model_generators.dart';

class RecordBase extends Seed {
  @override
  MetaObject grow(BuildContext context) {
    return Freezed(className: 'RecordBase', types: {
    '': {
    jsonField('dossierReference', refer('string'),
    jsonField('dossierParentReference', refer('string'),
    jsonField('type', refer('EnumDossierType'),
    jsonField('motif', refer('EnumDossierMotif'),
    jsonField('dateCreation', refer('number'),
    jsonField('dateMiseAJour', refer('number'),
    jsonField('prioriteMedecin', refer('EnumDossierPriorite'),
    jsonField('prioritePrestataire', refer('EnumDossierPriorite'),
    jsonField('typePrestation', refer('EnumPrestationType'),
    jsonField('statut', refer('EnumDossierStatut'),
    jsonField('medecin', refer('string'),
    jsonField('medecinNom', refer('string'),
    jsonField('medecinPrenom', refer('string'),
    jsonField('prestataire', refer('string'),
    jsonField('prestataireNom', refer('string'),
    jsonField('prestatairePrenom', refer('string'),
    jsonField('dateEnvoiPrestataireMedecin', refer('number'),
    jsonField('rdvDateRdv', refer('number'),
    jsonField('rdvHeureDebut', refer('number'),
    jsonField('rdvDateHeureDebut', refer('number'),
    jsonField('dossiersEnfants', refer('BaseDossierDto'),

    },

    });
  }
}
