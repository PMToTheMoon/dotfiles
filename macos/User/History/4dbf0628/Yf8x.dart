import 'package:dio/dio.dart';
import 'package:models/models.dart';
import 'package:retrofit/retrofit.dart';
import 'package:zanalys_api/src/network/request/update_push_token_body.dart';
import 'package:zanalys_api/src/user_api/models/user_details.dart';

part 'establishment_api.g.dart';

@RestApi()
abstract class EstablishmentAPI {
  factory EstablishmentAPI(Dio dio, {String baseUrl}) = _EstablishmentAPI;

  @PUT('/api/notification/token')
  Future<String> updatePushToken(@Body() UpdatePushTokenBody body);

  @GET('/api/user/compte/{id}')
  Future<UserDetails> details(@Path() String id);

  @GET('/api/user/compte/{id}/userNetwork')
  Future<List<NetworkDoctor>> getUserNetwork(@Path() String id);
}
