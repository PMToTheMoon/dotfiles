import 'package:chopper/chopper.dart';

final auth0Client = ChopperClient(
  baseUrl: "http://my-server:8000",
  services: [
    // Create and pass an instance of the generated service to the client
    TodosListService.create()
  ],
);
