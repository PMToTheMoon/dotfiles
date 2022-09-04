import 'package:dio/dio.dart';

import '../document_api/document_api_client.dart';
import '../establishment_api/establishment_api_client.dart';
import '../grid_api/grid_api_client.dart';
import '../patient_api/patient_api_client.dart';
import '../record_api/record_api_client.dart';
import '../user_api/user_api_client.dart';

import '_dio.dart';
import 'authentication_provider.dart';
export 'authentication_provider.dart';

class ZanalysPrivateApiClient
    with
        RecordApiClient,
        UserApiClient,
        GridApiClient,
        PatientApiClient,
        DocumentApiClient,
        EstablishmentApiClient {
  ZanalysPrivateApiClient(
    this.baseUrl, {
    bool isDebug = false,
    required AuthenticationProvider authenticationProvider,
  }) {
    dio = createDioPrivateClient(
      baseUrl: baseUrl,
      isDebug: isDebug,
      tokenProvider: () => authenticationProvider.bearerToken,
      refreshTokenCallback: authenticationProvider.refreshBearerToken,
    );
  }

  @override
  final String baseUrl;

  @override
  late final Dio dio;
}
