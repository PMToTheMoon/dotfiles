import 'dart:async';

import 'package:zanalys/app/environment.dart';
import 'package:zanalys/storage/storage.dart';
import 'package:zanalys_api/zanalys_api.dart';

part 'exceptions.dart';

enum AuthStatus {
  unknown,
  authenticated,
  unauthenticated,
}

class AuthService implements AuthenticationProvider {
  AuthService({
    required this.storage,
    required AppEnvironment environment,
  }) : _authStatus = AuthStatus.unknown {
    _client = ZanalysPublicApiClient(
      environment.rootURL,
      isDebug: environment.isDebugBuild,
    );
  }

  final StorageService storage;

  late final ZanalysPublicApiClient _client;

  final _authStatusStream = StreamController<AuthStatus>.broadcast();
  final _userStream = StreamController<User>.broadcast();

  String? _bearerToken;

  AuthStatus _authStatus;

  String? identifier;

  User? _user;

  AuthStatus get status => _authStatus;

  Stream<AuthStatus> get statusStream => _authStatusStream.stream;

  User? get user => _user;

  Stream<User> get userStream => _userStream.stream;

  Future<AuthService> init() async {
    _user = await storage.getUser();
    return this;
  }

  Future<void> dispose() async {
    await _authStatusStream.close();
    await _userStream.close();
  }

  // Token is received only after otp
  Future<LogInStatus> login({
    required String identifier,
    required String password,
  }) =>
      _client.logIn(identifier: identifier, password: password);

  Future<bool> validateOTP({
    required String identifier,
    required String password,
    required String code,
  }) async {
    final session = await _client.validateOTP(
      identifier: identifier,
      password: password,
      code: code,
    );
    if (session != null) {
      await storage.saveRefreshToken(session.refreshToken);
      await _updateBearerToken(session.refreshToken);
      await storage.saveUser(session.user);
      _notifyStatusChange(AuthStatus.authenticated, session.user);
      return true;
    }
    return false;
  }

  Future<void> logout() async {
    await storage.clearSession();
    _notifyStatusChange(AuthStatus.unauthenticated);
  }

  @override
  String? getBearerToken() => _bearerToken;

  @override
  Future<void> refreshBearerToken() async {
    try {
      final refreshToken = await storage.getRefreshToken();
      if (refreshToken == null) throw 'refreshToken not found';
      final freshToken = await _client.refreshToken(refreshToken);
      if (freshToken == null) throw 'unable to refresh token';
      await _updateBearerToken(freshToken);
      _notifyStatusChange(AuthStatus.authenticated);
    } catch (e) {
      await logout();
    }
  }

  Future<void> _updateBearerToken(String? bearerToken) async {
    _bearerToken = bearerToken;
    await storage.saveBearerToken(bearerToken);
  }

  void _notifyStatusChange(AuthStatus status, [User? user]) {
    if (user != null) {
      _user = user;
      _userStream.add(user);
    }
    _authStatus = status;
    _authStatusStream.add(_authStatus);
  }
}
