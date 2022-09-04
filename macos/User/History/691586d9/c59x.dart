import 'dart:async';

import 'package:zanalys/app/environment.dart';
import 'package:zanalys/auth/services/auth_service.dart';
import 'package:zanalys/storage/storage_service.dart';
import 'package:zanalys_api/zanalys_api.dart' as api;

import 'models/user.dart';

export 'models/user.dart';

class UserService {
  UserService({
    required this.storage,
    required AppEnvironment environment,
    required AuthService authService,
  }) {
    _client = api.ZanalysPrivateApiClient(
      environment.rootURL,
      isDebug: environment.isDebugBuild,
      authenticationProvider: authService,
    );
    _loginUserStream = authService.userStream.listen(_onLoginUserReceived);
  }

  final StorageService storage;

  late final StreamSubscription<User> _loginUserStream;

  final _userStream = StreamController<User>.broadcast();

  User? _user;

  User? get user => _user;

  Stream<User> get userStream => _userStream.stream;

  Future<UserService> init() async {
    _user = await storage.getUser();
    return this;
  }

  Future<void> dispose() async {
    await _loginUserStream.cancel();
    await _userStream.close();
  }

  Future<void> updatePushToken({required String token}) =>
      _client.updatePushToken(token: token);

  Future<void> _onLoginUserReceived(User user) async {
    _user = user;
    await storage.saveUser(user);
  }

  late final api.ZanalysPrivateApiClient _client;
}
