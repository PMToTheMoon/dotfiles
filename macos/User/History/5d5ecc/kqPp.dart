// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'record_view.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CspUserRecordView _$$CspUserRecordViewFromJson(Map<String, dynamic> json) =>
    _$CspUserRecordView(
      id: json['dossierReference'] as String,
      status: $enumDecode(_$RecordStatusEnumMap, json['statut']),
      doctorPriority:
          $enumDecode(_$RecordPriorityEnumMap, json['prioriteMedecin']),
      providerPriority:
          $enumDecode(_$RecordPriorityEnumMap, json['prioritePrestataire']),
      doctorId: json['medecin'] as String,
      dateCreated: dateTimeFromJson(json['dateCreation'] as int),
      lastModified: _nullableDateTimeFromJson(json['dateMiseAJour'] as int?),
      patientId: json['patient'] as String,
      patientLastName: json['patientNom'] as String,
      patientFirstName: json['patientPrenom'] as String,
      recordType: $enumDecode(_$RecordTypeEnumMap, json['type']),
      recordTypeComplement: json['motif'] as String?,
      childRecords: (json['dossiersEnfants'] as List<dynamic>?)
          ?.map((e) =>
              CspUserRecordViewChildRecord.fromJson(e as Map<String, dynamic>))
          .toList(),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$CspUserRecordViewToJson(_$CspUserRecordView instance) =>
    <String, dynamic>{
      'dossierReference': instance.id,
      'statut': _$RecordStatusEnumMap[instance.status]!,
      'prioriteMedecin': _$RecordPriorityEnumMap[instance.doctorPriority]!,
      'prioritePrestataire':
          _$RecordPriorityEnumMap[instance.providerPriority]!,
      'medecin': instance.doctorId,
      'dateCreation': instance.dateCreated.toIso8601String(),
      'dateMiseAJour': instance.lastModified?.toIso8601String(),
      'patient': instance.patientId,
      'patientNom': instance.patientLastName,
      'patientPrenom': instance.patientFirstName,
      'type': _$RecordTypeEnumMap[instance.recordType]!,
      'motif': instance.recordTypeComplement,
      'dossiersEnfants': anyListToJson(instance.childRecords),
      'runtimeType': instance.$type,
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

const _$RecordPriorityEnumMap = {
  RecordPriority.low: 'LOWEST',
  RecordPriority.medium: 'MEDIUM',
  RecordPriority.hight: 'HIGH',
};

const _$RecordTypeEnumMap = {
  RecordType.general: 'MULTI',
  RecordType.ecg: 'ECG',
};

_$PatientRecordView _$$PatientRecordViewFromJson(Map<String, dynamic> json) =>
    _$PatientRecordView(
      id: json['dossierReference'] as String,
      status: $enumDecode(_$RecordStatusEnumMap, json['statut']),
      doctorPriority:
          $enumDecode(_$RecordPriorityEnumMap, json['prioriteMedecin']),
      providerPriority:
          $enumDecode(_$RecordPriorityEnumMap, json['prioritePrestataire']),
      doctorId: json['medecin'] as String,
      dateCreated: dateTimeFromJson(json['dateCreation'] as int),
      lastModified: _nullableDateTimeFromJson(json['dateMiseAJour'] as int?),
      recordType: $enumDecode(_$RecordTypeEnumMap, json['type']),
      recordTypeComplement: json['motif'] as String?,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$PatientRecordViewToJson(_$PatientRecordView instance) =>
    <String, dynamic>{
      'dossierReference': instance.id,
      'statut': _$RecordStatusEnumMap[instance.status]!,
      'prioriteMedecin': _$RecordPriorityEnumMap[instance.doctorPriority]!,
      'prioritePrestataire':
          _$RecordPriorityEnumMap[instance.providerPriority]!,
      'medecin': instance.doctorId,
      'dateCreation': instance.dateCreated.toIso8601String(),
      'dateMiseAJour': instance.lastModified?.toIso8601String(),
      'type': _$RecordTypeEnumMap[instance.recordType]!,
      'motif': instance.recordTypeComplement,
      'runtimeType': instance.$type,
    };
