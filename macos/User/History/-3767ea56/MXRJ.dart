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
    jsonField('note', refer('String') ,name: 'note'),
    jsonField('creationDate', refer('DateTime'), name: 'creationDate'),
    jsonField('creatorId', refer('String'), name: 'creatorUserId'),
    jsonField('status', refer('EnumRdvStatut'), name: 'statut'),
    jsonField('reference', refer('String'), name: 'dossierReference'),
    jsonField('parentRecordId', refer('String'), name: 'dossierParent'),
    jsonField('recordType', refer('RecordType'), name: 'dossierType'),
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
