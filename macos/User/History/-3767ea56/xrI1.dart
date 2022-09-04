import 'package:bonemeal/bonemeal.dart';
import 'package:ipr/ipr.dart';
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
  nestedJsonField(
    'consultationType',
    refer('ConsultationType', 'consultation_type.dart'),
    name: 'consultationType',
  ),
  jsonField(
    'color',
    refer('String'),
    name: 'couleur',
  ),
  jsonField(
    'date',
    refer('int?'),
    name: 'dateRdv',
  ),
  jsonField(
    'consultationDateMoment',
    refer('int?'),
    name: 'moment',
  ),
  jsonField(
    'dateTime',
    refer('int?'),
    name: 'dateHeureDebut',
  ),
  jsonField(
    'startHour',
    refer('int?'),
    name: 'heureDebut',
  ),
  jsonField(
    'endHour',
    refer('int?'),
    name: 'heureFin',
  ),
  jsonField(
    'note',
    refer('String'),
    name: 'note',
  ),
  jsonField(
    'creationDate',
    refer('int?'),
    name: 'creationDate',
  ),
  jsonField(
    'creatorId',
    refer('String'),
    name: 'creatorUserId',
  ),
  jsonField(
    'status',
    refer('ConsultationStatus', 'consultation_status.dart'),
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
    refer('RecordType', 'package:models/models.dart'),
    name: 'dossierType',
  ),
  jsonField(
    'recordReason',
    refer('RecordReason', 'package:models/models.dart'),
    name: 'dossierMotif',
  ),
  jsonField(
    'recordStatus',
    refer('RecordStatus', 'package:models/models.dart'),
    name: 'dossierStatut',
  ),
  jsonField(
    'recordCreationDate',
    refer('int?'),
    name: 'dossierDateCreation',
  ),
  jsonField(
    'recordServiceType',
    refer('ServiceType', 'package:models/models.dart'),
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
