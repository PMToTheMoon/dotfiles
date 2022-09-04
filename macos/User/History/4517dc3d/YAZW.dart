import 'package:dio/dio.dart';
import 'package:zanalys_api/src/grid_api/grid_api.dart';

mixin GridApiMixin {
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
