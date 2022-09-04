import 'dart:async';

import 'package:zanalys/app/environment.dart';
import 'package:zanalys/auth/services/auth_service.dart';
import 'package:zanalys_api/zanalys_api.dart' as api;

import 'models/user.dart';

export 'models/user.dart';

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
    _userStream = authService.userStream.listen(_onLoginUserReceived);
  }

  late final StreamSubscription<User> _userStream;

  Future<void> dispose() async {
    await _userStream.cancel();
  }

  Future<void> updatePushToken({required String token}) =>
      _client.updatePushToken(token: token);

  void _onLoginUserReceived(User user) {}

  late final api.ZanalysPrivateApiClient _client;
}
