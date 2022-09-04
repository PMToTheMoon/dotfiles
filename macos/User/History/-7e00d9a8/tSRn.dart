// YOUR_FILE.dart

import "dart:async";
import 'package:chopper/chopper.dart';
import 'package:http/http.dart';

// This is necessary for the generator to work.
part "YOUR_FILE.chopper.dart";

@ChopperApi(baseUrl: '/oauth')
abstract class AuthService extends ChopperService {
  @Post('/token')
  Future<Response<String>> token() {}

  static TodosListService create([ChopperClient client]) =>
      _$TodosListService(client);
}
