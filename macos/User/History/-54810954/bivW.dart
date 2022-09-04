// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'record.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CspUserRecord _$$CspUserRecordFromJson(Map<String, dynamic> json) =>
    _$CspUserRecord(
      id: json['dossierReference'] as String,
      status: $enumDecode(_$RecordStatusEnumMap, json['statut']),
      doctorPriority:
          $enumDecode(_$RecordPriorityEnumMap, json['prioriteMedecin']),
      providerPriority:
          $enumDecode(_$RecordPriorityEnumMap, json['prioritePrestataire']),
      doctorId: json['medecin'] as String,
      dateCreated: _dateTimeFromJson(json['dateCreation'] as int),
      lastModified: _nullableDateTimeFromJson(json['dateMiseAJour'] as int?),
      patientId: json['patient'] as String,
      patientLastName: json['patientNom'] as String,
      patientFirstName: json['patientPrenom'] as String,
      recordType: json['type'] as String,
      recordTypeComplement: json['motif'] as String?,
    );

Map<String, dynamic> _$$CspUserRecordToJson(_$CspUserRecord instance) =>
    <String, dynamic>{
      'dossierReference': instance.id,
      'statut': _$RecordStatusEnumMap[instance.status],
      'prioriteMedecin': _$RecordPriorityEnumMap[instance.doctorPriority],
      'prioritePrestataire': _$RecordPriorityEnumMap[instance.providerPriority],
      'medecin': instance.doctorId,
      'dateCreation': instance.dateCreated.toIso8601String(),
      'dateMiseAJour': instance.lastModified?.toIso8601String(),
      'patient': instance.patientId,
      'patientNom': instance.patientLastName,
      'patientPrenom': instance.patientFirstName,
      'type': instance.recordType,
      'motif': instance.recordTypeComplement,
    };

const _$RecordStatusEnumMap = {
  RecordStatus.fresh: 'NOUVEAU',
  RecordStatus.draft: 'BROUILLON',
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
