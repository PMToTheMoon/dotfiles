// PrestataireRdv
import 'package:built_value/built_value.dart';
import 'package:models/models.dart';
import 'package:models/src/records/record_type.dart';
import 'package:models/src/records/records.dart';

import 'consultation_type.dart';

abstract class ProviderConsultation {
    
    @BuiltValueField(wireName: 'identifiant')
    int get id;

    // Id of expert
    @BuiltValueField(wireName: 'cpsUserId')
    String get cpsUSerId;

    @BuiltValueField(wireName: 'patientUserId')
    String get patientId;

    @BuiltValueField(wireName: 'consultationType')
    ConsultationType get consultationType;
    
    // ???
    @BuiltValueField(wireName: 'couleur')
    String get color;
    

    /**
     * Date du RDV (l'heure est toujours à minuit en UTC).
     * Remarque : Lue dans le fuseau de l'expert, cette date peut avoir une heure qui n'est pas à minuit.
     */
    @BuiltValueField(wireName: 'dateRdv')
    DateTime get date;

    //dateRdvMoment!: Moment; // Moment created by client from unix timestamp

    /** Date et heure de début du RDV dans le fuseau de l'expert **/
    @BuiltValueField(wireName: 'dateHeureDebut')
    DateTime get dateTime;

    @BuiltValueField(wireName: 'heureDebut!: number') // Number of minutes since midnight
    int get startHour;
  
   // Number of minutes since midnight
    @BuiltValueField(wireName: 'heureFin')
    int get endHour;
   
    @BuiltValueField(wireName: 'note')
    String get note;
  
    @BuiltValueField(wireName: 'creationDate')// Unix timestamp sended by server. Date creation of rdv
    DateTime get creationDate;

    @BuiltValueField(wireName: 'creatorUserId')// User id of creator of rdv
    statut!: EnumRdvStatut;

    dossierReference!: string;
    String get reference;
  
    dossierParent: string;
    String parentRecordId;

    dossierType!: EnumDossierType;
    RecordType get recordType;

    dossierMotif!: EnumDossierMotif;
    RecordReason get recordReason;

    dossierStatut!: EnumDossierStatut;
    RecordStatus get recordStatus;

    dossierDateCreation!: number; // Unix timestamp sent by server
    DateTime get recordCreationDate;

    dossierTypePrestation!: EnumPrestationType;
    ServiceType get recordServiceType;

    // Those fields are only returned by server when dossierInfos is set on request
    // Name of medecin referent
    cpsNom!: string;
    String get cpsUserLastName;

    cpsPrenom!: string;
    String get cpsUserFirstName;
}
