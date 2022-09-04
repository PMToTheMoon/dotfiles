import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:zanalys_api/src/grid_api/models/grid_request.dart';

import 'models/grid_request.dart';

@RestApi()
class GridAPI {
  const GridAPI(this._dio);

  final Dio _dio;

  Future<String> data(GridRequest request) async {
    final formData = FormData.fromMap(request.toJson());
    var response = await _dio.post('/api/grid/data', data: formData);
    return response.data;
  }
}
