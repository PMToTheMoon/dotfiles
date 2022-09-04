import 'package:json_annotation/json_annotation.dart';
import 'package:models/src/utils/utils.dart';
import 'package:models/models.dart';
import 'medical_information/general_record_update_medical_information.dart';
part 'general_record_update.g.dart';

@JsonSerializable()
class GeneralRecordUpdate {
  const GeneralRecordUpdate(
      {@JsonKey(name: 'reference')
          required this.id,
      @JsonKey(name: 'type')
          required this.type,
      @JsonKey(name: 'titre')
          this.title,
      @JsonKey(name: 'dateCreation')
          this.creationDate,
      @JsonKey(name: 'createur')
          required this.creatorId,
      @JsonKey(name: 'dateEnvoi')
          this.shareDate,
      @JsonKey(name: 'dateMiseAJour')
          this.lastModifiedDate,
      @JsonKey(name: 'dateCloture')
          this.closingDate,
      @JsonKey(name: 'dateAffectation')
          this.assignmentDate,
      @JsonKey(name: 'accordPatient')
          this.patientConsent,
      @JsonKey(name: 'accordPersonneConfiance')
          this.trustedPersonConsent,
      @JsonKey(name: 'prenomPersConfiance')
          this.trustedPersonFirstName,
      @JsonKey(name: 'nomPersConfiance')
          this.trustedPersonLastName,
      @JsonKey(name: 'lienParentePersConfiance')
          this.trustedPersonFamilyLink,
      @JsonKey(name: 'statut')
          required this.status,
      @JsonKey(name: 'statutPatient')
          this.patientStatus,
      @JsonKey(name: 'statutPrestataire')
          this.doctorProviderStatus,
      @JsonKey(name: 'patient', toJson: anyToJson)
          required this.patient,
      @JsonKey(name: 'medecin')
          this.doctorId,
      @JsonKey(name: 'medecinNom')
          this.doctorLastName,
      @JsonKey(name: 'medecinPrenom')
          this.doctorFirstName,
      @JsonKey(name: 'delegue')
          this.delegateDoctor,
      @JsonKey(name: 'delegueNom')
          this.delegateDoctorLastName,
      @JsonKey(name: 'deleguePrenom')
          this.delegateDoctorFirstName,
      @JsonKey(name: 'etablissement')
          this.establishmentId,
      @JsonKey(name: 'prestataire')
          this.providerId,
      @JsonKey(name: 'prestataireNom')
          this.providerLastName,
      @JsonKey(name: 'prestatairePrenom')
          this.providerFirstName,
      @JsonKey(name: 'prestataireRdvId')
          this.providerConsultationId,
      @JsonKey(name: 'prestataireRdv', toJson: anyToJson)
          this.providerConsultation,
      @JsonKey(name: 'prestataireSpecialite', toJson: anyToJson)
          this.providerSpecialty,
      @JsonKey(name: 'datePaiement')
          this.paymentDate,
      @JsonKey(name: 'groupeAffectation')
          this.groupAffectation,
      @JsonKey(name: 'avisMedecin')
          this.doctorAdvice,
      @JsonKey(name: 'dateAvisMedecin')
          this.doctorAdviceDate,
      @JsonKey(name: 'dateValidationRapport')
          this.rapportValidationDate,
      @JsonKey(name: 'toValidateOrToReturn')
          this.toValidateOrReturn,
      @JsonKey(name: 'paymentCode')
          this.paymentCode,
      @JsonKey(name: 'billedToEstablishment')
          this.billedToEstablishment,
      @JsonKey(name: 'urgent')
          this.urgent,
      @JsonKey(name: 'commandeRdv', toJson: anyToJson)
          this.consultationBill,
      @JsonKey(name: 'motif')
          this.reason,
      @JsonKey(name: 'motifText')
          this.reasonText,
      @JsonKey(name: 'prioriteMedecin')
          required this.priorityForDoctor,
      @JsonKey(name: 'prioritePrestataire')
          this.priorityForProvider,
      @JsonKey(name: 'typePrestation')
          this.serviceType,
      @JsonKey(name: 'dossierParentReference')
          this.parentRecordId,
      @JsonKey(name: 'complements', toJson: anyListToJson)
          this.complements,
      @JsonKey(name: 'dossiersEnfants')
          required this.childRecords,
      @JsonKey(name: 'informationMedicale', toJson: anyToJson)
          required this.medicalInformationGeneral,
      @JsonKey(name: 'contexteMedical', toJson: anyToJson)
          this.medicalContext});

  factory GeneralRecordUpdate.fromJson(Map<String, dynamic> json) =>
      _$GeneralRecordUpdateFromJson(json);

