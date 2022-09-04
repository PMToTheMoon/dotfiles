import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:zanalys_api/src/network/request/update_push_token_body.dart';

part 'user_api.g.dart';

@RestApi()
abstract class UserAPI {
  factory UserAPI(Dio dio, {String baseUrl}) = _UserAPI;

  @PUT('/api/notification/token')
  Future<String> updatePushToken(@Body() UpdatePushTokenBody body);

  @GET('/api/user/compte/{id}')
  Future<Account> account(@Path('id') String id);
}
