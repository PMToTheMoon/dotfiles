// PrestataireRdv
abstract class ProviderConsultation {
    identifiant!: number;
    int get id;

    // Id of expert
    cpsUserId!: string;
    String get cpsUSerId;

    patientUserId!: string;
    String get patientId;

    consultationType!: ConsultationType;

    // ???
    couleur: string = '';
    String get color;

    /**
     * Date du RDV (l'heure est toujours à minuit en UTC).
     * Remarque : Lue dans le fuseau de l'expert, cette date peut avoir une heure qui n'est pas à minuit.
     */
    dateRdv!: number; // Unix timestamp sent by server
    DateTime get date;

    //dateRdvMoment!: Moment; // Moment created by client from unix timestamp


    /** Date et heure de début du RDV dans le fuseau de l'expert **/
    dateHeureDebut!: number;
    heureDebut!: number; // Number of minutes since midnight
    heureFin!: number; // Number of minutes since midnight
    note: string = '';
    creationDate!: number; // Unix timestamp sended by server. Date creation of rdv
    creatorUserId!: string; // User id of creator of rdv
    statut!: EnumRdvStatut;

    dossierReference!: string;
    dossierParent: string;
    dossierType!: EnumDossierType;
    dossierMotif!: EnumDossierMotif;
    dossierStatut!: EnumDossierStatut;
    dossierDateCreation!: number; // Unix timestamp sent by server
    dossierTypePrestation!: EnumPrestationType;

    // Those fields are only returned by server when dossierInfos is set on request
    // Name of medecin referent
    cpsNom!: string;
    cpsPrenom!: string;
}
