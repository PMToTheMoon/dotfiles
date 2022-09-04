import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:models/models.dart';
import 'package:zanalys_api/src/record_api/models/new_rapport/new_rapport.dart';
import 'models/full_record_response.dart';
import 'models/requests/add_doctor_to_record_request.dart';
import 'record_api.dart';
import 'request/close_record_request.dart';

export 'models/general_record_update.dart';
export 'models/medical_information/general_record_update_medical_information.dart';
export 'request/close_record_request.dart';

mixin RecordApiClient {
  String get baseUrl;
  Dio get dio;

  late final RecordAPI _record = RecordAPI(dio, baseUrl: baseUrl);

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

  // There are a lot of weird business rules here, careful!
  Future<void> addRapportToGeneralRecord(
    String recordId,
    RapportGeneral rapport, {
    required RecordStatus recordStatus,
    required bool completeRecord,
  }) async {
    ServiceType? serviceType;
    InPersonConsultationMode? inPersonConsultationMode;

    if (completeRecord == false ||
        (recordStatus == RecordStatus.waitingReport &&
            completeRecord == true)) {
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

    // else if (recordStatus == RecordStatus.waitingRapport) {
    //   // serviceType = ServiceType.teleExpertise;
    // }

    final newRapport = NewRapport.general(
      rapport: rapport,
      completed: completeRecord,
      capturePayment: completeRecord,
      recordType: RecordType.general,
      recordId: recordId,
      serviceType: serviceType,
      inPersonConsultationMode: inPersonConsultationMode,
      uploadedFilesToMakeDownloadableList: [],
    );
    final rapportJson = jsonEncode(newRapport.toJson());
    final formData = FormData.fromMap({
      'jsonData': rapportJson,
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

  Future<void> closeRecord(
    CloseRecordRequest request,
  ) async {
    final body = jsonEncode(request.toJson());
    final formData = FormData.fromMap({
      'jsonData': body,
    });
    formData.fields.add(const MapEntry('filesDescription', '[]'));
    formData.fields.add(const MapEntry('nomsFichiersASupprimer', '[]'));
    await dio.post(
      '/api/dossier/validerClotureDossier',
      data: formData,
    );
  }
}
