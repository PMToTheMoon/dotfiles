import 'package:chopper/chopper.dart';

final tbtClient = ChopperClient(
  baseUrl: 'https://avzfpks5v0.execute-api.eu-central-1.amazonaws.com/test',
  // converter: converter,
  // errorConverter: converter,
  services: [
    MyService.create(),
  ],
  // interceptors: [authHeader],
);
