import 'package:built_value/built_value.dart';

abstract class Record {
    /// Numéro de dossier Zanalys **/
    @BuiltValueField(wireName: 'reference')
    String get id;
    
    /// Date de création du dossier (DD/MM/YYYY)
    @BuiltValueField(wireName: 'dateCreation')
    DateTime get creationDate;
    
    /// Createur du dossier : CLIENT, CLIENT_DELEGUE ou ASSISTANT **/ 
    createur: string;
    
    
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
    EnumDossierStatut;
    
    /** Statut du dossier pour le patient **/
    statutPatient: EnumDossierPatientStatut;
    
    /** Statut du dossier pour le prestataire **/
    statutPrestataire: EnumDossierPrestataireStatut;
    
    /** Patient lié au dossier **/
    patient: Patient;
    
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

    deleguePrenom: string;
    String get delegateDoctorFirstName;
    
    /// Etablissement auquel est rattaché le dossier **/
    etablissement: string;
    String get establishmentId;
    
    /** Prestataire auquel est rattaché le dossier **/
    prestataire: string;
    String get doctorProviderId;
    
    /** Nom, prénom et spécialité du prestataire - uniquement si défini */
    prestataireNom: string;
    String get doctorProviderLastName;

    prestatairePrenom: string;
    String get doctorProviderFirstName;

        /** RDV expert auquel est rattaché le dossier **/
    prestataireRdvId: number;
    int get doctorProviderConsultationId;

    prestataireRdv: PrestataireRdv;

    prestataireSpecialite: PrestataireSpecialite;
    
    /** Date de paiement */
    datePaiement: number;
    DateTime get paymentDate; 

	  /// Indique le groupe d'affectation pour l'envoi au prestataire :
    /// Mon Réseau ou Réseau Zanalys
    groupeAffectation: EnumDossierGroupeAffectation;

    /** Avis du Médecin **/
    avisMedecin: string;
    DateTime get doctorAdvice;

    /** Dernière Date d'enregistrement de l'avis medecin **/
    dateAvisMedecin: string;
    DateTime get doctorAdviceDate;

    /** Date de validation du rapport par le médecin **/
    dateValidationRapport: string;
    DateTime get rapportValidationDate;

    /** Record to validate or to return flag **/
    toValidateOrToReturn: string;

    /** Payment code **/
    paymentCode: string;
    String get paymentCode;

    billedToEstablishment: boolean;
    bool get billedToEstablishment;

    /** Si le dossier a été marqué urgent par le référent.
     * Cela autorise à facturer la majoration MCU si le RDV est pris dans le délai imparti **/
    urgent: boolean;
    bool get urgent;


    /** Commande linked to rdv */
    commandeRdv: CommandeRdv;

    motif: EnumDossierMotif;

    /** Priorité du dossier pour le médecin (le référent) */
    prioriteMedecin: EnumDossierPriorite;
    /** Priorité du dossier pour le prestataire (l'expert) */
    prioritePrestataire: EnumDossierPriorite;

    /** Type de prestation (TC ou TE) */
    typePrestation: EnumPrestationType;

    /** Type de dossier sent by server */
    type!: EnumDossierType;

    /** Dossier parent (Référence uniquement) */
    dossierParentReference: string;
    String get parentRecordId;

    dossiersEnfants: Dossier[] = [];
    List<Record> childRecords;

    //uploadedFilesToMakeDownloadableList!: DossierFichierPatient[];

    /** Titre du parcours **/
    titre: string;
    String get title;

    complements: DossierComplement[];

    // abstract getRapport(): Rapport;
    // abstract getInformationMedicale(): InformationMedicale;
}
