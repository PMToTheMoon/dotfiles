import 'dart:async';

import 'package:zanalys/app/environment.dart';
import 'package:zanalys/auth/services/auth_service.dart';
import 'package:zanalys/user/models/user.dart';
import 'package:zanalys_api/zanalys_api.dart' as api;

class UserService {
  UserService({
    required AppEnvironment environment,
    required AuthService authService,
  }) {
    _client = api.ZanalysPrivateApiClient(
      environment.rootURL,
      isDebug: environment.isDebugBuild,
      authenticationProvider: authService,
    );
  }

  late final StreamSubscription<User> _userStream;

  Future<void> dispose() async {
    await 
  }

  Future<void> updatePushToken({required String token}) =>
      _client.updatePushToken(token: token);

  late final api.ZanalysPrivateApiClient _client;
}
