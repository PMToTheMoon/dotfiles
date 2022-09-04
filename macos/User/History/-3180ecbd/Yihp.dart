import 'package:dio/dio.dart';
import 'package:zanalys_api/src/establishment/establishment_api.dart';

mixin EstablishmentApiClient {
  String get baseUrl;
  Dio get dio;
  
  late final _establishment = EstablishmentAPI(dio, baseUrl: baseUrl);

Future<List<Establishment>> doctorEstablishments(String id) =>
      _establishment.userEstablishments(id);
}