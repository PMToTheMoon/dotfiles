import 'package:dio/dio.dart';
import 'package:models/models.dart';
import 'package:retrofit/retrofit.dart';

part 'establishment_api.g.dart';

@RestApi()
abstract class EstablishmentAPI {
  factory EstablishmentAPI(Dio dio, {String baseUrl}) = _EstablishmentAPI;

  @GET('/api/etablissement/list/{id}')
  Future<List<Establishment>> userEstablishments(@Path() String id);
}
