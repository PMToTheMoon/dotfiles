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
        jsonField(
          'creationDate',
          refer('int?'),
          name: 'dateCreation',
        ),
        jsonField(
          'lastModifiedDate',
          refer('int?'),
          name: 'dateMiseAJour',
        ),
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
        jsonField(
          'doctorId',
          refer('String?'),
          name: 'medecin',
        ),
        jsonField(
          'doctorLastName',
          refer('String?'),
          name: 'medecinNom',
        ),
        jsonField(
          'doctorFirstName',
          refer('String?'),
          name: 'medecinPrenom',
        ),
        jsonField(
          'providerId',
          refer('String?'),
          name: 'prestataire',
        ),
        jsonField(
          'providerLastName',
          refer('String?'),
          name: 'prestataireNom',
        ),
        jsonField(
          'providerFirstName',
          refer('String?'),
          name: 'prestatairePrenom',
        ),
        jsonField('dossiersEnfants', refer('BaseDossierDto')),
      },
    });
  }
}
