import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'patient_api.g.dart';

@RestApi()
abstract class PatientAPI {
  factory PatientAPI(Dio dio, {String baseUrl}) = _PatientAPI;

  @GET('/api/patient/list?info={info}&maxResults={maxResults}')
  Future<List<Patient>> patientList(
    @Query('info') String filter,
    @Query('maxResults') int maxResults,
  );
}
