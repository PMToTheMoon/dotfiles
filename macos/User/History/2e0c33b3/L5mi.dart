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
    final json = request.toJson();
    json['filterParameters'] = jsonEncode(request.filters);
    final formData = FormData.fromMap(json);
    var response = await _dio.post('/api/grid/data',
        data: formData,
        options: Options(headers: {
          'Accept': 'application/json',
          'Content-Type': 'multipart/form-data',
        }));
    return response.data;
  }
}
