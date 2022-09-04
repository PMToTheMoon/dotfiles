import 'package:built_value/built_value.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:models/models.dart';
import 'package:models/src/records/records.dart';

import 'consultation_bill.dart';

@JsonSerializable()
abstract class Record {
    /// Numéro de dossier Zanalys **/
    @JsonKey(name: 'reference')
    final String id;

     /** Type de dossier sent by server */
    @JsonKey(name: 'type')
    RecordType get type;

    /** Titre du parcours **/
    @JsonKey(name: 'titre')
    final String title;
    
    /// Date de création du dossier (DD/MM/YYYY)
    @JsonKey(name: 'dateCreation')
    DateTime get creationDate;
    
    /// Createur du dossier : CLIENT, CLIENT_DELEGUE ou ASSISTANT **/ 
    @JsonKey(name: 'createur')
    final String creatorType;
    
    /// * Date d'envoi du dossier (cad créé et envoyé par le référent)
	  /// Eventuellement égal à dateCreation si créé et envoyé d'un coup.
	  /// Eventuellement égal à dateAffectation si créé et affecté d'un coup.
    @JsonKey(name: 'dateEnvoi')
    DateTime get sharedDate;

    /// Date de dernière maj **/
    @JsonKey(name: 'dateMiseAJour')
    DateTime get lastModifiedDate;

    /// Date de cloture **/
    @JsonKey(name: 'dateCloture')
    DateTime get closingDate;
  
    /// Date d'affectation au prestataire
    @JsonKey(name: 'dateAffectation')
    DateTime get assignmentDate;

    /// Accord du patient **/
    @JsonKey(name: 'accordPatient')
    bool get patientConsent;

    /** Accord pers. confiance **/
    @JsonKey(name: 'accordPersonneConfiance')
    bool get trustedPersonConsent;

    /// Prenom pers. confiance **/
    @JsonKey(name: 'prenomPersConfiance')
    final String trustedPersonFirstName;

    /// Nom pers. confiance **/
    @JsonKey(name: 'nomPersConfiance')
    final String trustedPersonLastName;

    /** Prenom pers. confiance **/
    @JsonKey(name: 'lienParentePersConfiance')
    final String trustedPersonFamilyLink;

    /** Statut du dossier **/
    @JsonKey(name: 'statut')
    RecordStatus get status;
    
    /** Statut du dossier pour le patient **/
    @JsonKey(name: 'statutPatient')
    RecordStatus get patientStatus;
    
    /** Statut du dossier pour le prestataire **/
    @JsonKey(name: 'statutPrestataire')
    RecordStatus get dcotorProviderStatus;
    
    /** Patient lié au dossier **/
    @JsonKey(name: 'patient')
    Patient get patient;
    
    /// Medecin auquel est rattaché le dossier **/
    @JsonKey(name: 'string')
    final String doctorId;
    
    /** Nom et prénom du médecin */
    @JsonKey(name: 'medecinNom')
    final String doctorLastName;

    @JsonKey(name: 'medecinPrenom')
    final String doctorFirstName;
    
    /// Medecin ayant saisi le dossier pour le compte de DOSSIER_MEDECIN **/
    @JsonKey(name: 'delegue')
    final String delegateDoctor;
    
    /// Nom et prénom du délégué - uniquement si défini */
    @JsonKey(name: 'delegueNom')
    final String delegateDoctorLastName;

    @JsonKey(name: 'deleguePrenom')
    final String delegateDoctorFirstName;
    
    /// Etablissement auquel est rattaché le dossier **/
    @JsonKey(name: 'etablissement')
    final String establishmentId;
    
    /** Prestataire auquel est rattaché le dossier **/
    @JsonKey(name: 'prestataire')
    final String providerId;
    
    /** Nom, prénom et spécialité du prestataire - uniquement si défini */
    @JsonKey(name: 'prestataireNom')
    final String providerLastName;

    @JsonKey(name: 'prestatairePrenom')
    final String providerFirstName;

        /** RDV expert auquel est rattaché le dossier **/
    @JsonKey(name: 'prestataireRdvId')
    int get providerConsultationId;

    @JsonKey(name: 'prestataireRdv')
    : PrestataireRdv;

