import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:logging/logging.dart';
import 'package:models/models.dart';
import 'package:zanalys_api/src/establishment/establishment_api.dart';
import 'package:zanalys_api/src/grid_api/models/grid_request.dart';
import 'package:zanalys_api/src/record_api/models/full_record_response.dart';
import 'package:zanalys_api/src/record_api/models/general_record_update.dart';
import 'package:zanalys_api/src/record_api/record_api.dart';
import 'package:zanalys_api/src/user_api/models/user_details.dart';

import '_dio.dart';

final _log = Logger('ZanalysPrivateApiClient');

class ZanalysPrivateApiClient {
  factory ZanalysPrivateApiClient(
    String baseUrl, {
    bool isDebug = false,
    required AuthenticationProvider authenticationProvider,
  }) {
    final dio = createDioPrivateClient(
      baseUrl: baseUrl,
      isDebug: isDebug,
      tokenProvider: () => authenticationProvider.bearerToken,
      refreshTokenCallback: authenticationProvider.refreshBearerToken,
    );
    return ZanalysPrivateApiClient._(baseUrl, dio);
  }

  final Dio _dio;

  final DocumentAPI _document;

  final UserAPI _user;

  final PatientAPI _patient;

  final RecordAPI record;

  final GridAPI _grid;

  final EstablishmentAPI _establishment;

  Future<String?> uploadDocument({
    required String path,
    required String accessCode,
    required DocumentType type,
  }) {
    return _document.upload(
        DocumentTypeMapper().convert(type).toString(), accessCode, File(path));
  }

  Future<void> updatePushToken({required String token}) {
    return _user.updatePushToken(UpdatePushTokenBody(token: token));
  }

  Future<PatientDetails> patientDetails(String id) async {
    final response = await _user.details(id);
    return response.mapOrNull(patient: (patient) => patient.user)!;
  }

  Future<List<Patient>> patientList(String filter, int maxResults) =>
      _patient.patientList(filter, maxResults);

  Future<List<Patient>> patientListForDoctor(
    String doctorId, {
    int? length,
    int? draw,
    int? start,
    List<Map<String, String>>? filters,
  }) async {
    final response = await _grid.data(
      GridRequest.patient(
        length: length ?? 0,
        draw: draw ?? 0,
        start: start ?? 0,
        filters: [
          {"dossierMedecinPrestataire": doctorId},
          ...?filters,
        ],
      ),
    );

    return GridPatientResponse.fromJson(jsonDecode(response)).data;
  }

  Future<List<NetworkDoctor>> doctorNetwork(String id) =>
      _user.getUserNetwork(id);

  Future<List<Establishment>> doctorEstablishments(String id) =>
      _establishment.userEstablishments(id);

  ZanalysPrivateApiClient._(String baseUrl, this._dio)
      : _document = DocumentAPI(_dio, baseUrl: baseUrl),
        _user = UserAPI(_dio, baseUrl: baseUrl),
        _patient = PatientAPI(_dio, baseUrl: baseUrl),
        _grid = GridAPI(_dio),
        _record = RecordAPI(_dio, baseUrl: baseUrl),
        _establishment = EstablishmentAPI(_dio, baseUrl: baseUrl);
}
