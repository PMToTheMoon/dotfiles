import 'package:bonemeal/bonemeal.dart';
import 'package:model_generators/model_generators.dart';

final recordComplement = JsonSerializable('RecordComplement', {
  jsonField(
    'id',
    refer('int'),
    name: 'identifiant',
  ),
  jsonField(
    'recordId',
    refer('String'),
    name: 'dossierReference',
  ),
  jsonField(
    'patientObservation',
    refer('String?'),
    name: 'commentaireVisible',
  ),
  jsonField(
    'hiddenObservation',
    refer('String?'),
    name: 'commentaireMasque',
  ),
  jsonField(
    'creationDate',
    refer('int'),
    name: 'dateCreation',
  ),
  jsonField(
    'lastModifictaionDate',
    refer('int'),
    name: 'dateModification',
  ),
  jsonField(
    'creatorId',
    refer('String'),
    name: 'createur',
  ),
  jsonField(
    'type',
    refer('ComplementType', 'package:models/models.dart'),
    name: 'complementType',
  ),
});
