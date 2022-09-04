import 'dart:convert';

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
  Future<GridPatientResponse> data({
    @Part() required GridType gridType,
    @Part() required int start,
    @Part() required int length,
    @Part() required int draw,
    @Part() List<GridFilter> filters = const [],
  });
}
