import 'package:chopper/chopper.dart';
import 'package:models/models.dart';

class TbtPrivateClient {
  TbtPrivateClient(BearerTokenProvider authProvider)
      : _client = ChopperClient(
          baseUrl:
              'https://avzfpks5v0.execute-api.eu-central-1.amazonaws.com/test',
          converter: converter,
          authenticator: a,
          services: [
            CandidateService.create(),
          ],
        );

  final ChopperClient _client;
}

class TbtAuthenticator extends Authenticator {
  TbtAuthenticator(this._authProvider);

  final BearerTokenProvider _authProvider;

  @override
  FutureOr<Request?> authenticate(Request request, Response response,
      [Request? originalRequest]) {
    // TODO: implement authenticate
    throw UnimplementedError();
  }
}
