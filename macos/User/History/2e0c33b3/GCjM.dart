import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'models/grid_patient_response.dart';
import 'models/grid_request.dart';

part 'grid_api.g.dart';

@RestApi()
abstract class GridAPI {
  factory GridAPI(Dio dio, {String baseUrl}) = _GridAPI;

  Future<GridPatientResponse> patientList(@Body() GridRequest task);
}
