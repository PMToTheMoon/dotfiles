import 'package:json_annotation/json_annotation.dart';
import 'package:models/models.dart';
import 'package:models/src/utils/utils.dart';
import 'medical_information/general_record_update_medical_information.dart';
part 'general_record_update.g.dart';

@JsonSerializable(explicitToJson: true)
class GeneralRecordUpdate {
  const GeneralRecordUpdate(
      {required this.id,
      required this.type,
      this.title,
      this.creationDate,
      required this.creatorId,
      this.shareDate,
      this.lastModifiedDate,
      this.closingDate,
      this.assignmentDate,
      this.patientConsent,
      this.trustedPersonConsent,
      this.trustedPersonFirstName,
      this.trustedPersonLastName,
      this.trustedPersonFamilyLink,
      required this.status,
      this.patientStatus,
      this.doctorProviderStatus,
      required this.patient,
      this.doctorId,
      this.doctorLastName,
      this.doctorFirstName,
      this.delegateDoctor,
      this.delegateDoctorLastName,
      this.delegateDoctorFirstName,
      this.establishmentId,
      this.providerId,
      this.providerLastName,
      this.providerFirstName,
      this.providerConsultationId,
      this.providerConsultation,
      this.providerSpecialty,
      this.paymentDate,
      this.groupAffectation,
      this.doctorAdvice,
      this.doctorAdviceDate,
      this.rapportValidationDate,
      this.toValidateOrReturn,
      this.paymentCode,
      this.billedToEstablishment,
      this.urgent,
      this.consultationBill,
      this.reason,
      this.reasonText,
      required this.priorityForDoctor,
      this.priorityForProvider,
      this.serviceType,
      this.parentRecordId,
      this.complements,
      required this.medicalInformationGeneral,
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
  final ProviderSpecialty? providerSpecialty;

  @JsonKey(name: 'datePaiement')
  final int? paymentDate;

  @JsonKey(name: 'groupeAffectation')
  final NetworkAffectation? groupAffectation;

  @JsonKey(name: 'avisMedecin')
  final String? doctorAdvice;

  @JsonKey(name: 'dateAvisMedecin')
  final int? doctorAdviceDate;

  @JsonKey(name: 'dateValidationRapport')
  final int? rapportValidationDate;

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

  @JsonKey(name: 'informationMedicale', toJson: anyToJson)
  final GeneralRecordUpdateMedicalInformation medicalInformationGeneral;

  @JsonKey(name: 'contexteMedical', toJson: anyToJson)
  final MedicalContext? medicalContext;

  Map<String, dynamic> toJson() => _$GeneralRecordUpdateToJson(this);
}
