import 'package:chopper/chopper.dart';
import 'package:models/models.dart';

import 'candidate/candidate_api.dart';

final jsonFactories = {
  Candidate: Candidate.fromJson,
};

final tbtClient = ChopperClient(
  baseUrl: 'https://avzfpks5v0.execute-api.eu-central-1.amazonaws.com/test',
  // converter: converter,
  // errorConverter: converter,
  services: [
    CandidateApi.create(),
  ],
  // interceptors: [authHeader],
);
