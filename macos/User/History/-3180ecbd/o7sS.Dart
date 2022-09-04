
mixin EstablishmentApiClient {
  String get baseUrl;
  Dio get dio;
  
  late final _establishment = EstablishmentAPI(_dio, baseUrl: baseUrl);

}