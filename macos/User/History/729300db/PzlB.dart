import "dart:async";
import 'package:chopper/chopper.dart';

import 'YOUR_FILE.dart';

void main() async {
  final chopper = ChopperClient(
    baseUrl: "http://my-server:8000",
    services: [
      // Create and pass an instance of the generated service to the client
      TodosListService.create()
    ],
  );

  /// Get a reference to the client-bound service instance...
  final todosService = chopper.getService<TodosListService>();

  /// ... or create a new instance by explicitly binding it to a client.
  final anotherTodosService = TodosListService.create(chopper);

  /// Making a request is as easy as calling a function of the service.
  final response = await todosService.getTodos();

  if (response.isSuccessful) {
    // Successful request
    final body = response.body;
  } else {
    // Error code received from server
    final code = response.statusCode;
    final error = response.error;
  }
}
