import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:zanalys_api/src/grid_api/models/grid_filter.dart';

import 'models/grid_patient_response.dart';
import 'models/grid_request.dart';

part 'grid_api.g.dart';

@RestApi()
abstract class GridAPI {
  factory GridAPI(Dio dio, {String baseUrl}) = _GridAPI;

  @POST('/api/grid/data')
  Future<GridPatientResponse> data(
    @Part() GridType gridType,
    @Part() int start,
    @Part() int length,
    @Part() int draw,
    @Part() List<GridFilter> filters,
  );
}
