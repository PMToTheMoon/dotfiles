import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:logging/logging.dart';
import 'package:models/models.dart';
import 'package:zanalys_api/src/clients/private_client/record_api_client.dart';
import 'package:zanalys_api/src/establishment/establishment_api.dart';
import 'package:zanalys_api/src/grid_api/models/grid_request.dart';
import 'package:zanalys_api/src/network/api/document_api.dart';
import 'package:zanalys_api/src/user_api/models/user_details.dart';

import '../_dio.dart';

class ZanalysPrivateApiClient with RecordApiMixin {
  ZanalysPrivateApiClient(
    this.baseUrl, {
    bool isDebug = false,
    required AuthenticationProvider authenticationProvider,
  }) {
    final dio = createDioPrivateClient(
      baseUrl: baseUrl,
      isDebug: isDebug,
      tokenProvider: () => authenticationProvider.bearerToken,
      refreshTokenCallback: authenticationProvider.refreshBearerToken,
    );
    // return ZanalysPrivateApiClient._(baseUrl, dio);
  }

  @override
  final String baseUrl;

  @override
  final Dio dio;

  final DocumentAPI _document;

  final PatientAPI _patient;

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
        _patient = PatientAPI(_dio, baseUrl: baseUrl),
        _grid = GridAPI(_dio),
        _establishment = EstablishmentAPI(_dio, baseUrl: baseUrl);
}
