import 'package:dio/dio.dart';
import 'package:models/models.dart';
import 'package:retrofit/retrofit.dart';

part 'establishment_api.g.dart';

@RestApi()
abstract class EstablishmentAPI {
  factory EstablishmentAPI(Dio dio, {String baseUrl}) = _EstablishmentAPI;

  @GET('/api/establishment/list/{id}')
  Future<List<NetworkDoctor>> getUserNetwork(@Path() String id);
}
