import 'dart:async';

import 'package:chopper/chopper.dart';
import 'package:tbt_api/src/constant.dart';

import 'auth_service/auth_service.dart';
import 'json_converter.dart';

export 'auth_service/auth_service.dart';

class TbtPublicClient {
  static final TbtPublicClient _instance = TbtPublicClient._();

  factory TbtPublicClient() => _instance;

  TbtPublicClient._()
      : _client = ChopperClient(
          baseUrl: baseUrl,
          converter: jsonConverter,
          errorConverter: TbtErrorConverter(),
          services: [
            AuthService.create(),
          ],
        );

  final ChopperClient _client;

  AuthService get auth => _client.getService();
}

class TbtErrorConverter extends ErrorConverter {
  @override
  FutureOr<Response> convertError<BodyType, InnerType>(Response response) {
    throw response;
  }
}
