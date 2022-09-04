import 'package:dio/dio.dart';
import 'establishment_api.dart';
import 'package:models/models.dart';

mixin EstablishmentApiClient {
  String get baseUrl;
  Dio get dio;

  late final _establishment = EstablishmentAPI(dio, baseUrl: baseUrl);

  Future<List<Establishment>> doctorEstablishments(String id) =>
      _establishment.userEstablishments(id);
}
