import 'package:chopper/chopper.dart';

final tbtClient = ChopperClient(
  baseUrl: "http://localhost:8000",
  // converter: converter,
  // errorConverter: converter,
  services: [
    MyService.create(),
  ],
  // interceptors: [authHeader],
);
