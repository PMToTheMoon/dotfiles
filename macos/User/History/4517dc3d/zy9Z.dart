import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:models/models.dart';
import 'package:zanalys_api/src/grid_api/grid_api.dart';
import 'package:zanalys_api/src/grid_api/models/grid_patient_response.dart';
import 'package:zanalys_api/src/grid_api/models/grid_request.dart';

mixin GridApiClient {
  String get baseUrl;
  Dio get dio;

  late final _grid = GridAPI(dio);

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
}
