import 'dart:async';

import 'package:chopper/chopper.dart';
import 'package:models/models.dart';
import 'package:tbt_api/src/constant.dart';

import 'candidate_service/candidate_service.dart';
import 'json_converter.dart';

class TbtPrivateClient {
  factory TbtPrivateClient(BearerTokenProvider authProvider) =>
      TbtPrivateClient._(
        TbtAuthenticator(authProvider),
      );

  TbtPrivateClient._(TbtAuthenticator authenticator)
      : _client = ChopperClient(
          baseUrl: baseUrl,
          converter: jsonConverter,
          authenticator: authenticator,
          interceptors: [
            authenticator.decorateRequest,
          ],
          services: [
            CandidateService.create(),
          ],
        );

  final ChopperClient _client;

  CandidateService get candidate => _client.getService();
}

class TbtAuthenticator extends Authenticator {
  TbtAuthenticator(this._authProvider);

  final BearerTokenProvider _authProvider;

  Request decorateRequest(Request request) {
    final token = _authProvider.bearerToken;
    return applyHeader(request, 'Authorization', 'Bearer $token');
  }

  @override
  FutureOr<Request?> authenticate(
    Request request,
    Response response, [
    Request? originalRequest,
  ]) async {
    if (response.statusCode == 401) {
      try {
        await _authProvider.refreshToken();
        return decorateRequest(request);
      } catch (e) {
        return null;
      }
    }
    return null;
  }
}
