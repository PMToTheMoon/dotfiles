import 'package:dio/dio.dart';
import 'package:zanalys_api/src/grid_api/grid_api.dart';

mixin GridApiMixin {
  String get baseUrl;
  Dio get dio;

  late final _grid = GridAPI(dio);
}
