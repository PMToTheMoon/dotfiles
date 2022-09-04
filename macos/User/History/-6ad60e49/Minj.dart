import 'package:bonemeal/bonemeal.dart';
import 'package:model_generators/model_generators.dart';

class RecordBase extends Seed {
  @override
  MetaObject grow(BuildContext context) {
    return Freezed(className: 'RecordBase', types: {
      '': {
        jsonField('id', refer('String'), name: 'dossierReference'),
        jsonField('id', refer('String'), name: 'dossierParentReference'),
        jsonField(
          'type',
          refer('RecordType', 'package:models/models.dart'),
          name: 'type',
        ),
        jsonField(
          'reason',
          refer('RecordReason?'),
          name: 'motif',
        ),
        jsonField(
          'priorityForDoctor',
          refer('RecordPriority', 'package:models/models.dart'),
          name: 'prioriteMedecin',
        ),
        jsonField(
          'priorityForProvider',
          refer('RecordPriority?', 'package:models/models.dart'),
          name: 'prioritePrestataire',
        ),
        jsonField('dateCreation', refer('int?')),
        jsonField('dateMiseAJour', refer('int?')),
        jsonField(
          'serviceType',
          refer('ServiceType?', 'package:models/models.dart'),
          name: 'typePrestation',
        ),
        jsonField(
          'status',
          refer('RecordStatus', 'package:models/models.dart'),
          name: 'statut',
        ),
        jsonField('medecin', refer('String')),
        jsonField('medecinNom', refer('String')),
        jsonField('medecinPrenom', refer('String')),
        jsonField('prestataire', refer('String')),
        jsonField('prestataireNom', refer('String')),
        jsonField('prestatairePrenom', refer('String')),
        jsonField('dateEnvoiPrestataireMedecin', refer('int?')),
        jsonField('dossiersEnfants', refer('BaseDossierDto')),
      },
    });
  }
}
