import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:models/models.dart';
import 'package:models/src/utils/utils.dart';
import 'medical_information/medical_information_general.dart';
import 'record_complement.dart';
part 'record.freezed.dart';
part 'record.g.dart';

@freezed
class Record with _$Record {
  const factory Record.Record(
      {@JsonKey(name: 'reference')
          required String id,
      @JsonKey(name: 'type')
          required RecordType type,
      @JsonKey(name: 'titre')
          String? title,
      @JsonKey(name: 'dateCreation')
          String? creationDate,
      @JsonKey(name: 'createur')
          required String creatorId,
      @JsonKey(name: 'dateEnvoi')
          int? shareDate,
      @JsonKey(name: 'dateMiseAJour')
          int? lastModifiedDate,
      @JsonKey(name: 'dateCloture')
          int? closingDate,
      @JsonKey(name: 'dateAffectation')
          int? assignmentDate,
      @JsonKey(name: 'accordPatient')
          bool? patientConsent,
      @JsonKey(name: 'accordPersonneConfiance')
          bool? trustedPersonConsent,
      @JsonKey(name: 'prenomPersConfiance')
          String? trustedPersonFirstName,
      @JsonKey(name: 'nomPersConfiance')
          String? trustedPersonLastName,
      @JsonKey(name: 'lienParentePersConfiance')
          String? trustedPersonFamilyLink,
      @JsonKey(name: 'statut')
          required RecordStatus status,
      @JsonKey(name: 'statutPatient')
          RecordStatus? patientStatus,
      @JsonKey(name: 'statutPrestataire')
          RecordStatus? doctorProviderStatus,
      @JsonKey(name: 'patient', toJson: anyToJson)
          required Patient patient,
      @JsonKey(name: 'medecin')
          String? doctorId,
      @JsonKey(name: 'medecinNom')
          String? doctorLastName,
      @JsonKey(name: 'medecinPrenom')
          String? doctorFirstName,
      @JsonKey(name: 'delegue')
          String? delegateDoctor,
      @JsonKey(name: 'delegueNom')
          String? delegateDoctorLastName,
      @JsonKey(name: 'deleguePrenom')
          String? delegateDoctorFirstName,
      @JsonKey(name: 'etablissement')
          String? establishmentId,
      @JsonKey(name: 'prestataire')
          String? providerId,
      @JsonKey(name: 'prestataireNom')
          String? providerLastName,
      @JsonKey(name: 'prestatairePrenom')
          String? providerFirstName,
      @JsonKey(name: 'prestataireRdvId')
          int? providerConsultationId,
      @JsonKey(name: 'prestataireRdv', toJson: anyToJson)
          ProviderConsultation? providerConsultation,
      @JsonKey(name: 'medecinSpecialite', toJson: anyToJson)
          DoctorSpecialty? doctorSpecialty,
      @JsonKey(name: 'prestataireSpecialite', toJson: anyToJson)
          DoctorSpecialty? providerSpecialty,
      @JsonKey(name: 'datePaiement')
          int? paymentDate,
      @JsonKey(name: 'groupeAffectation')
          NetworkAffectation? groupAffectation,
      @JsonKey(name: 'avisMedecin')
          String? doctorAdvice,
      @JsonKey(name: 'dateAvisMedecin')
          int? doctorAdviceDate,
      @JsonKey(name: 'dateValidationRapport')
          int? rapportValidationDate,
      @JsonKey(name: 'toValidateOrToReturn')
          String? toValidateOrReturn,
      @JsonKey(name: 'paymentCode')
          String? paymentCode,
      @JsonKey(name: 'billedToEstablishment')
          bool? billedToEstablishment,
      @JsonKey(name: 'urgent')
          bool? urgent,
      @JsonKey(name: 'commandeRdv', toJson: anyToJson)
          ConsultationBill? consultationBill,
      @JsonKey(name: 'motif')
          RecordReason? reason,
      @JsonKey(name: 'motifText')
          String? reasonText,
      @JsonKey(name: 'prioriteMedecin')
          required RecordPriority priorityForDoctor,
      @JsonKey(name: 'prioritePrestataire')
          RecordPriority? priorityForProvider,
      @JsonKey(name: 'typePrestation')
          ServiceType? serviceType,
      @JsonKey(name: 'dossierParentReference')
          String? parentRecordId,
      @JsonKey(name: 'informationMedicaleMulti', toJson: anyToJson)
          MedicalInformationGeneral? medicalInformationGeneral,
      @JsonKey(name: 'complements', toJson: anyListToJson)
          List<RecordComplement>? complements,
      @JsonKey(name: 'rapportMulti', toJson: anyToJson)
          RapportMulti? rapportMulti,
      @JsonKey(name: 'childRecords', toJson: anyListToJson)
          List<Record>? childRecords}) = _Record;

  factory Record.fromJson(Map<String, dynamic> json) => _$RecordFromJson(json);

  // Map<String, dynamic> toJson() => _$RecordToJson(this);
}
