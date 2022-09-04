import 'package:dio/dio.dart';
import 'zanalys-app-flutter/packages/zanalys_api/lib/src/establishment/establishment_api.dart';
mixin EstablishmentApiClient {
  String get baseUrl;
  Dio get dio;
  
  late final _establishment = EstablishmentAPI(dio, baseUrl: baseUrl);

Future<List<Establishment>> doctorEstablishments(String id) =>
      _establishment.userEstablishments(id);
}