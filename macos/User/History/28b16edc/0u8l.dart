import 'package:chopper/chopper.dart';

import 'login/login.dart';

abstract class AuthService extends ChopperService {
  static AuthService create([ChopperClient? client]) =>
      _$CandidateService(client);

  Future<Response<LoginResponse>> login(@Body() LoginRequest credentials);
}
