import 'package:chopper/chopper.dart';

import 'login/login.dart';

export 'login/login.dart';

@ChopperApi()
abstract class AuthService extends ChopperService {
  static AuthService create([ChopperClient? client]) =>
      _$CandidateService(client);

  Future<Response<LoginResponse>> login(@Body() LoginRequest credentials);
}
