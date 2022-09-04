import 'package:built_value/built_value.dart';
import 'package:models/src/records/records.dart';

abstract class Record {
    /// Numéro de dossier Zanalys **/
    @BuiltValueField(wireName: 'reference')
    String get id;
    
    /// Date de création du dossier (DD/MM/YYYY)
    @BuiltValueField(wireName: 'dateCreation')
    DateTime get creationDate;
    
    /// Createur du dossier : CLIENT, CLIENT_DELEGUE ou ASSISTANT **/ 
    @BuiltValueField(wireName: 'createur')
    String get creatorType;
    
    /// * Date d'envoi du dossier (cad créé et envoyé par le référent)
	  /// Eventuellement égal à dateCreation si créé et envoyé d'un coup.
	  /// Eventuellement égal à dateAffectation si créé et affecté d'un coup.
    @BuiltValueField(wireName: 'dateEnvoi')
    DateTime get sharedDate;

    /// Date de dernière maj **/
    @BuiltValueField(wireName: 'dateMiseAJour')
    DateTime get lastModifiedDate;

    /// Date de cloture **/
    @BuiltValueField(wireName: 'dateCloture')
    DateTime get closingDate;
  
    /// Date d'affectation au prestataire
    @BuiltValueField(wireName: 'dateAffectation')
    DateTime get assignmentDate;

    /// Accord du patient **/
    @BuiltValueField(wireName: 'accordPatient')
    bool get patientConsent;

    /** Accord pers. confiance **/
    @BuiltValueField(wireName: 'accordPersonneConfiance')
    bool get trustedPersonConsent;

    /// Prenom pers. confiance **/
    @BuiltValueField(wireName: 'prenomPersConfiance')
    String get trustedPersonFirstName;

    /// Nom pers. confiance **/
    @BuiltValueField(wireName: 'nomPersConfiance')
    String get trustedPersonLastName;

    /** Prenom pers. confiance **/
    @BuiltValueField(wireName: 'lienParentePersConfiance')
    String get trustedPersonFamilyLink;

    /** Statut du dossier **/
    @BuiltValueField(wireName: 'statut')
    RecordStatus get status;
    
    /** Statut du dossier pour le patient **/
    @BuiltValueField(wireName: 'statutPatient')
    RecordStatus get patientStatus;
    
    /** Statut du dossier pour le prestataire **/
    @BuiltValueField(wireName: 'statutPrestataire')
    : EnumDossierPrestataireStatut;
    
    /** Patient lié au dossier **/
    @BuiltValueField(wireName: 'patient')
    : Patient;
    
    /// Medecin auquel est rattaché le dossier **/
    @BuiltValueField(wireName: 'string')
    String get doctorId;
    
    /** Nom et prénom du médecin */
    @BuiltValueField(wireName: 'medecinNom')
    String get doctorLastName;

    @BuiltValueField(wireName: 'medecinPrenom')
    String get doctorFirstName;
    
    /// Medecin ayant saisi le dossier pour le compte de DOSSIER_MEDECIN **/
    @BuiltValueField(wireName: 'delegue')
    String get delegateDoctor;
    
    /// Nom et prénom du délégué - uniquement si défini */
    @BuiltValueField(wireName: 'delegueNom')
    String get delegateDoctorLastName;

    @BuiltValueField(wireName: 'deleguePrenom')
    String get delegateDoctorFirstName;
    
    /// Etablissement auquel est rattaché le dossier **/
    @BuiltValueField(wireName: 'etablissement')
    String get establishmentId;
    
    /** Prestataire auquel est rattaché le dossier **/
    @BuiltValueField(wireName: 'prestataire')
    String get doctorProviderId;
    
    /** Nom, prénom et spécialité du prestataire - uniquement si défini */
    @BuiltValueField(wireName: 'prestataireNom')
    String get doctorProviderLastName;

    @BuiltValueField(wireName: 'prestatairePrenom')
    String get doctorProviderFirstName;

        /** RDV expert auquel est rattaché le dossier **/
    @BuiltValueField(wireName: 'prestataireRdvId')
    int get doctorProviderConsultationId;

    @BuiltValueField(wireName: 'prestataireRdv')
    : PrestataireRdv;

    @BuiltValueField(wireName: 'prestataireSpecialite'
    : PrestataireSpecialite;
    
    /** Date de paiement */
    @BuiltValueField(wireName: 'datePaiement')
    DateTime get paymentDate; 

	  /// Indique le groupe d'affectation pour l'envoi au prestataire :
    @BuiltValueField(wireName: 'groupeAffectation')
    : EnumDossierGroupeAffectation;
    /// Mon Réseau ou Réseau Zanalys

    /** Avis du Médecin **/
    @BuiltValueField(wireName: 'avisMedecin')
    DateTime get doctorAdvice;

    /** Dernière Date d'enregistrement de l'avis medecin **/
    @BuiltValueField(wireName: 'dateAvisMedecin')
    DateTime get doctorAdviceDate;

    /** Date de validation du rapport par le médecin **/
    @BuiltValueField(wireName: 'dateValidationRapport')
    DateTime get rapportValidationDate;

    /** Record to validate or to return flag **/
    @BuiltValueField(wireName: 'toValidateOrToReturn')
    String get toValidateOrReturn;

    /** Payment code **/
    @BuiltValueField(wireName: 'paymentCode')
    String get paymentCode;

    @BuiltValueField(wireName: 'billedToEstablishment')
    bool get billedToEstablishment;

    /** Si le dossier a été marqué urgent par le référent.
     * Cela autorise à facturer la majoration MCU si le RDV est pris dans le délai imparti **/
    @BuiltValueField(wireName: 'urgent')
    bool get urgent;


    /** Commande linked to rdv */
    @BuiltValueField(wireName: 'commandeRdv')
    : CommandeRdv;

    @BuiltValueField(wireName: 'motif')
    : EnumDossierMotif;

    /** Priorité du dossier pour le médecin (le référent) */
    @BuiltValueField(wireName: 'prioriteMedecin')
    : EnumDossierPriorite;
  
    /** Priorité du dossier pour le prestataire (l'expert) */
    @BuiltValueField(wireName: 'prioritePrestataire')
    : EnumDossierPriorite;

    /** Type de prestation (TC ou TE) */
    @BuiltValueField(wireName: 'typePrestation')
    : EnumPrestationType;

    /** Type de dossier sent by server */
    @BuiltValueField(wireName: 'type')
    : EnumDossierType;

    /** Dossier parent (Référence uniquement) */
    @BuiltValueField(wireName: 'dossierParentReference')
    String get parentRecordId;

    @BuiltValueField(wireName: 'dossiersEnfants')
    List<Record> childRecords;

    //uploadedFilesToMakeDownloadableList!: DossierFichierPatient[];

    /** Titre du parcours **/
    @BuiltValueField(wireName: 'titre')
    String get title;

    @BuiltValueField(wireName: 'complements')
: DossierComplement[];

    // abstract getRapport(): Rapport;
    // abstract getInformationMedicale(): InformationMedicale;
}
