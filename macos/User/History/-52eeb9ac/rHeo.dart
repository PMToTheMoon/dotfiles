// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'record.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Record _$$_RecordFromJson(Map<String, dynamic> json) => _$_Record(
      id: json['reference'] as String,
      type: $enumDecode(_$RecordTypeEnumMap, json['type']),
      title: json['titre'] as String?,
      creationDate: json['dateCreation'] as String?,
      creatorId: json['createur'] as String,
      shareDate: json['dateEnvoi'] as int?,
      lastModifiedDate: json['dateMiseAJour'] as int?,
      closingDate: json['dateCloture'] as int?,
      assignmentDate: json['dateAffectation'] as int?,
      patientConsent: json['accordPatient'] as bool?,
      trustedPersonConsent: json['accordPersonneConfiance'] as bool?,
      trustedPersonFirstName: json['prenomPersConfiance'] as String?,
      trustedPersonLastName: json['nomPersConfiance'] as String?,
      trustedPersonFamilyLink: json['lienParentePersConfiance'] as String?,
      status: $enumDecode(_$RecordStatusEnumMap, json['statut']),
      patientStatus:
          $enumDecodeNullable(_$RecordStatusEnumMap, json['statutPatient']),
      doctorProviderStatus:
          $enumDecodeNullable(_$RecordStatusEnumMap, json['statutPrestataire']),
      patient: Patient.fromJson(json['patient'] as Map<String, dynamic>),
      doctorId: json['medecin'] as String?,
      doctorLastName: json['medecinNom'] as String?,
      doctorFirstName: json['medecinPrenom'] as String?,
      delegateDoctor: json['delegue'] as String?,
      delegateDoctorLastName: json['delegueNom'] as String?,
      delegateDoctorFirstName: json['deleguePrenom'] as String?,
      establishmentId: json['etablissement'] as String?,
      providerId: json['prestataire'] as String?,
      providerLastName: json['prestataireNom'] as String?,
      providerFirstName: json['prestatairePrenom'] as String?,
      providerConsultationId: json['prestataireRdvId'] as int?,
      providerConsultation: json['prestataireRdv'] == null
          ? null
          : ProviderConsultation.fromJson(
              json['prestataireRdv'] as Map<String, dynamic>),
      doctorSpecialty: json['medecinSpecialite'] == null
          ? null
          : DoctorSpecialty.fromJson(
              json['medecinSpecialite'] as Map<String, dynamic>),
      providerSpecialty: json['prestataireSpecialite'] == null
          ? null
          : DoctorSpecialty.fromJson(
              json['prestataireSpecialite'] as Map<String, dynamic>),
      paymentDate: json['datePaiement'] as int?,
      groupAffectation: $enumDecodeNullable(
          _$NetworkAffectationEnumMap, json['groupeAffectation']),
      doctorAdvice: json['avisMedecin'] as String?,
      doctorAdviceDate: json['dateAvisMedecin'] as int?,
      rapportValidationDate: json['dateValidationRapport'] as String?,
      toValidateOrReturn: json['toValidateOrToReturn'] as String?,
      paymentCode: json['paymentCode'] as String?,
      billedToEstablishment: json['billedToEstablishment'] as bool?,
      urgent: json['urgent'] as bool?,
      consultationBill: json['commandeRdv'] == null
          ? null
          : ConsultationBill.fromJson(
              json['commandeRdv'] as Map<String, dynamic>),
      reason: $enumDecodeNullable(_$RecordReasonEnumMap, json['motif']),
      reasonText: json['motifText'] as String?,
      priorityForDoctor:
          $enumDecode(_$RecordPriorityEnumMap, json['prioriteMedecin']),
      priorityForProvider: $enumDecodeNullable(
          _$RecordPriorityEnumMap, json['prioritePrestataire']),
      serviceType:
          $enumDecodeNullable(_$ServiceTypeEnumMap, json['typePrestation']),
      parentRecordId: json['dossierParentReference'] as String?,
      medicalInformationGeneral: json['informationMedicaleMulti'] == null
          ? null
          : MedicalInformationGeneral.fromJson(
              json['informationMedicaleMulti'] as Map<String, dynamic>),
      complements: (json['complements'] as List<dynamic>?)
          ?.map((e) => RecordComplement.fromJson(e as Map<String, dynamic>))
          .toList(),
      serviceRequested:
          $enumDecodeNullable(_$ServiceTypeEnumMap, json['prestationDemandee']),
      rapportGeneral: json['rapportMulti'] == null
          ? null
          : RapportGeneral.fromJson(
              json['rapportMulti'] as Map<String, dynamic>),
      childRecords: (json['childRecords'] as List<dynamic>?)
          ?.map((e) => Record.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_RecordToJson(_$_Record instance) => <String, dynamic>{
      'reference': instance.id,
      'type': _$RecordTypeEnumMap[instance.type]!,
      'titre': instance.title,
      'dateCreation': instance.creationDate,
      'createur': instance.creatorId,
      'dateEnvoi': instance.shareDate,
      'dateMiseAJour': instance.lastModifiedDate,
      'dateCloture': instance.closingDate,
      'dateAffectation': instance.assignmentDate,
      'accordPatient': instance.patientConsent,
      'accordPersonneConfiance': instance.trustedPersonConsent,
      'prenomPersConfiance': instance.trustedPersonFirstName,
      'nomPersConfiance': instance.trustedPersonLastName,
      'lienParentePersConfiance': instance.trustedPersonFamilyLink,
      'statut': _$RecordStatusEnumMap[instance.status]!,
      'statutPatient': _$RecordStatusEnumMap[instance.patientStatus],
      'statutPrestataire': _$RecordStatusEnumMap[instance.doctorProviderStatus],
      'patient': anyToJson(instance.patient),
      'medecin': instance.doctorId,
      'medecinNom': instance.doctorLastName,
      'medecinPrenom': instance.doctorFirstName,
      'delegue': instance.delegateDoctor,
      'delegueNom': instance.delegateDoctorLastName,
      'deleguePrenom': instance.delegateDoctorFirstName,
      'etablissement': instance.establishmentId,
      'prestataire': instance.providerId,
      'prestataireNom': instance.providerLastName,
      'prestatairePrenom': instance.providerFirstName,
      'prestataireRdvId': instance.providerConsultationId,
      'prestataireRdv': anyToJson(instance.providerConsultation),
      'medecinSpecialite': anyToJson(instance.doctorSpecialty),
      'prestataireSpecialite': anyToJson(instance.providerSpecialty),
      'datePaiement': instance.paymentDate,
      'groupeAffectation':
          _$NetworkAffectationEnumMap[instance.groupAffectation],
      'avisMedecin': instance.doctorAdvice,
      'dateAvisMedecin': instance.doctorAdviceDate,
      'dateValidationRapport': instance.rapportValidationDate,
      'toValidateOrToReturn': instance.toValidateOrReturn,
      'paymentCode': instance.paymentCode,
      'billedToEstablishment': instance.billedToEstablishment,
      'urgent': instance.urgent,
      'commandeRdv': anyToJson(instance.consultationBill),
      'motif': _$RecordReasonEnumMap[instance.reason],
      'motifText': instance.reasonText,
      'prioriteMedecin': _$RecordPriorityEnumMap[instance.priorityForDoctor]!,
      'prioritePrestataire':
          _$RecordPriorityEnumMap[instance.priorityForProvider],
      'typePrestation': _$ServiceTypeEnumMap[instance.serviceType],
      'dossierParentReference': instance.parentRecordId,
      'informationMedicaleMulti': anyToJson(instance.medicalInformationGeneral),
      'complements': anyListToJson(instance.complements),
      'prestationDemandee': _$ServiceTypeEnumMap[instance.serviceRequested],
      'rapportMulti': anyToJson(instance.rapportGeneral),
      'childRecords': anyListToJson(instance.childRecords),
    };

const _$RecordTypeEnumMap = {
  RecordType.general: 'MULTI',
  RecordType.ecg: 'ECG',
  RecordType.polygraphy: 'POLYGRAPHIE',
};

const _$RecordStatusEnumMap = {
  RecordStatus.fresh: 'NOUVEAU',
  RecordStatus.draft: 'BROUILLON',
  RecordStatus.inProgress: 'EN_COURS',
  RecordStatus.waitingInterpretation: 'EN_ATTENTE_INTERPRETATION',
  RecordStatus.waitingConsultation: 'EN_ATTENTE_RDV',
  RecordStatus.waitingFuturePayment: 'EN_ATTENTE_PAIEMENT_FUTUR',
  RecordStatus.waitingPayment: 'EN_ATTENTE_PAIEMENT',
  RecordStatus.waitingDownload: 'EN_ATTENTE_TELECHARGEMENT',
  RecordStatus.waitingReport: 'EN_ATTENTE_RAPPORT',
  RecordStatus.waitingCompleteReport: 'EN_ATTENTE_RAPPORT_COMPLET',
  RecordStatus.waitingDoctorReport: 'EN_ATTENTE_RAPPORT_MEDECIN',
  RecordStatus.waitingDoctorOpinion: 'EN_ATTENTE_AVIS_MEDECIN',
  RecordStatus.closed: 'CLOTURE',
  RecordStatus.closedError: 'CLOTURE_ANOMALIE',
  RecordStatus.canceledByProvider: 'ABANDONNE_PRESTATAIRE',
  RecordStatus.refusedByProvider: 'REFUSE_PRESTATAIRE',
  RecordStatus.canceledByDoctor: 'REFUSE_MEDECIN',
  RecordStatus.deleted: 'DETRUIT',
};

const _$NetworkAffectationEnumMap = {
  NetworkAffectation.network: 'RESEAU',
  NetworkAffectation.zanalys: 'ZANALYS',
};

const _$RecordReasonEnumMap = {
  RecordReason.sport: 'SPORT',
  RecordReason.prescription: 'PRESCRIPTION_MEDICAMENT',
  RecordReason.chestPain: 'DOULEUR_THORACIQUE',
};

const _$RecordPriorityEnumMap = {
  RecordPriority.low: 'LOWEST',
  RecordPriority.medium: 'MEDIUM',
  RecordPriority.hight: 'HIGH',
};

const _$ServiceTypeEnumMap = {
  ServiceType.teleExpertise: 'TE',
  ServiceType.teleConsultation: 'TC',
  ServiceType.inPerson: 'PRESENTIEL',
};
