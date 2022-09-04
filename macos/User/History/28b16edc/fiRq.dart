import 'package:chopper/chopper.dart';

import 'login/login.dart';

export 'login/login.dart';

part 'auth_service.chopper.dart';

@ChopperApi()
abstract class AuthService extends ChopperService {
  static AuthService create([ChopperClient? client]) =>
      _$CandidateService(client);

  @Post(path: 'users/login')
  Future<Response<LoginResponse>> login(@Body() LoginRequest credentials);
}
