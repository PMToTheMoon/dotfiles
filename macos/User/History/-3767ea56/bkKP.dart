import 'package:bonemeal/bonemeal.dart';
import 'package:model_generators/model_generators.dart';

final providerConsultationFields = {
  jsonField(
    'id',
    refer('int'),
    name: 'identifiant',
  ),
  jsonField(
    'cpsUserId',
    refer('String'),
    name: 'cpsUserId',
  ),
  jsonField(
    'patientId',
    refer('String'),
    name: 'patientUserId',
  ),
  jsonField(
    'consultationType',
    refer('ConsultationType', 'package:models/models.dart'),
    name: 'consultationType',
  ),
  jsonField(
    'color',
    refer('String'),
    name: 'couleur',
  ),
  jsonField(
    'date',
    refer('DateTime'),
    name: 'dateRdv',
  ),
  jsonField(
    'dateRdvMoment',
    refer('DateTime'),
    name: 'moment',
  ),
  jsonField(
    'dateTime',
    refer('DateTime'),
    name: 'dateHeureDebut',
  ),
  jsonField(
    'startHour',
    refer('int'),
    name: 'heureDebut!: number',
  ),
  jsonField(
    'endHour',
    refer('int'),
    name: 'heureFin',
  ),
  jsonField(
    'note',
    refer('String'),
    name: 'note',
  ),
  jsonField(
    'creationDate',
    refer('DateTime'),
    name: 'creationDate',
  ),
  jsonField(
    'creatorId',
    refer('String'),
    name: 'creatorUserId',
  ),
  jsonField(
    'status',
    refer('EnumRdvStatut'),
    name: 'statut',
  ),
  jsonField(
    'reference',
    refer('String'),
    name: 'dossierReference',
  ),
  jsonField(
    'parentRecordId',
    refer('String'),
    name: 'dossierParent',
  ),
  jsonField(
    'recordType',
    refer('RecordType'),
    name: 'dossierType',
  ),
  jsonField(
    'recordReason',
    refer('RecordReason'),
    name: 'dossierMotif',
  ),
  jsonField(
    'recordStatus',
    refer('RecordStatus'),
    name: 'dossierStatut',
  ),
  jsonField('recordCreationDate', refer('DateTime'),
      name: 'dossierDateCreation'),
  jsonField(
    'recordServiceType',
    refer('ServiceType'),
    name: 'dossierTypePrestation',
  ),
  jsonField(
    'cpsUserLastName',
    refer('String'),
    name: 'cpsNom',
  ),
  jsonField(
    'cpsUserFirstName',
    refer('String'),
    name: 'cpsPrenom',
  ),
};

final providerConsultation = JsonSerializable(
  'ProviderConsultation',
  providerConsultationFields,
);