  @JsonKey(name: 'reference')
  final String id;

  @JsonKey(name: 'type')
  final RecordType type;

  @JsonKey(name: 'titre')
  final String? title;

  @JsonKey(name: 'dateCreation')
  final String? creationDate;

  @JsonKey(name: 'createur')
  final String creatorId;

  @JsonKey(name: 'dateEnvoi')
  final int? shareDate;

  @JsonKey(name: 'dateMiseAJour')
  final int? lastModifiedDate;

  @JsonKey(name: 'dateCloture')
  final int? closingDate;

  @JsonKey(name: 'dateAffectation')
  final int? assignmentDate;

  @JsonKey(name: 'accordPatient')
  final bool? patientConsent;

  @JsonKey(name: 'accordPersonneConfiance')
  final bool? trustedPersonConsent;

  @JsonKey(name: 'prenomPersConfiance')
  final String? trustedPersonFirstName;

  @JsonKey(name: 'nomPersConfiance')
  final String? trustedPersonLastName;

  @JsonKey(name: 'lienParentePersConfiance')
  final String? trustedPersonFamilyLink;

  @JsonKey(name: 'statut')
  final RecordStatus status;

  @JsonKey(name: 'statutPatient')
  final RecordStatus? patientStatus;

  @JsonKey(name: 'statutPrestataire')
  final RecordStatus? doctorProviderStatus;

  @JsonKey(name: 'patient', toJson: anyToJson)
  final Patient patient;

  @JsonKey(name: 'medecin')
  final String? doctorId;

  @JsonKey(name: 'medecinNom')
  final String? doctorLastName;

  @JsonKey(name: 'medecinPrenom')
  final String? doctorFirstName;

  @JsonKey(name: 'delegue')
  final String? delegateDoctor;

  @JsonKey(name: 'delegueNom')
  final String? delegateDoctorLastName;

  @JsonKey(name: 'deleguePrenom')
  final String? delegateDoctorFirstName;

  @JsonKey(name: 'etablissement')
  final String? establishmentId;

  @JsonKey(name: 'prestataire')
  final String? providerId;

  @JsonKey(name: 'prestataireNom')
  final String? providerLastName;

  @JsonKey(name: 'prestatairePrenom')
  final String? providerFirstName;

  @JsonKey(name: 'prestataireRdvId')
  final int? providerConsultationId;

  @JsonKey(name: 'prestataireRdv', toJson: anyToJson)
  final ProviderConsultation? providerConsultation;

  @JsonKey(name: 'prestataireSpecialite', toJson: anyToJson)
  final DoctorSpecialty? providerSpecialty;

  @JsonKey(name: 'datePaiement')
  final int? paymentDate;

  @JsonKey(name: 'groupeAffectation')
  final NetworkAffectation? groupAffectation;

  @JsonKey(name: 'avisMedecin')
  final String? doctorAdvice;

  @JsonKey(name: 'dateAvisMedecin')
  final int? doctorAdviceDate;

  @JsonKey(name: 'dateValidationRapport')
  final String? rapportValidationDate;

  @JsonKey(name: 'toValidateOrToReturn')
  final String? toValidateOrReturn;

  @JsonKey(name: 'paymentCode')
  final String? paymentCode;

  @JsonKey(name: 'billedToEstablishment')
  final bool? billedToEstablishment;

  @JsonKey(name: 'urgent')
  final bool? urgent;

  @JsonKey(name: 'commandeRdv', toJson: anyToJson)
  final ConsultationBill? consultationBill;

  @JsonKey(name: 'motif')
  final RecordReason? reason;

  @JsonKey(name: 'motifText')
  final String? reasonText;

  @JsonKey(name: 'prioriteMedecin')
  final RecordPriority priorityForDoctor;

  @JsonKey(name: 'prioritePrestataire')
  final RecordPriority? priorityForProvider;

  @JsonKey(name: 'typePrestation')
  final ServiceType? serviceType;

  @JsonKey(name: 'dossierParentReference')
  final String? parentRecordId;

  @JsonKey(name: 'complements', toJson: anyListToJson)
  final List<RecordComplement>? complements;

  @JsonKey(name: 'dossiersEnfants')
  final List<GeneralRecordUpdate> childRecords;

  @JsonKey(name: 'informationMedicale', toJson: anyToJson)
  final GeneralRecordUpdateMedicalInformation medicalInformationGeneral;

  @JsonKey(name: 'contexteMedical', toJson: anyToJson)
  final MedicalContext? medicalContext;

  Map<String, dynamic> toJson() => _$GeneralRecordUpdateToJson(this);
}
