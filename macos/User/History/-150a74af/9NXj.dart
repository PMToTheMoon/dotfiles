import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'patient_api.g.dart';

@RestApi()
abstract class PatientAPI {
  factory PatientAPI(Dio dio, {String baseUrl}) = _PatientAPI;
}
