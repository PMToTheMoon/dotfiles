import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:zanalys_api/src/grid_api/models/grid_request.dart';

import 'models/grid_patient_response.dart';
import 'models/grid_request.dart';

part 'grid_api.g.dart';

@RestApi()
abstract class GridAPI {
  factory GridAPI(Dio dio, {String baseUrl}) = _GridAPI;

  @POST('/api/grid/data')
  Future<String> data(GridRequest request) {
          FormData formData = new FormData.fromMap(body);
      var response = await dio.post(url, data: formData);
      return response.data;
  }
}
