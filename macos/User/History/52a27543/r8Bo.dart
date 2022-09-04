import 'package:chopper/chopper.dart';

import 'candidate/candidate_api.dart';

final tbtClient = ChopperClient(
  baseUrl: 'https://avzfpks5v0.execute-api.eu-central-1.amazonaws.com/test',
  // converter: converter,
  // errorConverter: converter,
  services: [
    CandidateApi.create(),
  ],
  // interceptors: [authHeader],
);
