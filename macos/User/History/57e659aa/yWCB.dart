import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:logging/logging.dart';
import 'package:models/models.dart';
import 'package:zanalys_api/src/clients/private_client/document_api_client.dart';
import 'package:zanalys_api/src/clients/private_client/establishment_api_client.dart';
import 'package:zanalys_api/src/clients/private_client/grid_api_client.dart';
import 'package:zanalys_api/src/clients/private_client/patient_api_client.dart';
import 'package:zanalys_api/src/clients/private_client/record_api_client.dart';
import 'package:zanalys_api/src/clients/private_client/user_api_client.dart';
import 'package:zanalys_api/src/establishment/establishment_api.dart';
import 'package:zanalys_api/src/grid_api/models/grid_request.dart';
import 'package:zanalys_api/src/network/api/document_api.dart';
import 'package:zanalys_api/src/user_api/models/user_details.dart';

import '../_dio.dart';

class ZanalysPrivateApiClient
    with
        RecordApiMixin,
        UserApiClient,
        GridApiMixin,
        PatientApiClient,
        DocumentApiClient,
        EstablishmentApiClient {
  ZanalysPrivateApiClient(
    this.baseUrl, {
    bool isDebug = false,
    required AuthenticationProvider authenticationProvider,
  }) {
    final dio = createDioPrivateClient(
      baseUrl: baseUrl,
      isDebug: isDebug,
      tokenProvider: () => authenticationProvider.bearerToken,
      refreshTokenCallback: authenticationProvider.refreshBearerToken,
    );
    // return ZanalysPrivateApiClient._(baseUrl, dio);
  }

  @override
  final String baseUrl;

  @override
  late final Dio dio;
}
