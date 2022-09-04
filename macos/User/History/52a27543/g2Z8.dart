import 'dart:async';

import 'package:chopper/chopper.dart';
import 'package:models/models.dart';

import 'json_serializable_converter.dart';
import 'candidate_service/candidate_service.dart';

final jsonFactories = {
  Candidate: Candidate.fromJson,
};

final converter = JsonSerializableConverter(jsonFactories);

final tbtClient = ChopperClient(
  baseUrl: 'https://avzfpks5v0.execute-api.eu-central-1.amazonaws.com/test',
  converter: converter,
  services: [
    CandidateService.create(),
  ],
  // errorConverter: converter,
  // interceptors: [authHeader],
);

final tbtAuthClient = ChopperClient(
  baseUrl: 'https://avzfpks5v0.execute-api.eu-central-1.amazonaws.com/test',
  converter: converter,
  authenticator: a,
  services: [
    CandidateService.create(),
  ],
);

class TbtPrivateClient {
  const TbtPrivateClient(this._authProvider);

  final BearerTokenProvider _authProvider;
}

class TbtAuthenticator extends Authenticator {
  @override
  FutureOr<Request?> authenticate(Request request, Response response,
      [Request? originalRequest]) {
    // TODO: implement authenticate
    throw UnimplementedError();
  }
}
