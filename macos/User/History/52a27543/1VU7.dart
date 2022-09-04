import 'package:chopper/chopper.dart';
import 'package:models/models.dart';
import 'package:tbt_api/src/json_serializable_converter.dart';

import 'candidate/candidate.dart';

final jsonFactories = {
  Candidate: Candidate.fromJson,
};

final converter = JsonSerializableConverter(jsonFactories);

final tbtClient = ChopperClient(
  baseUrl: 'https://avzfpks5v0.execute-api.eu-central-1.amazonaws.com/test',
  converter: converter,
  // errorConverter: converter,
  services: [
    CandidateService.create(),
  ],
  // interceptors: [authHeader],
);
