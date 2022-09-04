import 'package:chopper/chopper.dart';
import 'package:tbt_api/src/constant.dart';

import 'json_converter.dart';
import 'candidate_service/candidate_service.dart';

final tbtClient = ChopperClient(
  baseUrl: baseUrl,
  converter: jsonConverter,
  services: [
    CandidateService.create(),
  ],
);

class TbtPublicClient {
  TbtPublicClient()
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
}
