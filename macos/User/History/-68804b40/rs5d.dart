import 'package:bonemeal/bonemeal.dart';
import 'package:ipr/ipr.dart';
import 'package:model_generators/model_generators.dart';

final recordFields = <Field>{
  jsonField(
    'id',
    refer('String'),
    name: 'reference',
  ),
  jsonField(
    'type',
    refer('RecordType', 'package:models/models.dart'),
    name: 'type',
  ),
  jsonField(
    'title',
    refer('String?'),
    name: 'titre',
  ),
  jsonField(
    'creationDate',
    refer('String?'),
    name: 'dateCreation',
  ),
  jsonField(
    'creatorId',
    refer('String'),
    name: 'createur',
  ),
  jsonField(
    'shareDate',
    refer('int?'),
    name: 'dateEnvoi',
  ),
  jsonField(
    'lastModifiedDate',
    refer('int?'),
    name: 'dateMiseAJour',
  ),
  jsonField(
    'closingDate',
    refer('int?'),
    name: 'dateCloture',
  ),
  jsonField(
    'assignmentDate',
    refer('int?'),
    name: 'dateAffectation',
  ),
  jsonField(
    'patientConsent',
    refer('bool?'),
    name: 'accordPatient',
  ),
  jsonField(
    'trustedPersonConsent',
    refer('bool?'),
    name: 'accordPersonneConfiance',
  ),
  jsonField(
    'trustedPersonFirstName',
    refer('String?'),
    name: 'prenomPersConfiance',
  ),
  jsonField(
    'trustedPersonLastName',
    refer('String?'),
    name: 'nomPersConfiance',
  ),
  jsonField(
    'trustedPersonFamilyLink',
    refer('String?'),
    name: 'lienParentePersConfiance',
  ),
  jsonField(
    'status',
    refer('RecordStatus', 'package:models/models.dart'),
    name: 'statut',
  ),
  jsonField(
    'patientStatus',
    refer('RecordStatus?', 'package:models/models.dart'),
    name: 'statutPatient',
  ),
  jsonField(
    'doctorProviderStatus',
    refer('RecordStatus?', 'package:models/models.dart'),
    name: 'statutPrestataire',
  ),
  nestedJsonField(
    'patient',
    refer('Patient', 'package:models/models.dart'),
    name: 'patient',
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
    'delegateDoctor',
    refer('String?'),
    name: 'delegue',
  ),
  jsonField(
    'delegateDoctorLastName',
    refer('String?'),
    name: 'delegueNom',
  ),
  jsonField(
    'delegateDoctorFirstName',
    refer('String?'),
    name: 'deleguePrenom',
  ),
  jsonField(
    'establishmentId',
    refer('String?'),
    name: 'etablissement',
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
  jsonField(
    'providerConsultationId',
    refer('int?'),
    name: 'prestataireRdvId',
  ),
  nestedJsonField(
    'providerConsultation',
    refer('ProviderConsultation?', 'package:models/models.dart'),
    name: 'prestataireRdv',
  ),
  nestedJsonField(
    'doctorSpecialty',
    refer('DoctorSpecialty?', 'package:models/models.dart'),
    name: 'medecinSpecialite',
  ),
  nestedJsonField(
    'providerSpecialty',
    refer('DoctorSpecialty?', 'package:models/models.dart'),
    name: 'prestataireSpecialite',
  ),
  jsonField(
    'paymentDate',
    refer('int?'),
    name: 'datePaiement',
  ),
  jsonField(
    'groupAffectation',
    refer('NetworkAffectation?', 'package:models/models.dart'),
    name: 'groupeAffectation',
  ),
  jsonField(
    'doctorAdvice',
    refer('String?'),
    name: 'avisMedecin',
  ),
  jsonField(
    'doctorAdviceDate',
    refer('int?'),
    name: 'dateAvisMedecin',
  ),
  jsonField(
    'rapportValidationDate',
    refer('int?'),
    name: 'dateValidationRapport',
  ),
  jsonField(
    'toValidateOrReturn',
    refer('String?'),
    name: 'toValidateOrToReturn',
  ),
  jsonField(
    'paymentCode',
    refer('String?'),
    name: 'paymentCode',
  ),
  jsonField(
    'billedToEstablishment',
    refer('bool?'),
    name: 'billedToEstablishment',
  ),
  jsonField(
    'urgent',
    refer('bool?'),
    name: 'urgent',
  ),
  nestedJsonField(
    'consultationBill',
    refer('ConsultationBill?', 'package:models/models.dart'),
    name: 'commandeRdv',
  ),
  jsonField(
    'reason',
    refer('RecordReason?'),
    name: 'motif',
  ),
  jsonField(
    'reasonText',
    refer('String?'),
    name: 'motifText',
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
    'serviceType',
    refer('ServiceType?', 'package:models/models.dart'),
    name: 'typePrestation',
  ),
  jsonField(
    'parentRecordId',
    refer('String?'),
    name: 'dossierParentReference',
  ),
  nestedJsonField(
    'medicalInformationGeneral',
    refer(
      'MedicalInformationGeneral?',
      'medical_information/medical_information_general.dart',
    ),
    name: 'informationMedicaleMulti',
  ),
  nestedJsonListField(
    'complements',
    refer(
      'List<RecordComplement>?',
      'record_complement.dart',
    ),
    name: 'complements',
  ),
  nestedJsonField(
    'rapportMulti',
    refer('RapportMulti?', 'package:models/models.dart'),
    name: 'rapportMulti',
  ),
  nestedJsonListField(
    'childRecords',
    refer('List<Record>?'),
    name: 'childRecords',
  ),
};

// final record = JsonSerializable('Record', recordFields);
final record = Union(
  className: '_Record',
  // typePrefix: '_',
  // typeSuffix: 'Data',
  types: {
    UnionType(
      '_Record',
      recordFields,
    ),
  },
);
