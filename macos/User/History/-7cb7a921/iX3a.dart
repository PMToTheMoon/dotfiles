import 'package:dio/dio.dart';
import 'package:models/models.dart';
import 'package:zanalys_api/src/patient_api/patient_api.dart';

mixin PatientApiMixin {
  String get baseUrl;
  Dio get dio;

  late final _patient = PatientAPI(dio, baseUrl: baseUrl);

  Future<List<Patient>> patientList(String filter, int maxResults) =>
      _patient.patientList(filter, maxResults);
}
