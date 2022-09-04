final providerConsultationFields = {
    
    jsonField(name: 'identifiant')
    int get id;

    // Id of expert
    jsonField(name: 'cpsUserId')
    String get cpsUSerId;

    jsonField(name: 'patientUserId')
    String get patientId;

    jsonField(name: 'consultationType')
    ConsultationType get consultationType;
    
    // ???
    jsonField(name: 'couleur')
    String get color;
    

    /**
     * Date du RDV (l'heure est toujours à minuit en UTC).
     * Remarque : Lue dans le fuseau de l'expert, cette date peut avoir une heure qui n'est pas à minuit.
     */
    jsonField(name: 'dateRdv')
    DateTime get date;

    //dateRdvMoment!: Moment; // Moment created by client from unix timestamp

    /** Date et heure de début du RDV dans le fuseau de l'expert **/
    jsonField(name: 'dateHeureDebut')
    DateTime get dateTime;

    jsonField(name: 'heureDebut!: number') // Number of minutes since midnight
    int get startHour;
  
   // Number of minutes since midnight
    jsonField(name: 'heureFin')
    int get endHour;
   
    jsonField(name: 'note')
    String get note;
  
    jsonField(name: 'creationDate')// Unix timestamp sended by server. Date creation of rdv
    DateTime get creationDate;

    jsonField(name: 'creatorUserId')// User id of creator of rdv
    statut!: EnumRdvStatut;

    jsonField(name: 'dossierReference')
    String get reference;
  
    jsonField(name: 'dossierParent')
    String get parentRecordId;

    jsonField(name: 'dossierType')
    RecordType get recordType;

    jsonField(name: 'dossierMotif')
    RecordReason get recordReason;

    jsonField(name: 'dossierStatut')
    RecordStatus get recordStatus;

    jsonField(name: 'dossierDateCreation') // Unix timestamp sent by server
    DateTime get recordCreationDate;

    jsonField(name: 'dossierTypePrestation')
    ServiceType get recordServiceType;

    // Those fields are only returned by server when dossierInfos is set on request
    // Name of medecin referent
    jsonField(name: 'cpsNom')
    String get cpsUserLastName;

    jsonField(name: 'cpsPrenom')
    String get cpsUserFirstName;
}
