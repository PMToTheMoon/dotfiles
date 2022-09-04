import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:models/models.dart';
import 'package:zanalys_api/src/record_api/models/new_rapport/new_rapport.dart';
import 'models/full_record_response.dart';
import 'models/requests/add_doctor_to_record_request.dart';
import 'record_api.dart';

export 'models/general_record_update.dart';
export 'models/medical_information/general_record_update_medical_information.dart';

mixin RecordApiClient {
  String get baseUrl;
  Dio get dio;

  late final RecordAPI _record = RecordAPI(dio, baseUrl: baseUrl);

  // RECORDS
  Future<List<CspUserRecordView>> cspUserRecords(String id) async {
    return _record.cspUserRecords(id);
  }

  Future<List<PatientRecordView>> patientRecords(String id) async {
    return _record.patientRecords(id);
  }

  /// Returns the newly created record id
  Future<String> newRecord(NewRecord record) async {
    return _record.newRecords(record);
  }

  // Retroshit workaround for formdata. We need to remove this dependency.
  Future<void> publishGeneralRecord(GeneralRecordUpdate record) async {
    final formData = FormData.fromMap({
      "jsonData": jsonEncode(record),
    });
    formData.fields.add(const MapEntry('nomsFichiersASupprimer', 'null'));
    await dio.post(
      '/api/dossier/envoyer',
      data: formData,
    );
  }

  Future<void> deleteRecord(String id) => _record.deleteRecord(id);

  Future<FullRecordResponse> fullRecord(String id) async {
    return _record.fullRecord(id);
  }

  Future<void> addComplementToRecord(
    String recordId,
    RecordComplement complement,
  ) {
    return _record.addComplementToRecord(recordId, complement);
  }

  Future<void> addRapportToGeneralRecord(
    String recordId,
    RapportGeneral rapport, {
    required bool completeRapport,
  }) async {
    ServiceType? serviceType;
    InPersonConsultationMode? inPersonConsultationMode;
    if (completeRapport == false) {
      if (rapport.teleExpertiseComment != null ||
          rapport.teleExpertiseSentDate != null ||
          rapport.teleExpertiseSynthesis != null) {
        serviceType = ServiceType.teleExpertise;
      } else if (rapport.comment != null ||
          rapport.sentDate != null ||
          rapport.synthesis != null) {
        serviceType = ServiceType.inPerson;
        inPersonConsultationMode = InPersonConsultationMode.webSite;
      }
    }

    final newRapport = NewRapport.general(
      rapport: rapport,
      completed: completeRapport,
      capturePayment: completeRapport,
      recordType: RecordType.general,
      recordId: recordId,
      serviceType: serviceType,
      inPersonConsultationMode: serviceType == ServiceType.inPerson
          ? InPersonConsultationMode.webSite
          : null,
      uploadedFilesToMakeDownloadableList: [],
    );
    final rapportJson = jsonEncode(newRapport.toJson());
    final rapportJson2 = jsonEncode(
      {
        "rapport": {
          "identifiant": 0,
          "referenceDossier": "DM660082639530",
          "prestataireMedecin": "UC959159903469",
          "capturePayment": null,
          "dateEnvoiPrestataireMedecin": null,
          "synthese": "M",
          "commentaire": "O",
          "syntheseTe": "M",
          "commentaireTe": "O",
          "dateEnvoiTeleexpertise": null,
          "interpretationMulti": null,
          "prestataireTechnique": null,
          "hasFeuilleSoins": null,
          "teletransmissionAutre": false
        },
        "completedRapport": false,
        "capturePayment": false,
        "typeDossier": "MULTI",
        "referenceDossier": "DM856344398722",
        "typePrestation": "TE",
        "presentielRdvMode": null,
        "finalTotalTTC": null,
        "uploadedFilesToMakeDownloadableList": [],
      },
    );
    final formData = FormData.fromMap({
      "jsonData": rapportJson,
    });
    formData.fields.add(const MapEntry('nomsFichiersASupprimer', '[]'));
    await dio.post(
      '/api/dossier/rapport/envoyer',
      data: formData,
    );
  }

  Future<void> addDoctorToRecord(
    String recordId,
    DoctorServiceRequest request,
  ) {
    return _record.addDoctorToRecord(
        recordId,
        AddDoctorToRecordRequest(
          providerId: request.doctorId,
          serviceType: request.service,
        ));
  }
}
