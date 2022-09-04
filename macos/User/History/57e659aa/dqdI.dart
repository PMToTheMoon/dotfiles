import 'package:dio/dio.dart';

import 'package:zanalys_api/src/clients/private_client/document_api_client.dart';
import 'package:zanalys_api/src/clients/private_client/establishment_api_client.dart';
import 'package:zanalys_api/src/clients/private_client/grid_api_client.dart';
import 'package:zanalys_api/src/clients/private_client/patient_api_client.dart';
import 'package:zanalys_api/src/clients/private_client/record_api_client.dart';
import 'package:zanalys_api/src/clients/private_client/user_api_client.dart';

import '../_dio.dart';

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