    @JsonKey(name: 'prestataireSpecialite'
    : PrestataireSpecialite;
    
    /** Date de paiement */
    @JsonKey(name: 'datePaiement')
    DateTime get paymentDate; 

	  /// Indique le groupe d'affectation pour l'envoi au prestataire :
    @JsonKey(name: 'groupeAffectation')
    : EnumDossierGroupeAffectation;
    /// Mon Réseau ou Réseau Zanalys

    /** Avis du Médecin **/
    @JsonKey(name: 'avisMedecin')
    DateTime get doctorAdvice;

    /** Dernière Date d'enregistrement de l'avis medecin **/
    @JsonKey(name: 'dateAvisMedecin')
    DateTime get doctorAdviceDate;

    /** Date de validation du rapport par le médecin **/
    @JsonKey(name: 'dateValidationRapport')
    DateTime get rapportValidationDate;

    /** Record to validate or to return flag **/
    @JsonKey(name: 'toValidateOrToReturn')
    final String toValidateOrReturn;

    /** Payment code **/
    @JsonKey(name: 'paymentCode')
    final String paymentCode;

    @JsonKey(name: 'billedToEstablishment')
    bool get billedToEstablishment;

    /** Si le dossier a été marqué urgent par le référent.
     * Cela autorise à facturer la majoration MCU si le RDV est pris dans le délai imparti **/
    @JsonKey(name: 'urgent')
    bool get urgent;


    /** Commande linked to rdv */
    @JsonKey(name: 'commandeRdv')
    final ConsultationBill consultationBill;

    @JsonKey(name: 'motif')
    final RecordReason reason;

    /** Priorité du dossier pour le médecin (le référent) */
    @JsonKey(name: 'prioriteMedecin')
    final RecordPriority  priorityForDoctor;
  
    /** Priorité du dossier pour le prestataire (l'expert) */
    @JsonKey(name: 'prioritePrestataire')
    final RecordPriority  priorityForProvider;

    /** Type de prestation (TC ou TE) */
    @JsonKey(name: 'typePrestation')
    final ServiceType serviceType;

  
    /** Dossier parent (Référence uniquement) */
    @JsonKey(name: 'dossierParentReference')
    final String parentRecordId;

    @JsonKey(name: 'dossiersEnfants')
    final List<Record> childRecords;

    //uploadedFilesToMakeDownloadableList!: DossierFichierPatient[];


    @JsonKey(name: 'complements')
: DossierComplement[];

    // abstract getRapport(): Rapport;
    // abstract getInformationMedicale(): InformationMedicale;
}


// abstract class Record {
//     /// Numéro de dossier Zanalys **/
//     @BuiltValueField(wireName: 'reference')
//     String get id;

//      /** Type de dossier sent by server */
//     @BuiltValueField(wireName: 'type')
//     RecordType get type;

//     /** Titre du parcours **/
//     @BuiltValueField(wireName: 'titre')
//     String get title;

    
//     /// Date de création du dossier (DD/MM/YYYY)
//     @BuiltValueField(wireName: 'dateCreation')
//     DateTime get creationDate;
    
//     /// Createur du dossier : CLIENT, CLIENT_DELEGUE ou ASSISTANT **/ 
//     @BuiltValueField(wireName: 'createur')
//     String get creatorType;
    
//     /// * Date d'envoi du dossier (cad créé et envoyé par le référent)
// 	  /// Eventuellement égal à dateCreation si créé et envoyé d'un coup.
// 	  /// Eventuellement égal à dateAffectation si créé et affecté d'un coup.
//     @BuiltValueField(wireName: 'dateEnvoi')
//     DateTime get sharedDate;

//     /// Date de dernière maj **/
//     @BuiltValueField(wireName: 'dateMiseAJour')
//     DateTime get lastModifiedDate;

//     /// Date de cloture **/
//     @BuiltValueField(wireName: 'dateCloture')
//     DateTime get closingDate;
  
//     /// Date d'affectation au prestataire
//     @BuiltValueField(wireName: 'dateAffectation')
//     DateTime get assignmentDate;

//     /// Accord du patient **/
//     @BuiltValueField(wireName: 'accordPatient')
//     bool get patientConsent;

//     /** Accord pers. confiance **/
//     @BuiltValueField(wireName: 'accordPersonneConfiance')
//     bool get trustedPersonConsent;

//     /// Prenom pers. confiance **/
//     @BuiltValueField(wireName: 'prenomPersConfiance')
//     String get trustedPersonFirstName;

//     /// Nom pers. confiance **/
//     @BuiltValueField(wireName: 'nomPersConfiance')
//     String get trustedPersonLastName;

//     /** Prenom pers. confiance **/
//     @BuiltValueField(wireName: 'lienParentePersConfiance')
//     String get trustedPersonFamilyLink;

//     /** Statut du dossier **/
//     @BuiltValueField(wireName: 'statut')
//     RecordStatus get status;
    
//     /** Statut du dossier pour le patient **/
//     @BuiltValueField(wireName: 'statutPatient')
//     RecordStatus get patientStatus;
    
//     /** Statut du dossier pour le prestataire **/
//     @BuiltValueField(wireName: 'statutPrestataire')
//     RecordStatus get dcotorProviderStatus;
    
//     /** Patient lié au dossier **/
//     @BuiltValueField(wireName: 'patient')
//     Patient get patient;
    
//     /// Medecin auquel est rattaché le dossier **/
//     @BuiltValueField(wireName: 'string')
//     String get doctorId;
    
//     /** Nom et prénom du médecin */
//     @BuiltValueField(wireName: 'medecinNom')
//     String get doctorLastName;

//     @BuiltValueField(wireName: 'medecinPrenom')
//     String get doctorFirstName;
    
//     /// Medecin ayant saisi le dossier pour le compte de DOSSIER_MEDECIN **/
//     @BuiltValueField(wireName: 'delegue')
//     String get delegateDoctor;
    
//     /// Nom et prénom du délégué - uniquement si défini */
//     @BuiltValueField(wireName: 'delegueNom')
//     String get delegateDoctorLastName;

//     @BuiltValueField(wireName: 'deleguePrenom')
//     String get delegateDoctorFirstName;
    
//     /// Etablissement auquel est rattaché le dossier **/
//     @BuiltValueField(wireName: 'etablissement')
//     String get establishmentId;
    
//     /** Prestataire auquel est rattaché le dossier **/
//     @BuiltValueField(wireName: 'prestataire')
//     String get providerId;
    
//     /** Nom, prénom et spécialité du prestataire - uniquement si défini */
//     @BuiltValueField(wireName: 'prestataireNom')
//     String get providerLastName;

//     @BuiltValueField(wireName: 'prestatairePrenom')
//     String get providerFirstName;

//         /** RDV expert auquel est rattaché le dossier **/
//     @BuiltValueField(wireName: 'prestataireRdvId')
//     int get providerConsultationId;

//     @BuiltValueField(wireName: 'prestataireRdv')
//     : PrestataireRdv;

//     @BuiltValueField(wireName: 'prestataireSpecialite'
//     : PrestataireSpecialite;
    
//     /** Date de paiement */
//     @BuiltValueField(wireName: 'datePaiement')
//     DateTime get paymentDate; 

// 	  /// Indique le groupe d'affectation pour l'envoi au prestataire :
//     @BuiltValueField(wireName: 'groupeAffectation')
//     : EnumDossierGroupeAffectation;
//     /// Mon Réseau ou Réseau Zanalys

//     /** Avis du Médecin **/
//     @BuiltValueField(wireName: 'avisMedecin')
//     DateTime get doctorAdvice;

//     /** Dernière Date d'enregistrement de l'avis medecin **/
//     @BuiltValueField(wireName: 'dateAvisMedecin')
//     DateTime get doctorAdviceDate;

//     /** Date de validation du rapport par le médecin **/
//     @BuiltValueField(wireName: 'dateValidationRapport')
//     DateTime get rapportValidationDate;

//     /** Record to validate or to return flag **/
//     @BuiltValueField(wireName: 'toValidateOrToReturn')
//     String get toValidateOrReturn;

//     /** Payment code **/
//     @BuiltValueField(wireName: 'paymentCode')
//     String get paymentCode;

//     @BuiltValueField(wireName: 'billedToEstablishment')
//     bool get billedToEstablishment;

//     /** Si le dossier a été marqué urgent par le référent.
//      * Cela autorise à facturer la majoration MCU si le RDV est pris dans le délai imparti **/
//     @BuiltValueField(wireName: 'urgent')
//     bool get urgent;


//     /** Commande linked to rdv */
//     @BuiltValueField(wireName: 'commandeRdv')
//     ConsultationBill get consultationBill;

//     @BuiltValueField(wireName: 'motif')
//     RecordReason get reason;

//     /** Priorité du dossier pour le médecin (le référent) */
//     @BuiltValueField(wireName: 'prioriteMedecin')
//     RecordPriority get priorityForDoctor;
  
//     /** Priorité du dossier pour le prestataire (l'expert) */
//     @BuiltValueField(wireName: 'prioritePrestataire')
//     RecordPriority get priorityForProvider;

//     /** Type de prestation (TC ou TE) */
//     @BuiltValueField(wireName: 'typePrestation')
//     ServiceType get serviceType;

  
//     /** Dossier parent (Référence uniquement) */
//     @BuiltValueField(wireName: 'dossierParentReference')
//     String get parentRecordId;

//     @BuiltValueField(wireName: 'dossiersEnfants')
//     List<Record> get childRecords;

//     //uploadedFilesToMakeDownloadableList!: DossierFichierPatient[];


//     @BuiltValueField(wireName: 'complements')
// : DossierComplement[];

//     // abstract getRapport(): Rapport;
//     // abstract getInformationMedicale(): InformationMedicale;
// }
