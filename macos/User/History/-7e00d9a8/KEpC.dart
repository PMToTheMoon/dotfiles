// YOUR_FILE.dart

import "dart:async";
import 'package:chopper/chopper.dart';

// This is necessary for the generator to work.
part "YOUR_FILE.chopper.dart";

@ChopperApi(baseUrl: '/oauth')
abstract class AuthService extends ChopperService {
  // A helper method that helps instantiating the service. You can omit this method and use the generated class directly instead.
  static TodosListService create([ChopperClient client]) =>
      _$TodosListService(client);
}
