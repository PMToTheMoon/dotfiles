import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:zanalys_api/src/models/record.dart';
import 'package:zanalys_api/src/network/request/update_push_token_body.dart';

part 'user_api.g.dart';

@RestApi()
abstract class UserAPI {
  factory UserAPI(Dio dio, {String baseUrl}) = _UserAPI;

  @PUT('/api/notification/token')
  Future<String> updatePushToken(@Body() UpdatePushTokenBody body);

  @GET('/api/dossier/cpsUser/{id}/dossiers')
  Future<List<CspUserRecord>> getCspUserRecords(@Path('id') String id);

  @DELETE('/dossier/{id}')
  Future<void> deleteRecord(@Path('id') String id);
}
