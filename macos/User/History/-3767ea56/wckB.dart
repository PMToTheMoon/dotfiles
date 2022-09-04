import 'package:bonemeal/bonemeal.dart';
import 'package:model_generators/model_generators.dart';

final providerConsultationFields = {
    
    jsonField('id', refer('int'), name: 'identifiant'),
    jsonField('cpsUserId', refer('String'), name: 'cpsUserId'),
    jsonField('patientId', refer('String'), name: 'patientUserId'),
    jsonField('consultationType', refer('ConsultationType'), name: 'consultationType'),
    jsonField('color', refer('String'), name: 'couleur'),
    jsonField('date', refer('DateTime'), name: 'dateRdv'),
    jsonField('dateRdvMoment', refer('Moment'), name: 'moment'),
    jsonField('dateTime', refer('DateTime'), name: 'dateHeureDebut'),
    jsonField('startHour', refer('int'), name: 'heureDebut!: number'),
    jsonField('endHour', refer('int'), name: 'heureFin'),
    jsonField('note', refer('String') ,name: 'note')
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
