import 'package:chopper/chopper.dart';
import 'package:tbt_api/src/constant.dart';

import 'converter/converter.dart';
import 'candidate_service/candidate_service.dart';

final tbtClient = ChopperClient(
  baseUrl: baseUrl,
  converter: jsonConverter,
  services: [
    CandidateService.create(),
  ],
  // errorConverter: converter,
  // interceptors: [authHeader],
);
