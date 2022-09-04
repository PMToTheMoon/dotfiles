import 'dart:async';

import 'package:chopper/chopper.dart';
import 'package:models/models.dart';

import 'json_serializable_converter.dart';
import 'candidate_service/candidate_service.dart';

final tbtClient = ChopperClient(
  baseUrl: 'https://avzfpks5v0.execute-api.eu-central-1.amazonaws.com/test',
  // converter: converter,
  services: [
    CandidateService.create(),
  ],
  // errorConverter: converter,
  // interceptors: [authHeader],
);
