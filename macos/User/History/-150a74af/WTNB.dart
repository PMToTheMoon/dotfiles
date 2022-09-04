import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:zanalys_api/src/models/record.dart';
import 'package:zanalys_api/src/network/request/update_push_token_body.dart';

part '../network/api/user_api.g.dart';

@RestApi()
abstract class GridAPI {
  factory GridAPI(Dio dio, {String baseUrl}) = _GridAPI;
}
