import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'grid_api.g.dart';

@RestApi()
abstract class GridAPI {
  factory GridAPI(Dio dio, {String baseUrl}) = _GridAPI;
}
